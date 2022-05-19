//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "../library/Codex.sol";
import "../library/Combat.sol";
import "../library/Crafting.sol";
import "../library/Equipment.sol";
import "../library/ForItems.sol";
import "../library/ForSummoners.sol";
import "../library/Proficiency.sol";

contract rarity_equipment_2 is
    ERC721Holder,
    ReentrancyGuard,
    ForSummoners,
    ForItems
{
    address[2] public MINT_WHITELIST;

    mapping(uint256 => mapping(uint8 => Equipment.Slot)) public slots;
    mapping(uint256 => uint256) public encumberance;
    mapping(address => mapping(uint256 => address)) public codexes;
    mapping(address => mapping(uint256 => mapping(uint256 => mapping(uint8 => Equipment.Slot))))
        public snapshots;

    event Equip(
        address indexed owner,
        uint256 indexed summoner,
        uint8 slot_type,
        address mint,
        uint256 token
    );
    event Unequip(
        address indexed owner,
        uint256 indexed summoner,
        uint8 slot_type,
        address mint,
        uint256 token
    );

    function set_mint_whitelist(
        address common,
        address common_armor_codex,
        address common_weapon_codex,
        address masterwork,
        address masterwork_armor_codex,
        address masterwork_weapon_codex
    ) public {
        require(MINT_WHITELIST[0] == address(0), "already set");

        MINT_WHITELIST[0] = common;
        codexes[common][2] = common_armor_codex;
        codexes[common][3] = common_weapon_codex;

        MINT_WHITELIST[1] = masterwork;
        codexes[masterwork][2] = masterwork_armor_codex;
        codexes[masterwork][3] = masterwork_weapon_codex;
    }

    function whitelisted(address mint) internal view returns (bool) {
        return mint == MINT_WHITELIST[0] || mint == MINT_WHITELIST[1];
    }

    function equip(
        uint256 summoner,
        uint8 slot_type,
        address mint,
        uint256 token
    ) public approvedForSummoner(summoner) approvedForItem(token, mint) {
        require(whitelisted(mint), "!whitelisted");
        require(slot_type < 4, "!supported");
        require(
            slots[summoner][slot_type].mint == address(0),
            "!slotAvailable"
        );

        (uint8 base_type, uint8 item_type, , ) = ICrafting(mint).items(token);

        if (slot_type == 1) {
            require(base_type == 3, "!weapon");
            IWeapon.Weapon memory weapon = ICodexWeapon(
                codexes[mint][base_type]
            ).item_by_id(item_type);
            if (weapon.encumbrance == 5) revert("ranged weapon");
            if (weapon.encumbrance == 4) {
                Equipment.Slot memory shield_slot = slots[summoner][3];
                if (shield_slot.mint != address(0)) revert("shield equipped");
            }
        } else if (slot_type == 2) {
            require(base_type == 2 && item_type < 13, "!armor");
        } else if (slot_type == 3) {
            require(base_type == 2 && item_type > 12, "!shield");
            Equipment.Slot memory weapon_slot = slots[summoner][1];
            if (weapon_slot.mint != address(0)) {
                (, uint8 weapon_type, , ) = ICrafting(weapon_slot.mint).items(
                    weapon_slot.token
                );
                IWeapon.Weapon memory equipped_weapon = ICodexWeapon(
                    codexes[weapon_slot.mint][3]
                ).item_by_id(weapon_type);
                require(
                    equipped_weapon.encumbrance < 4,
                    "two-handed or ranged weapon equipped"
                );
            }
        }

        slots[summoner][slot_type] = Equipment.Slot(mint, token);
        encumberance[summoner] += weigh(mint, base_type, item_type);

        emit Equip(msg.sender, summoner, slot_type, mint, token);

        IERC721(mint).safeTransferFrom(msg.sender, address(this), token);
    }

    function unequip(uint256 summoner, uint8 slot_type)
        public
        nonReentrant
        approvedForSummoner(summoner)
    {
        require(slots[summoner][slot_type].mint != address(0), "slotAvailable");

        Equipment.Slot memory slot = slots[summoner][slot_type];
        (uint8 base_type, uint8 item_type, , ) = ICrafting(slot.mint).items(
            slot.token
        );
        encumberance[summoner] -= weigh(slot.mint, base_type, item_type);
        delete slots[summoner][slot_type];

        emit Unequip(msg.sender, summoner, slot_type, slot.mint, slot.token);

        IERC721(slot.mint).safeTransferFrom(
            address(this),
            msg.sender,
            slot.token
        );
    }

    function snapshot(uint256 token, uint256 summoner) public {
        snapshots[msg.sender][token][summoner][1] = slots[summoner][1];
        snapshots[msg.sender][token][summoner][2] = slots[summoner][2];
        snapshots[msg.sender][token][summoner][3] = slots[summoner][3];
    }

    function weigh(
        address mint,
        uint256 base_type,
        uint8 item_type
    ) internal view returns (uint256 weight) {
        if (base_type == 2) {
            return
                ICodexArmor(codexes[mint][base_type])
                    .item_by_id(item_type)
                    .weight;
        } else if (base_type == 3) {
            return
                ICodexWeapon(codexes[mint][base_type])
                    .item_by_id(item_type)
                    .weight;
        }
    }
}
