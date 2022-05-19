//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/utils/Base64.sol";
import "../library/Codex.sol";
import "../library/Combat.sol";
import "../library/Crafting.sol";
import "../library/Equipment.sol";
import "../library/Monster.sol";
import "../library/StringUtil.sol";

library adventure_uri {
    address constant RARITY =
        address(0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb);
    IRarityEquipment constant EQUIPMENT =
        IRarityEquipment(0xB6Ee6A99d474a30C9C407E7f32a88fF82071FDC0);

    struct Adventure {
        bool dungeon_entered;
        bool combat_ended;
        bool search_check_rolled;
        bool search_check_succeeded;
        bool search_check_critical;
        uint8 monster_count;
        uint8 monsters_defeated;
        uint8 combat_round;
        uint64 started;
        uint64 ended;
        uint256 summoner;
    }

    function tokenURI(
        uint256 token,
        Adventure memory adventure,
        Combat.Combatant[] memory turn_order,
        Equipment.Slot[3] memory loadout,
        uint8[] memory monsters
    ) public view returns (string memory) {
        uint256 y = 0;
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350" shape-rendering="crispEdges"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" />';

        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "status ",
                status_string(adventure, turn_order),
                "</text>"
            )
        );

        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "summoner ",
                summoner_string(adventure, turn_order),
                "</text>"
            )
        );

        y += 20;
        (
            string memory loadout_fragment,
            uint256 y_after_loadout
        ) = loadout_svg_fragment(loadout, y);
        svg = string(abi.encodePacked(svg, loadout_fragment));

        y = y_after_loadout + 20;
        (
            string memory monster_fragment,
            uint256 y_after_monsters
        ) = monsters_svg_fragment(turn_order, monsters, y);
        svg = string(abi.encodePacked(svg, monster_fragment));

        y = y_after_monsters + 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "loot ",
                loot_string(adventure, turn_order, monsters),
                "</text>"
            )
        );

        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "started ",
                StringUtil.toString(adventure.started),
                "</text>"
            )
        );

        y += 20;
        if (adventure.ended > 0)
            svg = string(
                abi.encodePacked(
                    svg,
                    '<text x="10" y="',
                    StringUtil.toString(y),
                    '" class="base">',
                    "ended ",
                    StringUtil.toString(adventure.ended),
                    "</text>"
                )
            );
        else
            svg = string(
                abi.encodePacked(
                    svg,
                    '<text x="10" y="',
                    StringUtil.toString(y),
                    '" class="base">',
                    "ended --</text>"
                )
            );
        svg = string(abi.encodePacked(svg, "</svg>"));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "adventure #',
                        StringUtil.toString(token),
                        '", "description": "Rarity Adventure 2: Monsters in the Barn. Fight, claim salvage, craft masterwork items.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(svg)),
                        '"}'
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function status_string(
        Adventure memory adventure,
        Combat.Combatant[] memory turn_order
    ) public pure returns (string memory result) {
        if (outside_dungeon(adventure)) result = "Outside the dungeon";
        else if (en_combat(adventure))
            result = string(
                abi.encodePacked(
                    "Combat in Round",
                    " ",
                    StringUtil.toString(adventure.combat_round)
                )
            );
        else if (combat_over(adventure)) result = "Looting";
        else if (ended(adventure)) {
            if (victory(adventure)) {
                result = string(
                    abi.encodePacked(
                        "Victory! during Round",
                        " ",
                        StringUtil.toString(adventure.combat_round)
                    )
                );
            } else {
                if (fled(adventure, turn_order)) {
                    result = string(
                        abi.encodePacked(
                            "Fled during Round",
                            " ",
                            StringUtil.toString(adventure.combat_round)
                        )
                    );
                } else {
                    result = string(
                        abi.encodePacked(
                            "Defeat during Round",
                            " ",
                            StringUtil.toString(adventure.combat_round)
                        )
                    );
                }
            }
        }
    }

    function summoner_string(
        Adventure memory adventure,
        Combat.Combatant[] memory turn_order
    ) public pure returns (string memory result) {
        result = StringUtil.toString(adventure.summoner);
        uint256 turn_count = turn_order.length;
        for (uint256 i = 0; i < turn_count; i++) {
            if (turn_order[i].mint == RARITY) {
                result = string(
                    abi.encodePacked(
                        result,
                        " (",
                        StringUtil.toString(turn_order[i].hit_points),
                        "hp)"
                    )
                );
            }
        }
    }

    function monsters_svg_fragment(
        Combat.Combatant[] memory turn_order,
        uint8[] memory monsters,
        uint256 y
    ) public pure returns (string memory result, uint256 new_y) {
        result = string(
            abi.encodePacked(
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">monsters</text>'
            )
        );

        if (monsters.length == 0) {
            y += 20;
            result = string(
                abi.encodePacked(
                    result,
                    '<text x="20" y="',
                    StringUtil.toString(y),
                    '" class="base">--</text>'
                )
            );
        } else {
            uint256 monster_index = 0;
            uint256 turn_count = turn_order.length;
            for (uint256 i = 0; i < turn_count; i++) {
                if (turn_order[i].mint != RARITY) {
                    y += 20;
                    result = string(
                        abi.encodePacked(
                            result,
                            '<text x="20" y="',
                            StringUtil.toString(y),
                            '" class="base">',
                            Monster
                                .monster_by_id(monsters[monster_index++])
                                .name,
                            " (",
                            StringUtil.toString(turn_order[i].hit_points),
                            "hp)",
                            "</text>"
                        )
                    );
                }
            }
        }

        new_y = y;
    }

    function loadout_svg_fragment(Equipment.Slot[3] memory loadout, uint256 y)
        public
        view
        returns (string memory result, uint256 new_y)
    {
        result = string(
            abi.encodePacked(
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">loadout</text>'
            )
        );

        Equipment.Slot memory weapon_slot = loadout[0];
        Equipment.Slot memory armor_slot = loadout[1];
        Equipment.Slot memory shield_slot = loadout[2];

        y += 20;
        if (weapon_slot.mint == address(0)) {
            result = string(
                abi.encodePacked(
                    result,
                    '<text x="20" y="',
                    StringUtil.toString(y),
                    '" class="base">Unarmed</text>'
                )
            );
        } else {
            (, uint8 item_type, , ) = ICrafting(weapon_slot.mint).items(
                weapon_slot.token
            );
            result = string(
                abi.encodePacked(
                    result,
                    '<text x="20" y="',
                    StringUtil.toString(y),
                    '" class="base">',
                    ICodexWeapon(EQUIPMENT.codexes(weapon_slot.mint, 3))
                        .item_by_id(item_type)
                        .name,
                    "</text>"
                )
            );
        }

        if (armor_slot.mint == address(0) && shield_slot.mint == address(0)) {
            y += 20;
            result = string(
                abi.encodePacked(
                    result,
                    '<text x="20" y="',
                    StringUtil.toString(y),
                    '" class="base">Unarmored</text>'
                )
            );
        } else {
            if (armor_slot.mint != address(0)) {
                (, uint8 item_type, , ) = ICrafting(armor_slot.mint).items(
                    armor_slot.token
                );
                y += 20;
                result = string(
                    abi.encodePacked(
                        result,
                        '<text x="20" y="',
                        StringUtil.toString(y),
                        '" class="base">',
                        ICodexArmor(EQUIPMENT.codexes(armor_slot.mint, 2))
                            .item_by_id(item_type)
                            .name,
                        "</text>"
                    )
                );
            }
            if (shield_slot.mint != address(0)) {
                (, uint8 item_type, , ) = ICrafting(shield_slot.mint).items(
                    shield_slot.token
                );
                y += 20;
                result = string(
                    abi.encodePacked(
                        result,
                        '<text x="20" y="',
                        StringUtil.toString(y),
                        '" class="base">',
                        ICodexArmor(EQUIPMENT.codexes(shield_slot.mint, 2))
                            .item_by_id(item_type)
                            .name,
                        "</text>"
                    )
                );
            }
        }

        new_y = y;
    }

    function outside_dungeon(adventure_uri.Adventure memory adventure)
        public
        pure
        returns (bool)
    {
        return !adventure.dungeon_entered && adventure.ended == 0;
    }

    function en_combat(adventure_uri.Adventure memory adventure)
        public
        pure
        returns (bool)
    {
        return
            adventure.dungeon_entered &&
            !adventure.combat_ended &&
            adventure.ended == 0;
    }

    function combat_over(adventure_uri.Adventure memory adventure)
        public
        pure
        returns (bool)
    {
        return
            adventure.dungeon_entered &&
            adventure.combat_ended &&
            adventure.ended == 0;
    }

    function ended(adventure_uri.Adventure memory adventure)
        public
        pure
        returns (bool)
    {
        return adventure.ended > 0;
    }

    function victory(adventure_uri.Adventure memory adventure)
        public
        pure
        returns (bool)
    {
        return adventure.monster_count == adventure.monsters_defeated;
    }

    function fled(
        adventure_uri.Adventure memory adventure,
        Combat.Combatant[] memory turn_order
    ) public pure returns (bool result) {
        if (
            combat_over(adventure) &&
            adventure.monster_count > adventure.monsters_defeated
        ) {
            uint256 turn_count = turn_order.length;
            for (uint256 i = 0; i < turn_count; i++) {
                if (turn_order[i].mint == RARITY) {
                    return turn_order[i].hit_points > -1;
                }
            }
        }
    }

    function count_loot(
        adventure_uri.Adventure memory adventure,
        Combat.Combatant[] memory turn_order,
        uint8[] memory monsters
    ) public view returns (uint256) {
        if (!victory(adventure)) return 0;

        uint256 reward = 0;
        uint256 monster_index = 0;
        uint8 turn_count = adventure.monster_count + 1;
        for (uint256 i = 0; i < turn_count; i++) {
            Combat.Combatant memory combatant = turn_order[i];
            if (combatant.mint == address(this)) {
                reward += Monster
                    .monster_by_id(monsters[monster_index++])
                    .challenge_rating;
            }
        }

        if (adventure.search_check_succeeded) {
            if (adventure.search_check_critical) {
                reward = (6 * reward) / 5;
            } else {
                reward = (23 * reward) / 20;
            }
        }

        return (reward * 1e18) / 10;
    }

    function loot_string(
        Adventure memory adventure,
        Combat.Combatant[] memory turn_order,
        uint8[] memory monsters
    ) public view returns (string memory result) {
        result = "--";
        if (ended(adventure) && victory(adventure))
            result = string(
                abi.encodePacked(
                    StringUtil.toString(
                        count_loot(adventure, turn_order, monsters) / 1e18
                    ),
                    " Salvage"
                )
            );
    }
}
