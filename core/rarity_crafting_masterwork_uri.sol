//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/utils/Base64.sol";
import "../library/Codex.sol";
import "../library/StringUtil.sol";

library masterwork_uri {
    ICodexSkills constant SKILLS_CODEX =
        ICodexSkills(0x67ae39a2Ee91D7258a86CD901B17527e19E493B3);
    ICodexWeapon constant WEAPONS_CODEX =
        ICodexWeapon(0x8834c3C74026468AE5d151bb77c2097E0184377e);
    ICodexArmor constant ARMOR_CODEX =
        ICodexArmor(0x763C2f6B31d0C695F7A6308a50E3f3107e65260c);
    ICodexTools constant TOOLS_CODEX =
        ICodexTools(0x291D890a0410Ac98512569330C2Ad4861dC6C822);

    struct Project {
        bool complete;
        uint8 base_type;
        uint8 item_type;
        uint64 started;
        uint256 crafter;
        uint256 progress;
        uint256 tools;
        uint256 xp;
    }

    struct Item {
        uint8 base_type;
        uint8 item_type;
        uint64 crafted;
        uint256 crafter;
    }

    function item_name(uint8 base_type, uint8 item_type)
        public
        pure
        returns (string memory result)
    {
        if (base_type == 2) {
            result = ARMOR_CODEX.item_by_id(item_type).name;
        } else if (base_type == 3) {
            result = WEAPONS_CODEX.item_by_id(item_type).name;
        } else if (base_type == 4) {
            result = TOOLS_CODEX.item_by_id(item_type).name;
        }
    }

    function project_uri(
        uint256 token,
        Project memory project,
        uint256 m,
        uint256 n
    ) public pure returns (string memory) {
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
                "category ",
                base_type_name(project.base_type),
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
                "item ",
                item_name(project.base_type, project.item_type),
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
                "crafter ",
                StringUtil.toString(project.crafter),
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
                "status ",
                status_string(project),
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
                "tools ",
                tools_string(project),
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
                "progress ",
                progress_string(m, n),
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
                "xp ",
                StringUtil.toString(project.xp / 1e18),
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
                StringUtil.toString(project.started),
                "</text>"
            )
        );
        svg = string(abi.encodePacked(svg, "</svg>"));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "project #',
                        StringUtil.toString(token),
                        '", "description": "Rarity tier 2 (Masterwork), non magical, item crafting.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(svg)),
                        '"}'
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function armor_uri(uint256 token, Item memory item)
        public
        pure
        returns (string memory)
    {
        uint256 y = 0;
        IArmor.Armor memory armor = ARMOR_CODEX.item_by_id(item.item_type);

        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350" shape-rendering="crispEdges"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" />';
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "category ",
                base_type_name(item.base_type),
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
                "name ",
                armor.name,
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
                "cost ",
                StringUtil.toString(armor.cost / 1e18),
                "gp</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "weight ",
                StringUtil.toString(armor.weight),
                "lb</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "proficiency ",
                ARMOR_CODEX.get_proficiency_by_id(armor.proficiency),
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
                "armor bonus ",
                StringUtil.toString(armor.armor_bonus),
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
                "max_dex ",
                StringUtil.toString(armor.max_dex_bonus),
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
                "penalty ",
                StringUtil.toString(armor.penalty),
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
                "spell failure ",
                StringUtil.toString(armor.spell_failure),
                "%</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "bonus</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="20" y="',
                StringUtil.toString(y),
                '" class="base">',
                "-1 Armor Check Penalty</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "description ",
                armor.description,
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
                "crafter ",
                StringUtil.toString(item.crafter),
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
                "crafted ",
                StringUtil.toString(item.crafted),
                "</text>"
            )
        );
        svg = string(abi.encodePacked(svg, "</svg>"));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "item #',
                        StringUtil.toString(token),
                        '", "description": "Rarity tier 2 (Masterwork), non magical, item crafting.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(svg)),
                        '"}'
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function weapon_uri(uint256 token, Item memory item)
        public
        pure
        returns (string memory)
    {
        uint256 y = 0;
        IWeapon.Weapon memory weapon = WEAPONS_CODEX.item_by_id(item.item_type);

        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350" shape-rendering="crispEdges"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" />';
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "category ",
                base_type_name(item.base_type),
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
                "name ",
                weapon.name,
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
                "cost ",
                StringUtil.toString(weapon.cost / 1e18),
                "gp</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "weight ",
                StringUtil.toString(weapon.weight),
                "lb</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "proficiency ",
                WEAPONS_CODEX.get_proficiency_by_id(weapon.proficiency),
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
                "encumbrance ",
                WEAPONS_CODEX.get_encumbrance_by_id(weapon.encumbrance),
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
                "damage 1d",
                StringUtil.toString(weapon.damage),
                ", ",
                WEAPONS_CODEX.get_damage_type_by_id(weapon.damage_type),
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
                "(modifier) x critical (",
                StringUtil.toString(weapon.critical_modifier),
                ") x ",
                StringUtil.toString(weapon.critical),
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
                "range ",
                StringUtil.toString(weapon.range_increment),
                "ft</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "bonus</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="20" y="',
                StringUtil.toString(y),
                '" class="base">',
                "+1 Attack</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "description ",
                weapon.description,
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
                "crafter ",
                StringUtil.toString(item.crafter),
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
                "crafted ",
                StringUtil.toString(item.crafted),
                "</text>"
            )
        );
        svg = string(abi.encodePacked(svg, "</svg>"));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "item #',
                        StringUtil.toString(token),
                        '", "description": "Rarity tier 2 (Masterwork), non magical, item crafting.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(svg)),
                        '"}'
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function tools_uri(uint256 token, Item memory item)
        public
        pure
        returns (string memory)
    {
        uint256 y = 0;
        ITools.Tools memory tools = TOOLS_CODEX.item_by_id(item.item_type);

        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350" shape-rendering="crispEdges"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" />';
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "category ",
                base_type_name(item.base_type),
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
                "name ",
                tools.name,
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
                "cost ",
                StringUtil.toString(tools.cost / 1e18),
                "gp</text>"
            )
        );
        y += 20;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "weight ",
                StringUtil.toString(tools.weight),
                "lb</text>"
            )
        );

        y += 20;
        (
            string memory bonus_fragment,
            uint256 y_after_bonus
        ) = tools_bonus_svg_fragment(tools, y);
        svg = string(abi.encodePacked(svg, bonus_fragment));

        y = y_after_bonus;
        svg = string(
            abi.encodePacked(
                svg,
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">',
                "description ",
                tools.description,
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
                "crafter ",
                StringUtil.toString(item.crafter),
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
                "crafted ",
                StringUtil.toString(item.crafted),
                "</text>"
            )
        );
        svg = string(abi.encodePacked(svg, "</svg>"));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "item #',
                        StringUtil.toString(token),
                        '", "description": "Rarity tier 2 (Masterwork), non magical, item crafting.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(svg)),
                        '"}'
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function base_type_name(uint8 base_type)
        internal
        pure
        returns (string memory result)
    {
        if (base_type == 2) {
            result = "Armor";
        } else if (base_type == 3) {
            result = "Weapons";
        } else if (base_type == 4) {
            result = "Tools";
        }
    }

    function status_string(Project memory project)
        internal
        pure
        returns (string memory)
    {
        if (project.complete) return "Complete";
        return "Crafting";
    }

    function tools_string(Project memory project)
        internal
        pure
        returns (string memory)
    {
        if (project.tools > 0) return "Masterwork Artisan's Tools";
        return "Common Artisan's Tools (Rental)";
    }

    function progress_string(uint256 m, uint256 n)
        internal
        pure
        returns (string memory)
    {
        return
            string(abi.encodePacked(StringUtil.toString((m * 100) / n), "%"));
    }

    function tools_bonus_svg_fragment(ITools.Tools memory tools, uint256 y)
        internal
        pure
        returns (string memory result, uint256 new_y)
    {
        result = string(
            abi.encodePacked(
                '<text x="10" y="',
                StringUtil.toString(y),
                '" class="base">bonus</text>'
            )
        );
        y += 20;
        for (uint256 i = 0; i < 36; i++) {
            int8 bonus = tools.skill_bonus[i];
            string memory sign = "";
            if (bonus != 0) {
                if (bonus > 0) sign = "+";
                (, string memory name, , , , , , ) = SKILLS_CODEX.skill_by_id(
                    i + 1
                );
                result = string(
                    abi.encodePacked(
                        result,
                        '<text x="20" y="',
                        StringUtil.toString(y),
                        '" class="base">',
                        sign,
                        StringUtil.toString(bonus),
                        " ",
                        name,
                        "</text>"
                    )
                );
                y += 20;
            }
        }
        new_y = y;
    }
}
