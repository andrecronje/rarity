// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Wizard";
    string constant public school = "Evocation";
    uint constant public level = 1;


    struct effect {
        string name;            // name of mod when seen on item/creature, e.g. "+1 damage"
        string description;     // description of mod effect " this gives +1 damage for a successful attack"
        uint32 expiry;         // expiry = timestamp when effect ends: permanency is 100 years
    
        int[4] damage; // dice number, dice type, adjustment, level multiplier. 
        //2d4 +1 with additional 1d4 per level = (2,4,1,1). curing 10 hp with potion is (0,0,-10,0), 
        
        int ac_adjustment; // e.g. +1 to AC
        int hp_adjustment; // e.g. +1 to HP
    
        int[8] roll_adjustment ; // e.g. +1/-1 to rolls on str, dex, con, int, wis, cha, attack, initiative
        int[8] roll_advantage ; // advantage to rolls on str, dex, con, int, wis, cha, attack, initiative
        int[8] roll_disadvantage ; // disadvantage to rolls on str, dex, con, int, wis, cha, attack, initiative
    
        int[6] save_adjustment ; // e.g. +1/-1 to saving rolls on str, dex, con, int, wis, cha, attack, initiative
        int[6] save_advantage ; // e.g. advantage to saving rolls on str, dex, con, int, wis, cha, attack, initiative
        int[6] save_disadvantage ; // e.g. disadvantage to saving rolls on str, dex, con, int, wis, cha, attack, initiative

        uint conjured_id;           
        uint conjured_type;        // item, creature, armour, weapon, nature
    } 


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
        string memory description,
        effect memory _effect
    ) {
        if (_id == 28) {
            return burning_hands();
        } else if (_id == 29) {
            return floating_disk();
        } else if (_id == 30) {
            return magic_missile();
        } else if (_id == 31) {
            return shocking_grasp();
        }
    }


    // calling function, e.g. cast_spell() will apply modifiers (duration, damage), set summon type 

    function burning_hands() public pure returns (
        uint id,
        string memory name, // spell name
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
        string memory description, // spell description
        uint duration_multi,
        effect memory _effect
    ) {
        id = 28;
        name = "Burning Hands";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2; // under 25ft
        duration = 0;
        saving_throw_type = 2;
        saving_throw_effect = 2;
        spell_resistance = true;
        description = "A cone of searing flame shoots from your fingertips. Any creature in the area of the flames takes 1d4 points of fire damage per caster level (maximum 5d4). Flammable materials burn if the flames touch them. A character can extinguish burning items as a full-round action.";
        duration_multi = 0
        // QUESTION ON SOLIDITY: I assume unassigned _effect values are zero and can be tested for later
        _effect.name = "Burning Damage"
        _effect.description = "It burns!";     // description of mod effect " this gives +1 damage for a successful attack"
        _effect.expiry = ?;         // expiry = timestamp when effect ends: permanency is 100 years
        _effect.damage = (1,4,0,1); // dice, type, adjustment, level multiplier. 2d4 +3 @ that adds 1 dice per level is = (2,4,3,1). curing 10 hp is (0,0,-10, 0), 
        //_effect.ac = 0; // e.g. +1 to AC
        //_effect.hp = 0
        //_effect.roll_adjustment = [0,0,0,0,0,0,0,0]; // e.g. +1/-1 to rolls on str, dex, con, int, wis, cha, attack, initiative
        //_effect.roll_advantage ; // advantage to rolls on str, dex, con, int, wis, cha, attack, initiative
        //_effect.roll_disadvantage ; // disadvantage to rolls on str, dex, con, int, wis, cha, attack, initiative
    
        //_effect.save_adjustment ; // e.g. +1/-1 to saving rolls on str, dex, con, int, wis, cha, attack, initiative
        //_effect.save_advantage ; // e.g. advantage to saving rolls on str, dex, con, int, wis, cha, attack, initiative
        //_effect.save_disadvantage ; // e.g. disadvantage to saving rolls on str, dex, con, int, wis, cha, attack, initiative
        }

    function floating_disk() public pure returns (
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
        string memory description,
        uint duration_multi,
        effect memory _effect
    ) {
        id = 29;
        name = "Floating Disk";
        verbal = true;
        somatic = false;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 60;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "You create a slightly concave, circular plane of force that follows you about and carries loads for you. The disk is 3 feet in diameter and 1 inch deep at its center. It can hold 100 pounds of weight per caster level. (If used to transport a liquid, its capacity is 2 gallons.)";
        duration_multi = 0
        //_effect.summon = magic_item_id or monster_id or magic_weapon_id 
        _effect.description = "A circular disk is hovering nearby"; 
    }

    function magic_missile() public pure returns (
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
        string memory description,
        uint duration_multi,
        effect memory _effect
    ) {
        id = 30;
        name = "Magic Missle";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 3;
        duration = 0;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = true;
        description = "A missile of magical energy darts forth from your fingertip and strikes its target, dealing 1d4+1 points of force damage. The missile strikes unerringly, even if the target is in melee combat or has less than total cover or total concealment.";
        duration_multi = 0
        _effect.damage = (1,4,1,1); // dice, type, adjustment, level multiplier. 2d4 +3 @ that adds 1 dice per level is = (2,4,3,1). curing 10 hp is (0,0,-10, 0), 
    }

    function shocking_grasp() public pure returns (
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
        string memory description,
        uint duration_multi,
        effect memory _effect
    ) {
        id = 10;
        name = "Ray of Frost";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 1;
        duration = 0;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = true;
        description = "Your successful melee touch attack deals 1d6 points of electricity damage per caster level (maximum 5d6). When delivering the jolt, you gain a +3 bonus on attack rolls if the opponent is wearing metal armor (or made out of metal, carrying a lot of metal, or the like).";
        duration_multi = 0
        _effect.damage = (1,6,1,1); // dice, type, adjustment, level multiplier. 2d4 +3 @ that adds 1 dice per level is = (2,4,3,1). curing 10 hp is (0,0,-10, 0), 
    }
}
