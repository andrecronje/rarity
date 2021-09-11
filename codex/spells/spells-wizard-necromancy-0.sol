// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Wizard";
    string constant public school = "Necromancy";
    uint constant public level = 0;

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
        if (_id == 12) {
            return disrupt_undead();
        } else if (_id == 13) {
            return touch_of_fatigue();
        }
    }

    function disrupt_undead() public pure returns (
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
        id = 12;
        name = "Disrupt Undead";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 0;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = true;
        description = "You direct a ray of positive energy. You must make a ranged touch attack to hit, and if the ray hits an undead creature, it deals 1d6 points of damage to it.";
    }

    function touch_of_fatigue() public pure returns (
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
        id = 13;
        name = "Touch of Fatigue";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 1;
        saving_throw_type = 1;
        saving_throw_effect = 3;
        spell_resistance = true;
        description = "You channel negative energy through your touch, fatiguing the target. You must succeed on a touch attack to strike a target. The subject is immediately fatigued for the spells duration. This spell has no effect on a creature that is already fatigued. Unlike with normal fatigue, the effect ends as soon as the spells duration expires.";
    }
}
