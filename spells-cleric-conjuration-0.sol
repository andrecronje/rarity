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
        if (_id == 2) {
            return create_water();
        } else if (_id == 3) {
            return cure_minor_wounds();
        }
    }

    function create_water() public pure returns (
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
        id = 2;
        name = "Create Water";
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
        spell_resistance = false;
        description = "This spell generates wholesome, drinkable water, just like clean rain water. Water can be created in an area as small as will actually contain the liquid, or in an area three times as large, possibly creating a downpour or filling many small receptacles. Note: Conjuration spells cant create substances or objects within a creature. Water weighs about 8 pounds per gallon. One cubic foot of water contains roughly 8 gallons and weighs about 60 pounds.";
    }

    function cure_minor_wounds() public pure returns (
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
        id = 3;
        name = "Cure Minor Wounds";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 0;
        saving_throw_type = 3;
        saving_throw_effect = 2;
        spell_resistance = true;
        description = "This spell functions like cure light wounds, except that it cures only 1 point of damage.";
    }
}
