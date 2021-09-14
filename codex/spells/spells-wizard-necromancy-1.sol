// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Wizard";
    string constant public school = "Necromancy";
    uint constant public level = 1;

    function spell_by_id(uint _id) external pure returns(
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        bool divine_focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        if (_id == 44) {
            return cause_fear();
        } else if (_id == 45) {
            return chill_touch();
        } else if (_id == 46) {
            return ray_of_enfeeblement();
        }
    }

    function cause_fear() public pure returns (
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        bool divine_focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        id = 44;
        name = "Cause Fear";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 1; // 4 rounds, 24 seconds. round up to 1 min
        saving_throw_type = 3;
        saving_throw_effect = 0; // need mechanic to reduce spell duration
        spell_resistance = yes;
        description = "The affected creature becomes frightened. Creatures with 6 or more Hit Dice are immune to this effect.";
    }

    function chill_touch() public pure returns (
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        bool divine_focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        id = 45;
        name = "Chill Touch";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 0;
        saving_throw_type = 3;
        saving_throw_effect = 3;
        spell_resistance = true;
        description = "A touch from your hand, which glows with blue energy, disrupts the life force of living creatures. Each touch channels negative energy that deals 1d6 points of damage.";
    }


    function ray_of_enfeeblement() public pure returns (
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        bool divine_focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        id = 46;
        name = "Ray of Enfeeblement";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 1;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = true;
        description = "A coruscating ray springs from your hand. You must succeed on a ranged touch attack to strike a target. The subject takes a penalty to Strength equal to 1d6+1 per two caster levels (maximum 1d6+5).";
    }
}
