// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Cleric";
    string constant public school = "Conjuration";
    uint constant public level = 0;

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
        if (_id == 30) {
            return create_water();
        } else if (_id == 31) {
            return cure_minor_wounds();
        }
    }

    function create_water() public pure returns (
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
        id = 30;
        name = "Create Water";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 0;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "This spell generates wholesome, drinkable water, just like clean rain water. Water can be created in an area as small as will actually contain the liquid, or in an area three times as large—possibly creating a downpour or filling many small receptacles.";
    }

    function cure_minor_wounds() public pure returns (
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
        id = 31;
        name = "Cure Minor Wounds";
        verbal = true;
        somatic = false;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 0;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = true;
        description = "When laying your hand upon a living creature, you channel positive energy that cures 1 point of damage. Since undead are powered by negative energy, this spell deals damage to them instead of curing their wounds";
    }
    
}