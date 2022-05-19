// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../library/ForSummoners.sol";
import "../library/Rarity.sol";
import "../library/Skills.sol";

interface ICodexCraftingSkills {
    function skill_by_id(uint256)
        external
        view
        returns (
            uint256 id,
            string memory name,
            string memory description
        );
}

contract rarity_crafting_skills is ForSummoners {
    // Alchemy, Armorsmithing, Bowmaking, Trapmaking, Weaponsmithing
    uint8 public constant SKILL_SLOTS = 5;

    mapping(uint256 => uint8[SKILL_SLOTS]) public crafting_skills;

    function get_skills(uint256 summoner)
        public
        view
        returns (uint8[SKILL_SLOTS] memory)
    {
        return crafting_skills[summoner];
    }

    function is_spell_caster(uint256 summoner) public view returns (bool) {
        uint256 class = Rarity.class(summoner);
        // Barbarian, Fighter, Monk, Rogue
        if (class == 1 || class == 5 || class == 6 || class == 9) {
            return false;
        } else {
            return true;
        }
    }

    function set_skills(uint256 summoner, uint8[SKILL_SLOTS] memory skills)
        public
        approvedForSummoner(summoner)
    {
        uint8 base_craft_ranks = Skills.craft(summoner);
        uint8[SKILL_SLOTS] memory current_skills = crafting_skills[summoner];
        uint256 redeem_craft_ranks = 0;
        for (uint256 i = 0; i < SKILL_SLOTS; i++) {
            if (i == 0)
                require(
                    is_spell_caster(summoner),
                    "!is_spell_caster(summoner)"
                );
            require(
                skills[i] >= current_skills[i],
                "skills[i] < current_skills[i]"
            );
            redeem_craft_ranks += skills[i];
            require(
                redeem_craft_ranks <= base_craft_ranks,
                "redeem_craft_ranks > base_craft_ranks"
            );
        }
        crafting_skills[summoner] = skills;
    }
}
