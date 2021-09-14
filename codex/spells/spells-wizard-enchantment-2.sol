// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Wizard";
    string constant public school = "Enchantment";
    uint constant public level = 2;

    function spell_by_id(uint _id) external pure returns(
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        if (_id == 35) {
            return daze_monster();
        } else if (_id == 36) {
            return hideous_laughter();
        } else if (_id == 37) {
            return touch_of_idiocy();
        }
    }

    function daze_monster() public pure returns (
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        id = 35;
        name = "Daze Monster";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 3;
        duration = 1;
        saving_throw_type = 3;
        saving_throw_effect = 3;
        spell_resistance = true;
        description = "This charm makes a humanoid creature regard you as its trusted friend and ally (treat the target’s attitude as friendly). If the creature is currently being threatened or attacked by you or your allies, however, it receives a +5 bonus on its saving throw.";
    }

    function hideous_laughter() public pure returns (
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        id = 36;
        name = "Hideous Laughter";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 1; // 8 rounds
        saving_throw_type = 3;
        saving_throw_effect = 3;
        spell_resistance = true;
        description = "This spell afflicts the subject with uncontrollable laughter. It collapses into gales of manic laughter, falling prone. The subject can take no actions while laughing, but is not considered helpless. After the spell ends, it can act normally. A creature with an Intelligence score of 2 or lower is not affected. A creature whose type is different from the caster’s receives a +4 bonus on its saving throw, because humor doesn’t “translate” well.";
    }
    function touch_of_idiocy() public pure returns (
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        id = 37;
        name = "Touch of Idiocy";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 10;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = yes;
        description = "With a touch, you reduce the target’s mental faculties. Your successful melee touch attack applies a 1d6 penalty to the target’s Intelligence, Wisdom, and Charisma scores. This penalty can’t reduce any of these scores below 1. This spell’s effect may make it impossible for the target to cast some or all of its spells, if the requisite ability score drops below the minimum required to cast spells of that level.";
    }


}
