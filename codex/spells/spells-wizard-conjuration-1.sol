// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Wizard";
    string constant public school = "Conjuration";
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
        if (_id == 47) {
            return grease();
        } else if (_id == 48) {
            return mage_armor();
        } else if (_id == 49) {
            return mount();
        } else if (_id == 50) {
            return obscuring_mist();
        } else if (_id == 51) {
            return summon_monster_1();
        } else if (_id == 52) {
            return unseen_servant();
        }
    }

    function grease() public pure returns (
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
        id = 47;
        name = "Grease";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 1; // 1 round per level
        saving_throw_type = 2;
        saving_throw_effect = 3;
        spell_resistance = false;
        description = "A grease spell covers a solid surface with a layer of slippery grease. Any creature in the area when the spell is cast must make a successful Reflex save or fall.";
    }

    function mage_armor() public pure returns (
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
        id = 48;
        name = "Mage Armor";
        verbal = true;
        somatic = true;
        focus = true;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 60; // 1 hour per level
        saving_throw_type = 2;
        saving_throw_effect = 3;
        spell_resistance = false;
        description = "An invisible but tangible field of force surrounds the subject of a mage armor spell, providing a +4 armor bonus to AC.;
    }

    function mount() public pure returns (
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
        id = 49;
        name = "Mount";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 120; // 2 hour per level
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "You summon a light horse or a pony (your choice) to serve you as a mount.";
    }

    function obscuring_mist() public pure returns (
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
        id = 50;
        name = "Obscuring Mist";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 1; // 1 min per level
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "A misty vapor arises around you. It is stationary once created. The vapor obscures all sight, including darkvision, beyond 5 feet. A creature 5 feet away has concealment (attacks have a 20% miss chance). Creatures farther away have total concealment (50% miss chance, and the attacker cannot use sight to locate the target).";
    }

    function summon_monster_1() public pure returns (
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
        id = 51;
        name = "Summon Monster 1";
        verbal = true;
        somatic = true;
        focus = true;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 1; // 1 min per level
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "This spell summons an extraplanar creature (typically an outsider, elemental, or magical beast native to another plane). It appears where you designate and acts immediately, on your turn. It attacks your opponents to the best of its ability. The spell conjures one of the creatures from the 1st-level list on the Summon Monster table.";
    }

    function unseen_servant() public pure returns (
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
        id = 52;
        name = "Unseen Servant";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 60; // 1 hour per level
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "An unseen servant is an invisible, mindless, shapeless force that performs simple tasks at your command. It can run and fetch things, open unstuck doors, and hold chairs, as well as clean and mend.";
    }

}
