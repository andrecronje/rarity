//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../interfaces/codex/IRarityCodexCraftingSkills.sol";
import "../interfaces/core/IRarityCraftingSkills.sol";

library CraftingSkills {
    IRarityCodexCraftingSkills constant CODEX =
        IRarityCodexCraftingSkills(0xa0B2508A25dc28D20C537b8E1798543AC437F669);
    IRarityCraftingSkills constant SKILLS =
        IRarityCraftingSkills(0xc84275A99C01D0b6C1A63bD94d589e4A44a85DeD);

    function ranks(uint256 summoner, uint8 specialization)
        public
        view
        returns (uint8)
    {
        uint8[5] memory skills = SKILLS.get_skills(summoner);
        return skills[specialization - 1];
    }

    function get_specialization(uint8 base_type, uint8 item_type)
        public
        pure
        returns (uint8 result)
    {
        if (base_type == 2) {
            (result, , ) = CODEX.armorsmithing();
        } else if (base_type == 3) {
            if (item_type >= 44 && item_type <= 47) {
                (result, , ) = CODEX.bowmaking();
            } else {
                (result, , ) = CODEX.weaponsmithing();
            }
        }
    }
}
