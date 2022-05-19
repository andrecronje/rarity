//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../interfaces/core/IRarityCommonCrafting.sol";
import "./Attributes.sol";
import "./CraftingSkills.sol";
import "./Feats.sol";
import "./Random.sol";
import "./Skills.sol";

struct AttackRoll {
    uint8 roll;
    int8 score;
    uint8 critical_roll;
    uint8 critical_confirmation;
    uint8 damage_multiplier;
}

library Roll {
    function appraise(uint256 summoner)
        public
        view
        returns (uint8 roll, int8 score)
    {
        roll = Random.dn(summoner, 838841482654980658, 20);
        score = int8(roll);
        score += Attributes.intelligence_modifier(summoner);
        score += int8(Skills.appraise(summoner));
        if (Feats.diligent(summoner)) score += 2;
    }

    function craft_bonus(uint256 summoner, uint8 specialization)
        public
        view
        returns (int8 bonus)
    {
        bonus += Attributes.intelligence_modifier(summoner);
        if (specialization == 0) {
            bonus += int8(Skills.craft(summoner));
        } else {
            bonus += int8(CraftingSkills.ranks(summoner, specialization));
        }
    }

    function craft(uint256 summoner, uint8 specialization)
        public
        view
        returns (uint8 roll, int8 score)
    {
        roll = Random.dn(summoner, 12171199555242019957, 20);
        score = int8(roll) + craft_bonus(summoner, specialization);
    }

    function initiative(uint256 summoner)
        public
        view
        returns (uint8 roll, int8 score)
    {
        return
            initiative(
                summoner,
                Attributes.dexterity_modifier(summoner),
                Feats.improved_initiative(summoner) ? int8(4) : int8(0)
            );
    }

    function initiative(
        uint256 token,
        int8 total_dex_modifier,
        int8 initiative_bonus
    ) public view returns (uint8 roll, int8 score) {
        roll = Random.dn(token, 11781769727069077443, 20);
        score = total_dex_modifier + int8(initiative_bonus) + int8(roll);
    }

    function search(uint256 summoner)
        public
        view
        returns (uint8 roll, int8 score)
    {
        roll = Random.dn(summoner, 12460038586674487978, 20);
        score = int8(roll);
        score += Attributes.intelligence_modifier(summoner);
        score += int8(Skills.search(summoner));
        if (Feats.investigator(summoner)) score += 2;
    }

    function sense_motive(uint256 summoner)
        public
        view
        returns (uint8 roll, int8 score)
    {
        roll = Random.dn(summoner, 3505325381439919961, 20);
        score = int8(roll);
        score += Attributes.wisdom_modifier(summoner);
        score += int8(Skills.sense_motive(summoner));
        if (Feats.negotiator(summoner)) score += 2;
    }

    function attack(
        uint256 seed,
        int8 total_bonus,
        int8 critical_modifier,
        uint8 critical_multiplier,
        uint8 target_armor_class
    ) public view returns (AttackRoll memory result) {
        result.roll = Random.dn(seed, 9807527763775093748, 20);
        if (result.roll == 1) return AttackRoll(1, 0, 0, 0, 0);
        result.score = int8(result.roll) + total_bonus;
        if (result.score >= int8(target_armor_class))
            result.damage_multiplier++;
        if (result.roll >= uint256(int256(int8(20) + critical_modifier))) {
            result.critical_roll = Random.dn(seed, 9809778455456300450, 20);
            result.critical_confirmation = uint8(
                int8(result.critical_roll) + total_bonus
            );
            if (result.critical_confirmation >= target_armor_class)
                result.damage_multiplier += critical_multiplier;
        }
    }

    function damage(
        uint256 seed,
        uint8 dice_count,
        uint8 dice_sides,
        int8 total_modifier,
        uint8 damage_multiplier
    ) public view returns (uint8 result) {
        for (uint256 i; i < damage_multiplier; i++) {
            int8 signed_result = int8(
                Random.dn(seed, 6459055441333536942 + i, dice_count, dice_sides)
            ) + total_modifier;
            if (signed_result < 1) {
                result += 1;
            } else {
                result += uint8(signed_result);
            }
        }
    }
}
