// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string public constant index = "Skills";
    string public constant class = "Crafting";

    function skill_by_id(uint256 _id)
        external
        pure
        returns (
            uint8 id,
            string memory name,
            string memory description
        )
    {
        if (_id == 1) {
            return alchemy();
        } else if (_id == 2) {
            return armorsmithing();
        } else if (_id == 3) {
            return bowmaking();
        } else if (_id == 4) {
            return trapmaking();
        } else if (_id == 5) {
            return weaponsmithing();
        }
    }

    function alchemy()
        public
        pure
        returns (
            uint8 id,
            string memory name,
            string memory description
        )
    {
        id = 1;
        name = "Alchemy";
        description = "Craft alchemical items such as acid, antitoxins, and Alchemist's fire.";
    }

    function armorsmithing()
        public
        pure
        returns (
            uint8 id,
            string memory name,
            string memory description
        )
    {
        id = 2;
        name = "Armorsmithing";
        description = "Craft armor and shields.";
    }

    function bowmaking()
        public
        pure
        returns (
            uint8 id,
            string memory name,
            string memory description
        )
    {
        id = 3;
        name = "Bowmaking";
        description = "Craft simple and composite long and short bows.";
    }

    function trapmaking()
        public
        pure
        returns (
            uint8 id,
            string memory name,
            string memory description
        )
    {
        id = 4;
        name = "Trapmaking";
        description = "Craft mechanical and magic traps.";
    }

    function weaponsmithing()
        public
        pure
        returns (
            uint8 id,
            string memory name,
            string memory description
        )
    {
        id = 5;
        name = "Weaponsmithing";
        description = "Craft melee weapons such as axes, daggers, swords, greatswords, maces, hammers, and spears.";
    }
}
