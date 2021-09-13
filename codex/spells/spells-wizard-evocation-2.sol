// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Wizard";
    string constant public school = "Evocation";
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
        if (_id == 38) {
            return continual_flame();
        } else if (_id == 39) {
            return darkness();
        } else if (_id == 40) {
            return flaming_sphere(); 
        } else if (_id == 41) {
            return gust_of_wind();
        } else if (_id == 42) {
            return scorching_ray();
        } else if (_id == 43) {
            return shatter();
        }
    }

    function continual_flame() public pure returns (
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
        id = 38;
        name = "Continual Flame";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 1; 
        duration = 1000; //permanent, so set high
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = A flame, equivalent in brightness to a torch, springs forth from an object that you touch. The effect looks like a regular flame, but it creates no heat and doesn’t use oxygen. A continual flame can be covered and hidden but not smothered or quenched. Light spells counter and dispel darkness spells of an equal or lower level.";
    }

    function darkness() public pure returns (
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
        id = 39;
        name = "Darkness";
        verbal = true;
        somatic = false;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 10;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "This spell causes an object to radiate shadowy illumination out to a 20-foot radius. All creatures in the area gain concealment (20% miss chance). Even creatures that can normally see in such conditions (such as with darkvision or low-light vision) have the miss chance in an area shrouded in magical darkness. Normal lights (torches, candles, lanterns, and so forth) are incapable of brightening the area, as are light spells of lower level. Higher level light spells are not affected by darkness. Darkness counters or dispels any light spell of equal or lower spell level.";
    }

    function flaming_sphere() public pure returns (
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
        id = 40;
        name = "Flaming Sphere";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 3;
        duration = 1;
        saving_throw_type = 2;
        saving_throw_effect = 3;
        spell_resistance = true;
        description = "A burning globe of fire rolls in whichever direction you point and burns those it strikes. It moves 30 feet per round. As part of this movement, it can ascend or jump up to 30 feet to strike a target. If it enters a space with a creature, it stops moving for the round and deals 2d6 points of fire damage to that creature, though a successful Reflex save negates that damage. A flaming sphere rolls over barriers less than 4 feet tall. It ignites flammable substances it touches and illuminates the same area as a torch would.";
    }

    function gust_of_wind() public pure returns (
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
        id = 41;
        name = "Gust Of Wind";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 1;
        saving_throw_type = 1;
        saving_throw_effect = 3;
        spell_resistance = true;
        description = "This spell creates a severe blast of air (approximately 50 mph) that originates from you, affecting all creatures in its path. A Tiny or smaller creature on the ground is knocked down and rolled 1d4x10 feet, taking 1d4 points of nonlethal damage per 10 feet. If flying, a Tiny or smaller creature is blown back 2d6x10 feet and takes 2d6 points of nonlethal damage due to battering and buffeting. Small creatures are knocked prone by the force of the wind, or if flying are blown back 1d6x10 feet. Medium creatures are unable to move forward against the force of the wind, or if flying are blown back 1d6x5 feet. Large or larger creatures may move normally within a gust of wind effect. Any creature, regardless of size, takes a –4 penalty on ranged attacks and Listen checks in the area of a gust of wind.";
    }

    function scorching_ray() public pure returns (
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
        id = 42;
        name = "Scorching Ray;
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 0;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = true;
        description = "You blast your enemies with fiery rays. You may fire one ray, plus one additional ray for every four levels beyond 3rd (to a maximum of three rays at 11th level). Each ray requires a ranged touch attack to hit and deals 4d6 points of fire damage.";
    }

    function shatter() public pure returns (
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
        id = 43;
        name = "Shatter;
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 0;
        saving_throw_type = 3;
        saving_throw_effect = 3;
        spell_resistance = yes;
        description = "Shatter creates a loud, ringing noise that breaks brittle, nonmagical objects; sunders a single solid, nonmagical object; or damages a crystalline creature. Alternatively, you can target shatter against a single solid object, regardless of composition, weighing up to 10 pounds per caster level. Targeted against a crystalline creature (of any weight), shatter deals 1d6 points of sonic damage per caster level (maximum 10d6)";
    }
}
