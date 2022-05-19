// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../interfaces/codex/IRarityCodexCommonArmor.sol";

contract codex {
    string public constant index = "Items";
    string public constant class = "Masterwork Armor";

    IRarityCodexCommonArmor constant COMMON_CODEX =
        IRarityCodexCommonArmor(0xe2e659caC782EC2A1FF041A79185AAaAcdA336f2);

    function get_proficiency_by_id(uint256 _id)
        public
        pure
        returns (string memory description)
    {
        return COMMON_CODEX.get_proficiency_by_id(_id);
    }

    function armor_check_bonus(uint256 id) public pure returns (int8) {
        id; //shhh
        return 1;
    }

    function item_by_id(uint256 _id)
        public
        pure
        returns (IArmor.Armor memory armor)
    {
        armor = COMMON_CODEX.item_by_id(_id);
        armor.penalty = int8(armor.penalty + armor_check_bonus(armor.id));
        armor.cost = armor.cost + 150e18;
        armor.name = string(abi.encodePacked("Masterwork ", armor.name));
    }
}
