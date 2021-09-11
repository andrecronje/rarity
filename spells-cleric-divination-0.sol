// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Cleric";
    string constant public school = "Divination";
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
        if (_id == 4) {
            return detect_poison();
        } else if (_id == 5) {
            return detect_magic();
        } else if (_id == 6) {
            return read_magic();
        } else if (_id == 7) {
            return guidance();
        }
    }

    function detect_poison() public pure returns (
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
        id = 4;
        name = "Detect Poison";
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
        description = "You determine whether a creature, object, or area has been poisoned or is poisonous. You can determine the exact type of poison with a DC 20 Wisdom check. A character with the Craft (alchemy) skill may try a DC 20 Craft (alchemy) check if the Wisdom check fails, or may try the Craft (alchemy) check prior to the Wisdom check. The spell can penetrate barriers, but 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt blocks it.";
    }

    function detect_magic() public pure returns (
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
        id = 5;
        name = "Detect Magic";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 3;
        duration = 60;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "You detect magical auras. The amount of information revealed depends on how long you study a particular area or subject.";
    }

    function read_magic() public pure returns (
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
        id = 6;
        name = "Read Magic";
        verbal = true;
        somatic = true;
        focus = true;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 0;
        duration = 600;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "By means of read magic, you can decipher magical inscriptions on objects books, scrolls, weapons, and the like that would otherwise be unintelligible. This deciphering does not normally invoke the magic contained in the writing, although it may do so in the case of a cursed scroll. Furthermore, once the spell is cast and you have read the magical inscription, you are thereafter able to read that particular writing without recourse to the use of read magic. You can read at the rate of one page (250 words) per minute. The spell allows you to identify a glyph of warding with a DC 13 Spellcraft check, a greater glyph of warding with a DC 16 Spellcraft check, or any symbol spell with a Spellcraft check (DC 10 + spell level).";
    }

    function guidance() public pure returns (
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
        id = 7;
        name = "Guidance";
        verbal = true;
        somatic = true;
        focus = false;
        divine_focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 60;
        saving_throw_type = 3;
        saving_throw_effect = 3;
        spell_resistance = true;
        description = "This spell imbues the subject with a touch of divine guidance. The creature gets a +1 competence bonus on a single attack roll, saving throw, or skill check. It must choose to use the bonus before making the roll to which it applies.";
    }
}
