// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../library/Codex.sol";

contract codex {
    string public constant index = "Items";
    string public constant class = "Masterwork Weapons";

    ICodexWeapon constant COMMON_CODEX =
        ICodexWeapon(0x48F177ED0B38efab35D6150659eDAeCEE234E802);

    function get_proficiency_by_id(uint256 id)
        public
        pure
        returns (string memory description)
    {
        return COMMON_CODEX.get_proficiency_by_id(id);
    }

    function get_encumbrance_by_id(uint256 id)
        public
        pure
        returns (string memory description)
    {
        return COMMON_CODEX.get_encumbrance_by_id(id);
    }

    function get_damage_type_by_id(uint256 id)
        public
        pure
        returns (string memory description)
    {
        return COMMON_CODEX.get_damage_type_by_id(id);
    }

    function get_attack_bonus(uint256 id) public pure returns (int8) {
        id; //shhh
        return 1;
    }

    function item_by_id(uint256 id)
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon = COMMON_CODEX.item_by_id(id);
        weapon.cost = weapon.cost + 300e18;
        weapon.name = string(abi.encodePacked("Masterwork ", weapon.name));
    }
}
