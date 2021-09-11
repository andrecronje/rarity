// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Items";
    string constant public class = "Weapons";

    function get_proficiency_by_id(uint _id) public pure returns (string memory description) {
        if (_id == 1) {
            return "Simple";
        } else if (_id == 2) {
            return "Martial";
        } else if (_id == 3) {
            return "Exotic";
        }
    }

    function get_encumbrance_by_id(uint _id) public pure returns (string memory description) {
        if (_id == 1) {
            return "Unarmed";
        } else if (_id == 2) {
            return "Light Melee Weapons";
        } else if (_id == 3) {
            return "One-Handed Melee Weapons";
        } else if (_id == 4) {
            return "Two-Handed Melee Weapons";
        } else if (_id == 5) {
            return "Ranged Weapons";
        }
    }

    function get_damage_type_by_id(uint _id) public pure returns (string memory description) {
        if (_id == 1) {
            return "Bludgeoning";
        } else if (_id == 2) {
            return "Piercing";
        } else if (_id == 3) {
            return "Slashing";
        }
    }

    function item_by_id(uint _id) public pure returns(
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        if (_id == 1) {
            return gauntlet();
        } else if (_id == 2) {
            return dagger();
        } else if (_id == 3) {
            return gauntlet_spiked();
        } else if (_id == 4) {
            return mace_light();
        } else if (_id == 5) {
            return sickle();
        } else if (_id == 6) {
            return club();
        } else if (_id == 7) {
            return mace_heavy();
        } else if (_id == 8) {
            return morningstar();
        } else if (_id == 9) {
            return shortspear();
        } else if (_id == 10) {
            return longspear();
        } else if (_id == 11) {
            return quarterstaff();
        } else if (_id == 12) {
            return spear();
        } else if (_id == 13) {
            return crossbow_heavy();
        } else if (_id == 14) {
            return crossbow_light();
        } else if (_id == 15) {
            return dart();
        } else if (_id == 16) {
            return javelin();
        } else if (_id == 17) {
            return sling();
        } else if (_id == 18) {
            return axe();
        } else if (_id == 19) {
            return hammer_light();
        } else if (_id == 20) {
            return handaxe();
        } else if (_id == 21) {
            return kukri();
        } else if (_id == 22) {
            return pick_light();
        } else if (_id == 23) {
            return sap();
        } else if (_id == 24) {
            return sword_short();
        } else if (_id == 25) {
            return battleaxe();
        } else if (_id == 26) {
            return flail();
        } else if (_id == 27) {
            return longsword();
        } else if (_id == 28) {
            return pick_heavy();
        } else if (_id == 29) {
            return rapier();
        } else if (_id == 30) {
            return scimitar();
        } else if (_id == 31) {
            return trident();
        } else if (_id == 32) {
            return warhammer();
        } else if (_id == 33) {
            return falchion();
        } else if (_id == 34) {
            return glaive();
        } else if (_id == 35) {
            return greataxe();
        } else if (_id == 36) {
            return greatclub();
        } else if (_id == 37) {
            return flail_heavy();
        } else if (_id == 38) {
            return greatsword();
        } else if (_id == 39) {
            return guisarme();
        } else if (_id == 40) {
            return halberd();
        } else if (_id == 41) {
            return lance();
        } else if (_id == 42) {
            return ranseur();
        } else if (_id == 43) {
            return scythe();
        } else if (_id == 44) {
            return longbow();
        } else if (_id == 45) {
            return longbow_composite();
        } else if (_id == 46) {
            return shortbow();
        } else if (_id == 47) {
            return shortbow_composite();
        } else if (_id == 48) {
            return kama();
        } else if (_id == 49) {
            return nunchaku();
        } else if (_id == 50) {
            return sai();
        } else if (_id == 51) {
            return siangham();
        } else if (_id == 52) {
            return sword_bastard();
        } else if (_id == 53) {
            return waraxe_dwarven();
        } else if (_id == 54) {
            return axe_orc_double();
        } else if (_id == 55) {
            return chain_spiked();
        } else if (_id == 56) {
            return flail_dire();
        } else if (_id == 57) {
            return crossbow_hand();
        } else if (_id == 58) {
            return crossbow_repeating_heavy();
        } else if (_id == 59) {
            return crossbow_repeating_light();
        }
    }

    function gauntlet() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 1;
        name = "Gauntlet";
        cost = 2e18;
        proficiency = 1;
        encumbrance = 1;
        damage_type = 1;
        weight = 1;
        damage = 3;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "This metal glove lets you deal lethal damage rather than nonlethal damage with unarmed strikes. A strike with a gauntlet is otherwise considered an unarmed attack. The cost and weight given are for a single gauntlet. Medium and heavy armors (except breastplate) come with gauntlets.";
    }

    function dagger() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 2;
        name = "Dagger";
        cost = 2e18;
        proficiency = 1;
        encumbrance = 2;
        damage_type = 2;
        weight = 1;
        damage = 4;
        critical = 2;
        critical_modifier = -1;
        range_increment = 0;
        description = "You get a +2 bonus on Sleight of Hand checks made to conceal a dagger on your body (see the Sleight of Hand skill).";
    }

    function gauntlet_spiked() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 3;
        name = "Gauntlet, spiked";
        cost = 5e18;
        proficiency = 1;
        encumbrance = 2;
        damage_type = 2;
        weight = 1;
        damage = 4;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "Your opponent cannot use a disarm action to disarm you of spiked gauntlets. The cost and weight given are for a single gauntlet. An attack with a spiked gauntlet is considered an armed attack.";
    }

    function mace_light() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 4;
        name = "Mace, light";
        cost = 5e18;
        proficiency = 1;
        encumbrance = 2;
        damage_type = 1;
        weight = 4;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function sickle() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 5;
        name = "Sickle";
        cost = 6e18;
        proficiency = 1;
        encumbrance = 2;
        damage_type = 3;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "A sickle can be used to make trip attacks. If you are tripped during your own trip attempt, you can drop the sickle to avoid being tripped.";
    }

    function club() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 6;
        name = "Club";
        cost = 1e17;
        proficiency = 1;
        encumbrance = 3;
        damage_type = 1;
        weight = 3;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function mace_heavy() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 7;
        name = "Mace, heavy";
        cost = 12e18;
        proficiency = 1;
        encumbrance = 3;
        damage_type = 1;
        weight = 8;
        damage = 8;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function morningstar() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 8;
        name = "Morningstar";
        cost = 8e18;
        proficiency = 1;
        encumbrance = 3;
        damage_type = 1;
        weight = 6;
        damage = 8;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function shortspear() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 9;
        name = "Shortspear";
        cost = 1e18;
        proficiency = 1;
        encumbrance = 3;
        damage_type = 2;
        weight = 3;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "A shortspear is small enough to wield one-handed. It may also be thrown.";
    }

    function longspear() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 10;
        name = "Longspear";
        cost = 5e18;
        proficiency = 1;
        encumbrance = 4;
        damage_type = 2;
        weight = 9;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "A longspear has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe. If you use a ready action to set a longspear against a charge, you deal double damage on a successful hit against a charging character.";
    }

    function quarterstaff() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 11;
        name = "Quarterstaff";
        cost = 1e17;
        proficiency = 1;
        encumbrance = 4;
        damage_type = 1;
        weight = 4;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "A quarterstaff is a double weapon. You can fight with it as if fighting with two weapons, but if you do, you incur all the normal attack penalties associated with fighting with two weapons, just as if you were using a one-handed weapon and a light weapon. A creature wielding a quarterstaff in one hand cant use it as a double weapon-only one end of the weapon can be used in any given round.";
    }

    function spear() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 12;
        name = "Spear";
        cost = 2e18;
        proficiency = 1;
        encumbrance = 4;
        damage_type = 2;
        weight = 6;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function crossbow_heavy() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 13;
        name = "Crossbow, heavy";
        cost = 50e18;
        proficiency = 1;
        encumbrance = 5;
        damage_type = 2;
        weight = 8;
        damage = 10;
        critical = 2;
        critical_modifier = -1;
        range_increment = 120;
        description = "You draw a heavy crossbow back by turning a small winch. Loading a heavy crossbow is a full-round action that provokes attacks of opportunity.";
    }

    function crossbow_light() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 14;
        name = "Crossbow, light";
        cost = 35e18;
        proficiency = 1;
        encumbrance = 5;
        damage_type = 2;
        weight = 4;
        damage = 8;
        critical = 2;
        critical_modifier = -1;
        range_increment = 80;
        description = "You draw a light crossbow back by pulling a lever. Loading a light crossbow is a move action that provokes attacks of opportunity.";
    }

    function dart() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 15;
        name = "Dart";
        cost = 5e17;
        proficiency = 1;
        encumbrance = 5;
        damage_type = 2;
        weight = 1;
        damage = 4;
        critical = 2;
        critical_modifier = 0;
        range_increment = 20;
        description = "";
    }

    function javelin() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 16;
        name = "Javelin";
        cost = 1e18;
        proficiency = 1;
        encumbrance = 5;
        damage_type = 2;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 30;
        description = "Since it is not designed for melee, you are treated as nonproficient with it and take a -4 penalty on attack rolls if you use a javelin as a melee weapon.";
    }

    function sling() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 17;
        name = "Sling";
        cost = 1e17;
        proficiency = 1;
        encumbrance = 5;
        damage_type = 1;
        weight = 0;
        damage = 4;
        critical = 2;
        critical_modifier = 0;
        range_increment = 50;
        description = "Your Strength modifier applies to damage rolls when you use a sling, just as it does for thrown weapons. You can fire, but not load, a sling with one hand. Loading a sling is a move action that requires two hands and provokes attacks of opportunity.";
    }

    function axe() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 18;
        name = "Axe";
        cost = 8e18;
        proficiency = 2;
        encumbrance = 2;
        damage_type = 3;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function hammer_light() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 19;
        name = "Hammer, light";
        cost = 1e18;
        proficiency = 2;
        encumbrance = 2;
        damage_type = 1;
        weight = 2;
        damage = 4;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function handaxe() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 20;
        name = "Handaxe";
        cost = 6e18;
        proficiency = 2;
        encumbrance = 2;
        damage_type = 3;
        weight = 3;
        damage = 6;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function kukri() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 21;
        name = "Kukri";
        cost = 8e18;
        proficiency = 2;
        encumbrance = 2;
        damage_type = 3;
        weight = 2;
        damage = 4;
        critical = 2;
        critical_modifier = -2;
        range_increment = 0;
        description = "";
    }

    function pick_light() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 22;
        name = "Pick, light";
        cost = 4e18;
        proficiency = 2;
        encumbrance = 2;
        damage_type = 2;
        weight = 3;
        damage = 4;
        critical = 4;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function sap() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 23;
        name = "Sap";
        cost = 1e18;
        proficiency = 2;
        encumbrance = 2;
        damage_type = 1;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function sword_short() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 24;
        name = "Sword, short";
        cost = 10e18;
        proficiency = 2;
        encumbrance = 2;
        damage_type = 2;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = -1;
        range_increment = 0;
        description = "";
    }

    function battleaxe() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 25;
        name = "Battleaxe";
        cost = 10e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 3;
        weight = 6;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function flail() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 26;
        name = "Flail";
        cost = 8e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 1;
        weight = 5;
        damage = 8;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "With a flail, you get a +2 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function longsword() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 27;
        name = "Longsword";
        cost = 15e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 3;
        weight = 4;
        damage = 8;
        critical = 2;
        critical_modifier = -1;
        range_increment = 0;
        description = "";
    }

    function pick_heavy() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 28;
        name = "Pick, heavy";
        cost = 8e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 2;
        weight = 6;
        damage = 6;
        critical = 4;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function rapier() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 29;
        name = "Rapier";
        cost = 20e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 2;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = -2;
        range_increment = 0;
        description = "You can use the Weapon Finesse feat to apply your Dexterity modifier instead of your Strength modifier to attack rolls with a rapier sized for you, even though it isnt a light weapon for you. You cant wield a rapier in two hands in order to apply 1.5 times your Strength bonus to damage.";
    }

    function scimitar() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 30;
        name = "Scimitar";
        cost = 15e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 3;
        weight = 4;
        damage = 6;
        critical = 2;
        critical_modifier = -2;
        range_increment = 0;
        description = "";
    }

    function trident() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 31;
        name = "Trident";
        cost = 15e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 2;
        weight = 4;
        damage = 8;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "This weapon can be thrown. If you use a ready action to set a trident against a charge, you deal double damage on a successful hit against a charging character.";
    }

    function warhammer() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 32;
        name = "Warhammer";
        cost = 12e18;
        proficiency = 2;
        encumbrance = 3;
        damage_type = 1;
        weight = 5;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function falchion() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 33;
        name = "Falchion";
        cost = 75e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 3;
        weight = 8;
        damage = 8;
        critical = 2;
        critical_modifier = -2;
        range_increment = 0;
        description = "";
    }

    function glaive() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 34;
        name = "Glaive";
        cost = 8e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 3;
        weight = 10;
        damage = 10;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "A glaive has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function greataxe() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 35;
        name = "Greataxe";
        cost = 20e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 3;
        weight = 12;
        damage = 12;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function greatclub() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 36;
        name = "Greatclub";
        cost = 5e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 1;
        weight = 8;
        damage = 10;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "";
    }

    function flail_heavy() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 37;
        name = "Flail, heavy";
        cost = 15e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 1;
        weight = 10;
        damage = 10;
        critical = 2;
        critical_modifier = -1;
        range_increment = 0;
        description = "With a flail, you get a +2 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function greatsword() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 38;
        name = "Greatsword";
        cost = 50e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 3;
        weight = 8;
        damage = 12;
        critical = 2;
        critical_modifier = -1;
        range_increment = 0;
        description = "";
    }

    function guisarme() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 39;
        name = "Guisarme";
        cost = 9e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 3;
        weight = 12;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "A guisarme has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function halberd() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 40;
        name = "Halberd";
        cost = 10e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 2;
        weight = 12;
        damage = 10;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "If you use a ready action to set a halberd against a charge, you deal double damage on a successful hit against a charging character.";
    }

    function lance() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 41;
        name = "Lance";
        cost = 10e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 2;
        weight = 10;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "A lance deals double damage when used from the back of a charging mount. It has reach, so you can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function ranseur() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 42;
        name = "Ranseur";
        cost = 10e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 2;
        weight = 12;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "A ranseur has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function scythe() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 43;
        name = "Scythe";
        cost = 18e18;
        proficiency = 2;
        encumbrance = 4;
        damage_type = 3;
        weight = 10;
        damage = 8;
        critical = 4;
        critical_modifier = 0;
        range_increment = 0;
        description = "A scythe can be used to make trip attacks. If you are tripped during your own trip attempt, you can drop the scythe to avoid being tripped.";
    }

    function longbow() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 44;
        name = "Longbow";
        cost = 75e18;
        proficiency = 2;
        encumbrance = 5;
        damage_type = 2;
        weight = 3;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 100;
        description = "You need at least two hands to use a bow, regardless of its size. A longbow is too unwieldy to use while you are mounted. If you have a penalty for low Strength, apply it to damage rolls when you use a longbow. If you have a bonus for high Strength, you can apply it to damage rolls when you use a composite longbow (see below) but not a regular longbow.";
    }

    function longbow_composite() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 45;
        name = "Longbow, composite";
        cost = 100e18;
        proficiency = 2;
        encumbrance = 5;
        damage_type = 2;
        weight = 3;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 110;
        description = "You need at least two hands to use a bow, regardless of its size. You can use a composite longbow while mounted. All composite bows are made with a particular strength rating (that is, each requires a minimum Strength modifier to use with proficiency). If your Strength bonus is less than the strength rating of the composite bow, you cant effectively use it, so you take a -2 penalty on attacks with it. The default composite longbow requires a Strength modifier of +0 or higher to use with proficiency. A composite longbow can be made with a high strength rating to take advantage of an above-average Strength score; this feature allows you to add your Strength bonus to damage, up to the maximum bonus indicated for the bow. Each point of Strength bonus granted by the bow adds 100 gp to its cost.";
    }

    function shortbow() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 46;
        name = "Shortbow";
        cost = 30e18;
        proficiency = 2;
        encumbrance = 5;
        damage_type = 2;
        weight = 2;
        damage = 6;
        critical = 3;
        critical_modifier = 0;
        range_increment = 60;
        description = "You need at least two hands to use a bow, regardless of its size. You can use a shortbow while mounted. If you have a penalty for low Strength, apply it to damage rolls when you use a shortbow. If you have a bonus for high Strength, you can apply it to damage rolls when you use a composite shortbow (see below) but not a regular shortbow.";
    }

    function shortbow_composite() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 47;
        name = "Shortbow, composite";
        cost = 75e18;
        proficiency = 2;
        encumbrance = 5;
        damage_type = 2;
        weight = 2;
        damage = 6;
        critical = 3;
        critical_modifier = 0;
        range_increment = 70;
        description = "You need at least two hands to use a bow, regardless of its size. You can use a composite shortbow while mounted. All composite bows are made with a particular strength rating (that is, each requires a minimum Strength modifier to use with proficiency). If your Strength bonus is lower than the strength rating of the composite bow, you cant effectively use it, so you take a -2 penalty on attacks with it. The default composite shortbow requires a Strength modifier of +0 or higher to use with proficiency. A composite shortbow can be made with a high strength rating to take advantage of an above-average Strength score; this feature allows you to add your Strength bonus to damage, up to the maximum bonus indicated for the bow. Each point of Strength bonus granted by the bow adds 75 gp to its cost.";
    }

    function kama() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 48;
        name = "Kama";
        cost = 2e18;
        proficiency = 3;
        encumbrance = 2;
        damage_type = 3;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "The kama is a special monk weapon. This designation gives a monk wielding a kama special options.";
    }

    function nunchaku() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 49;
        name = "Nunchaku";
        cost = 2e18;
        proficiency = 3;
        encumbrance = 2;
        damage_type = 1;
        weight = 2;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "The nunchaku is a special monk weapon. This designation gives a monk wielding a nunchaku special options. With a nunchaku, you get a +2 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function sai() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 50;
        name = "Sai";
        cost = 1e18;
        proficiency = 3;
        encumbrance = 2;
        damage_type = 1;
        weight = 1;
        damage = 4;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "With a sai, you get a +4 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function siangham() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 51;
        name = "Siangham";
        cost = 3e18;
        proficiency = 3;
        encumbrance = 2;
        damage_type = 2;
        weight = 1;
        damage = 6;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "The siangham is a special monk weapon. This designation gives a monk wielding a siangham special options.";
    }

    function sword_bastard() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 52;
        name = "Sword, bastard";
        cost = 35e18;
        proficiency = 3;
        encumbrance = 3;
        damage_type = 3;
        weight = 6;
        damage = 10;
        critical = 2;
        critical_modifier = -1;
        range_increment = 0;
        description = "A bastard sword is too large to use in one hand without special training; thus, it is an exotic weapon. A character can use a bastard sword two-handed as a martial weapon.";
    }

    function waraxe_dwarven() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 53;
        name = "Waraxe, dwarven";
        cost = 30e18;
        proficiency = 3;
        encumbrance = 3;
        damage_type = 3;
        weight = 8;
        damage = 10;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "A dwarven waraxe is too large to use in one hand without special training; thus, it is an exotic weapon. A Medium character can use a dwarven waraxe two-handed as a martial weapon, or a Large creature can use it one-handed in the same way. A dwarf treats a dwarven waraxe as a martial weapon even when using it in one hand.";
    }

    function axe_orc_double() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 54;
        name = "Axe, orc double";
        cost = 60e18;
        proficiency = 3;
        encumbrance = 4;
        damage_type = 3;
        weight = 15;
        damage = 8;
        critical = 3;
        critical_modifier = 0;
        range_increment = 0;
        description = "An orc double axe is a double weapon. You can fight with it as if fighting with two weapons, but if you do, you incur all the normal attack penalties associated with fighting with two weapons, just as if you were using a one-handed weapon and a light weapon.";
    }

    function chain_spiked() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 55;
        name = "Chain, spiked";
        cost = 25e18;
        proficiency = 3;
        encumbrance = 4;
        damage_type = 2;
        weight = 10;
        damage = 8;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "A spiked chain has reach, so you can strike opponents 10 feet away with it. In addition, unlike most other weapons with reach, it can be used against an adjacent foe.";
    }

    function flail_dire() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 56;
        name = "Flail, dire";
        cost = 90e18;
        proficiency = 3;
        encumbrance = 4;
        damage_type = 1;
        weight = 10;
        damage = 8;
        critical = 2;
        critical_modifier = 0;
        range_increment = 0;
        description = "A dire flail is a double weapon. You can fight with it as if fighting with two weapons, but if you do, you incur all the normal attack penalties associated with fighting with two weapons, just as if you were using a one-handed weapon and a light weapon. A creature wielding a dire flail in one hand cant use it as a double weapon- only one end of the weapon can be used in any given round.";
    }

    function crossbow_hand() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 57;
        name = "Crossbow, hand";
        cost = 100e18;
        proficiency = 3;
        encumbrance = 5;
        damage_type = 2;
        weight = 2;
        damage = 4;
        critical = 2;
        critical_modifier = -1;
        range_increment = 30;
        description = "You can draw a hand crossbow back by hand. Loading a hand crossbow is a move action that provokes attacks of opportunity.";
    }

    function crossbow_repeating_heavy() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 58;
        name = "Crossbow, repeating heavy";
        cost = 400e18;
        proficiency = 3;
        encumbrance = 5;
        damage_type = 2;
        weight = 12;
        damage = 10;
        critical = 2;
        critical_modifier = -1;
        range_increment = 120;
        description = "The repeating crossbow (whether heavy or light) holds 5 crossbow bolts. As long as it holds bolts, you can reload it by pulling the reloading lever (a free action). Loading a new case of 5 bolts is a full-round action that provokes attacks of opportunity.";
    }

    function crossbow_repeating_light() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint encumbrance,
        uint damage_type,
        uint weight,
        uint damage,
        uint critical,
        int critical_modifier,
        uint range_increment,
        string memory name,
        string memory description
    ) {
        id = 59;
        name = "Crossbow, repeating light";
        cost = 250e18;
        proficiency = 3;
        encumbrance = 5;
        damage_type = 2;
        weight = 6;
        damage = 8;
        critical = 2;
        critical_modifier = -1;
        range_increment = 80;
        description = "The repeating crossbow (whether heavy or light) holds 5 crossbow bolts. As long as it holds bolts, you can reload it by pulling the reloading lever (a free action). Loading a new case of 5 bolts is a full-round action that provokes attacks of opportunity.";
    }
}
