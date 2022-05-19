//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface IRarityEquipment {
    function slots(uint256 summoner, uint256 slot_type)
        external
        view
        returns (Equipment.Slot memory);

    function encumberance(uint256 summoner) external view returns (uint256);

    function codexes(address mint, uint256 base_type)
        external
        view
        returns (address);

    function equip(
        uint256 summoner,
        uint256 slot_type,
        address mint,
        address codex,
        uint256 token
    ) external;

    function unequip(uint256 summoner, uint256 slot_type) external;

    function snapshot(uint256 token, uint256 summoner) external;

    function snapshots(
        address encounter,
        uint256 token,
        uint256 summoner,
        uint8 slot_type
    ) external view returns (Equipment.Slot memory);
}

library Equipment {
    struct Slot {
        address mint;
        uint256 token;
    }

    uint8 public constant SLOT_TYPE_WEAPON_1 = 1;
    uint8 public constant SLOT_TYPE_ARMOR = 2;
    uint8 public constant SLOT_TYPE_SHIELD = 3;
    uint8 public constant SLOT_TYPE_WEAPON_2 = 4;
    uint8 public constant SLOT_TYPE_HANDS = 5;
    uint8 public constant SLOT_TYPE_RING_1 = 6;
    uint8 public constant SLOT_TYPE_RING_2 = 7;
    uint8 public constant SLOT_TYPE_HEAD = 8;
    uint8 public constant SLOT_TYPE_HEADBAND = 9;
    uint8 public constant SLOT_TYPE_EYES = 10;
    uint8 public constant SLOT_TYPE_NECK = 11;
    uint8 public constant SLOT_TYPE_SHOULDERS = 12;
    uint8 public constant SLOT_TYPE_CHEST = 13;
    uint8 public constant SLOT_TYPE_BELT = 14;
    uint8 public constant SLOT_TYPE_BODY = 15;
    uint8 public constant SLOT_TYPE_ARMS = 16;
    uint8 public constant SLOT_TYPE_FEET = 17;
}
