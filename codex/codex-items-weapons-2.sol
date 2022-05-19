// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../library/Codex.sol";

contract codex {
    string public constant index = "Items";
    string public constant class = "Weapons";

    function get_proficiency_by_id(uint256 _id)
        public
        pure
        returns (string memory description)
    {
        if (_id == 1) {
            return "Simple";
        } else if (_id == 2) {
            return "Martial";
        } else if (_id == 3) {
            return "Exotic";
        }
    }

    function get_encumbrance_by_id(uint256 _id)
        public
        pure
        returns (string memory description)
    {
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

    function get_damage_type_by_id(uint256 _id)
        public
        pure
        returns (string memory description)
    {
        if (_id == 1) {
            return "Bludgeoning";
        } else if (_id == 2) {
            return "Piercing";
        } else if (_id == 3) {
            return "Slashing";
        }
    }

    function get_attack_bonus(uint256 id) public pure returns (int8) {
        id; //shhh
        return 0;
    }

    function item_by_id(uint256 _id)
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
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

    function gauntlet() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 1;
        weapon.name = "Gauntlet";
        weapon.cost = 2e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 1;
        weapon.damage_type = 1;
        weapon.weight = 1;
        weapon.damage = 3;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This metal glove lets you deal lethal damage rather than nonlethal damage with unarmed strikes. A strike with a gauntlet is otherwise considered an unarmed attack. The cost and weight given are for a single gauntlet. Medium and heavy armors (except breastplate) come with gauntlets.";
    }

    function dagger() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 2;
        weapon.name = "Dagger";
        weapon.cost = 2e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 2;
        weapon.damage_type = 2;
        weapon.weight = 1;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 0;
        weapon
            .description = "You get a +2 bonus on Sleight of Hand checks made to conceal a dagger on your body (see the Sleight of Hand skill).";
    }

    function gauntlet_spiked()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 3;
        weapon.name = "Gauntlet, spiked";
        weapon.cost = 5e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 2;
        weapon.damage_type = 2;
        weapon.weight = 1;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "Your opponent cannot use a disarm action to disarm you of spiked gauntlets. The cost and weight given are for a single gauntlet. An attack with a spiked gauntlet is considered an armed attack.";
    }

    function mace_light() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 4;
        weapon.name = "Mace, light";
        weapon.cost = 5e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 2;
        weapon.damage_type = 1;
        weapon.weight = 4;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A light mace is made up of an ornate metal head attached to a simple wooden or metal shaft.";
    }

    function sickle() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 5;
        weapon.name = "Sickle";
        weapon.cost = 6e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 2;
        weapon.damage_type = 3;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A sickle can be used to make trip attacks. If you are tripped during your own trip attempt, you can drop the sickle to avoid being tripped.";
    }

    function club() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 6;
        weapon.name = "Club";
        weapon.cost = 1e17;
        weapon.proficiency = 1;
        weapon.encumbrance = 3;
        weapon.damage_type = 1;
        weapon.weight = 3;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This weapon is usually just a shaped piece of wood, sometimes with a few nails or studs embedded in it.";
    }

    function mace_heavy() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 7;
        weapon.name = "Mace, heavy";
        weapon.cost = 12e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 3;
        weapon.damage_type = 1;
        weapon.weight = 8;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A heavy mace has a larger head and a longer handle than a normal (light) mace.";
    }

    function morningstar() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 8;
        weapon.name = "Morningstar";
        weapon.cost = 8e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 3;
        weapon.damage_type = 1;
        weapon.weight = 6;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A morningstar is a spiked metal ball, affixed to the top of a long handle.";
    }

    function shortspear() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 9;
        weapon.name = "Shortspear";
        weapon.cost = 1e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 3;
        weapon.damage_type = 2;
        weapon.weight = 3;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A shortspear is small enough to wield one-handed. It may also be thrown.";
    }

    function longspear() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 10;
        weapon.name = "Longspear";
        weapon.cost = 5e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 4;
        weapon.damage_type = 2;
        weapon.weight = 9;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A longspear has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe. If you use a ready action to set a longspear against a charge, you deal double damage on a successful hit against a charging character.";
    }

    function quarterstaff() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 11;
        weapon.name = "Quarterstaff";
        weapon.cost = 1e17;
        weapon.proficiency = 1;
        weapon.encumbrance = 4;
        weapon.damage_type = 1;
        weapon.weight = 4;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A quarterstaff is a double weapon. You can fight with it as if fighting with two weapons, but if you do, you incur all the normal attack penalties associated with fighting with two weapons, just as if you were using a one-handed weapon and a light weapon. A creature wielding a quarterstaff in one hand cant use it as a double weapon-only one end of the weapon can be used in any given round.";
    }

    function spear() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 12;
        weapon.name = "Spear";
        weapon.cost = 2e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 4;
        weapon.damage_type = 2;
        weapon.weight = 6;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon.description = "A spear is 5 feet in length and can be thrown.";
    }

    function crossbow_heavy()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 13;
        weapon.name = "Crossbow, heavy";
        weapon.cost = 50e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 8;
        weapon.damage = 10;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 120;
        weapon
            .description = "You draw a heavy crossbow back by turning a small winch. Loading a heavy crossbow is a full-round action that provokes attacks of opportunity.";
    }

    function crossbow_light()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 14;
        weapon.name = "Crossbow, light";
        weapon.cost = 35e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 4;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 80;
        weapon
            .description = "You draw a light crossbow back by pulling a lever. Loading a light crossbow is a move action that provokes attacks of opportunity.";
    }

    function dart() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 15;
        weapon.name = "Dart";
        weapon.cost = 5e17;
        weapon.proficiency = 1;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 1;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 20;
        weapon
            .description = "Darts are missile weapons, designed to fly such that a sharp, often weighted point will strike first.";
    }

    function javelin() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 16;
        weapon.name = "Javelin";
        weapon.cost = 1e18;
        weapon.proficiency = 1;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 30;
        weapon
            .description = "Since it is not designed for melee, you are treated as nonproficient with it and take a -4 penalty on attack rolls if you use a javelin as a melee weapon.";
    }

    function sling() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 17;
        weapon.name = "Sling";
        weapon.cost = 1e17;
        weapon.proficiency = 1;
        weapon.encumbrance = 5;
        weapon.damage_type = 1;
        weapon.weight = 0;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 50;
        weapon
            .description = "Your Strength modifier applies to damage rolls when you use a sling, just as it does for thrown weapons. You can fire, but not load, a sling with one hand. Loading a sling is a move action that requires two hands and provokes attacks of opportunity.";
    }

    function axe() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 18;
        weapon.name = "Axe, Throwing";
        weapon.cost = 8e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 5;
        weapon.damage_type = 3;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 10;
        weapon.description = "This is a small axe balanced for throwing.";
    }

    function hammer_light() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 19;
        weapon.name = "Hammer, light";
        weapon.cost = 1e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 2;
        weapon.damage_type = 1;
        weapon.weight = 2;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A lighter version of a warhammer, this weapon usually has a sleek metal head with one striking surface.";
    }

    function handaxe() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 20;
        weapon.name = "Handaxe";
        weapon.cost = 6e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 2;
        weapon.damage_type = 3;
        weapon.weight = 3;
        weapon.damage = 6;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This one-handed axe is short (roughly 1 foot long) and designed for use with one hand.";
    }

    function kukri() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 21;
        weapon.name = "Kukri";
        weapon.cost = 8e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 2;
        weapon.damage_type = 3;
        weapon.weight = 2;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = -2;
        weapon.range_increment = 0;
        weapon
            .description = "A kukri is a curved blade, about 1 foot in length.";
    }

    function pick_light() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 22;
        weapon.name = "Pick, light";
        weapon.cost = 4e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 2;
        weapon.damage_type = 2;
        weapon.weight = 3;
        weapon.damage = 4;
        weapon.critical = 4;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This weapon, adapted from the pickaxe tool, has a head with a slightly curved, armorpiercing spike and a hammerlike counterweight.";
    }

    function sap() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 23;
        weapon.name = "Sap";
        weapon.cost = 1e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 2;
        weapon.damage_type = 1;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This weapon consists of a soft wrapping around a hard, dense core, typically a leather sheath around a lead rod.";
    }

    function sword_short() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 24;
        weapon.name = "Sword, short";
        weapon.cost = 10e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 2;
        weapon.damage_type = 2;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 0;
        weapon.description = "This sword is around 2 feet in length.";
    }

    function battleaxe() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 25;
        weapon.name = "Battleaxe";
        weapon.cost = 10e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 3;
        weapon.weight = 6;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "The handle of this axe is long enough that you can wield it one-handed or two-handed. The head may have one blade or two.";
    }

    function flail() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 26;
        weapon.name = "Flail";
        weapon.cost = 8e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 1;
        weapon.weight = 5;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "With a flail, you get a +2 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function longsword() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 27;
        weapon.name = "Longsword";
        weapon.cost = 15e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 3;
        weapon.weight = 4;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 0;
        weapon.description = "This sword is about 3.5 feet in length.";
    }

    function pick_heavy() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 28;
        weapon.name = "Pick, heavy";
        weapon.cost = 8e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 2;
        weapon.weight = 6;
        weapon.damage = 6;
        weapon.critical = 4;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This variant of the light pick has a longer handle and can be used with one or two hands.";
    }

    function rapier() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 29;
        weapon.name = "Rapier";
        weapon.cost = 20e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 2;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = -2;
        weapon.range_increment = 0;
        weapon
            .description = "You can use the Weapon Finesse feat to apply your Dexterity modifier instead of your Strength modifier to attack rolls with a rapier sized for you, even though it isnt a light weapon for you. You cant wield a rapier in two hands in order to apply 1.5 times your Strength bonus to damage.";
    }

    function scimitar() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 30;
        weapon.name = "Scimitar";
        weapon.cost = 15e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 3;
        weapon.weight = 4;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = -2;
        weapon.range_increment = 0;
        weapon
            .description = "This curved sword is shorter than a longsword and longer than a shortsword. Only the outer edge is sharp, and the back is flat, giving the blade a triangular cross-section.";
    }

    function trident() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 31;
        weapon.name = "Trident";
        weapon.cost = 15e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 2;
        weapon.weight = 4;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This weapon can be thrown. If you use a ready action to set a trident against a charge, you deal double damage on a successful hit against a charging character.";
    }

    function warhammer() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 32;
        weapon.name = "Warhammer";
        weapon.cost = 12e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 3;
        weapon.damage_type = 1;
        weapon.weight = 5;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This weapon consists of a wooden haft and a heavy, metal head.";
    }

    function falchion() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 33;
        weapon.name = "Falchion";
        weapon.cost = 75e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 3;
        weapon.weight = 8;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = -2;
        weapon.range_increment = 0;
        weapon
            .description = "This sword has one curved, sharp edge like a scimitar, with the back edge unsharpened and either flat or slightly curved.";
    }

    function glaive() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 34;
        weapon.name = "Glaive";
        weapon.cost = 8e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 3;
        weapon.weight = 10;
        weapon.damage = 10;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A glaive has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function greataxe() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 35;
        weapon.name = "Greataxe";
        weapon.cost = 20e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 3;
        weapon.weight = 12;
        weapon.damage = 12;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This two-handed battle axe is heavy enough that you can't wield it with one hand. The head may have one blade or two.";
    }

    function greatclub() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 36;
        weapon.name = "Greatclub";
        weapon.cost = 5e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 1;
        weapon.weight = 8;
        weapon.damage = 10;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "This larger, bulkier version of the common club is heavy enough that you can't wield it with one hand.";
    }

    function flail_heavy() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 37;
        weapon.name = "Flail, heavy";
        weapon.cost = 15e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 1;
        weapon.weight = 10;
        weapon.damage = 10;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 0;
        weapon
            .description = "With a flail, you get a +2 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function greatsword() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 38;
        weapon.name = "Greatsword";
        weapon.cost = 50e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 3;
        weapon.weight = 8;
        weapon.damage = 12;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 0;
        weapon
            .description = "This immense two-handed sword is about 5 feet in length. A greatsword may have a dulled lower blade that can be gripped.";
    }

    function guisarme() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 39;
        weapon.name = "Guisarme";
        weapon.cost = 9e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 3;
        weapon.weight = 12;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A guisarme has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function halberd() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 40;
        weapon.name = "Halberd";
        weapon.cost = 10e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 2;
        weapon.weight = 12;
        weapon.damage = 10;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "If you use a ready action to set a halberd against a charge, you deal double damage on a successful hit against a charging character.";
    }

    function lance() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 41;
        weapon.name = "Lance";
        weapon.cost = 10e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 2;
        weapon.weight = 10;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A lance deals double damage when used from the back of a charging mount. It has reach, so you can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function ranseur() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 42;
        weapon.name = "Ranseur";
        weapon.cost = 10e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 2;
        weapon.weight = 12;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A ranseur has reach. You can strike opponents 10 feet away with it, but you cant use it against an adjacent foe.";
    }

    function scythe() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 43;
        weapon.name = "Scythe";
        weapon.cost = 18e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 4;
        weapon.damage_type = 3;
        weapon.weight = 10;
        weapon.damage = 8;
        weapon.critical = 4;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A scythe can be used to make trip attacks. If you are tripped during your own trip attempt, you can drop the scythe to avoid being tripped.";
    }

    function longbow() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 44;
        weapon.name = "Longbow";
        weapon.cost = 75e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 3;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 100;
        weapon
            .description = "You need at least two hands to use a bow, regardless of its size. A longbow is too unwieldy to use while you are mounted. If you have a penalty for low Strength, apply it to damage rolls when you use a longbow. If you have a bonus for high Strength, you can apply it to damage rolls when you use a composite longbow (see below) but not a regular longbow.";
    }

    function longbow_composite()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 45;
        weapon.name = "Longbow, composite";
        weapon.cost = 100e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 3;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 110;
        weapon
            .description = "You need at least two hands to use a bow, regardless of its size. You can use a composite longbow while mounted. All composite bows are made with a particular strength rating (that is, each requires a minimum Strength modifier to use with proficiency). If your Strength bonus is less than the strength rating of the composite bow, you cant effectively use it, so you take a -2 penalty on attacks with it. The default composite longbow requires a Strength modifier of +0 or higher to use with proficiency. A composite longbow can be made with a high strength rating to take advantage of an above-average Strength score; this feature allows you to add your Strength bonus to damage, up to the maximum bonus indicated for the bow. Each point of Strength bonus granted by the bow adds 100 gp to its cost.";
    }

    function shortbow() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 46;
        weapon.name = "Shortbow";
        weapon.cost = 30e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 60;
        weapon
            .description = "You need at least two hands to use a bow, regardless of its size. You can use a shortbow while mounted. If you have a penalty for low Strength, apply it to damage rolls when you use a shortbow. If you have a bonus for high Strength, you can apply it to damage rolls when you use a composite shortbow (see below) but not a regular shortbow.";
    }

    function shortbow_composite()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 47;
        weapon.name = "Shortbow, composite";
        weapon.cost = 75e18;
        weapon.proficiency = 2;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 70;
        weapon
            .description = "You need at least two hands to use a bow, regardless of its size. You can use a composite shortbow while mounted. All composite bows are made with a particular strength rating (that is, each requires a minimum Strength modifier to use with proficiency). If your Strength bonus is lower than the strength rating of the composite bow, you cant effectively use it, so you take a -2 penalty on attacks with it. The default composite shortbow requires a Strength modifier of +0 or higher to use with proficiency. A composite shortbow can be made with a high strength rating to take advantage of an above-average Strength score; this feature allows you to add your Strength bonus to damage, up to the maximum bonus indicated for the bow. Each point of Strength bonus granted by the bow adds 75 gp to its cost.";
    }

    function kama() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 48;
        weapon.name = "Kama";
        weapon.cost = 2e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 2;
        weapon.damage_type = 3;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "The kama is a special monk weapon. This designation gives a monk wielding a kama special options.";
    }

    function nunchaku() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 49;
        weapon.name = "Nunchaku";
        weapon.cost = 2e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 2;
        weapon.damage_type = 1;
        weapon.weight = 2;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "The nunchaku is a special monk weapon. This designation gives a monk wielding a nunchaku special options. With a nunchaku, you get a +2 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function sai() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 50;
        weapon.name = "Sai";
        weapon.cost = 1e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 2;
        weapon.damage_type = 1;
        weapon.weight = 1;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "With a sai, you get a +4 bonus on opposed attack rolls made to disarm an enemy (including the roll to avoid being disarmed if such an attempt fails).";
    }

    function siangham() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 51;
        weapon.name = "Siangham";
        weapon.cost = 3e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 2;
        weapon.damage_type = 2;
        weapon.weight = 1;
        weapon.damage = 6;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "The siangham is a special monk weapon. This designation gives a monk wielding a siangham special options.";
    }

    function sword_bastard()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 52;
        weapon.name = "Sword, bastard";
        weapon.cost = 35e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 3;
        weapon.damage_type = 3;
        weapon.weight = 6;
        weapon.damage = 10;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 0;
        weapon
            .description = "A bastard sword is too large to use in one hand without special training; thus, it is an exotic weapon. A character can use a bastard sword two-handed as a martial weapon.";
    }

    function waraxe_dwarven()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 53;
        weapon.name = "Waraxe, dwarven";
        weapon.cost = 30e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 3;
        weapon.damage_type = 3;
        weapon.weight = 8;
        weapon.damage = 10;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A dwarven waraxe is too large to use in one hand without special training; thus, it is an exotic weapon. A Medium character can use a dwarven waraxe two-handed as a martial weapon, or a Large creature can use it one-handed in the same way. A dwarf treats a dwarven waraxe as a martial weapon even when using it in one hand.";
    }

    function axe_orc_double()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 54;
        weapon.name = "Axe, orc double";
        weapon.cost = 60e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 4;
        weapon.damage_type = 3;
        weapon.weight = 15;
        weapon.damage = 8;
        weapon.critical = 3;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "An orc double axe is a double weapon. You can fight with it as if fighting with two weapons, but if you do, you incur all the normal attack penalties associated with fighting with two weapons, just as if you were using a one-handed weapon and a light weapon.";
    }

    function chain_spiked() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 55;
        weapon.name = "Chain, spiked";
        weapon.cost = 25e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 4;
        weapon.damage_type = 2;
        weapon.weight = 10;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A spiked chain has reach, so you can strike opponents 10 feet away with it. In addition, unlike most other weapons with reach, it can be used against an adjacent foe.";
    }

    function flail_dire() public pure returns (IWeapon.Weapon memory weapon) {
        weapon.id = 56;
        weapon.name = "Flail, dire";
        weapon.cost = 90e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 4;
        weapon.damage_type = 1;
        weapon.weight = 10;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = 0;
        weapon.range_increment = 0;
        weapon
            .description = "A dire flail is a double weapon. You can fight with it as if fighting with two weapons, but if you do, you incur all the normal attack penalties associated with fighting with two weapons.";
    }

    function crossbow_hand()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 57;
        weapon.name = "Crossbow, hand";
        weapon.cost = 100e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 2;
        weapon.damage = 4;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 30;
        weapon
            .description = "You can draw a hand crossbow back by hand. Loading a hand crossbow is a move action that provokes attacks of opportunity.";
    }

    function crossbow_repeating_heavy()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 58;
        weapon.name = "Crossbow, repeating heavy";
        weapon.cost = 400e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 12;
        weapon.damage = 10;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 120;
        weapon
            .description = "The repeating crossbow (whether heavy or light) holds 5 crossbow bolts. As long as it holds bolts, you can reload it by pulling the reloading lever (a free action). Loading a new case of 5 bolts is a full-round action that provokes attacks of opportunity.";
    }

    function crossbow_repeating_light()
        public
        pure
        returns (IWeapon.Weapon memory weapon)
    {
        weapon.id = 59;
        weapon.name = "Crossbow, repeating light";
        weapon.cost = 250e18;
        weapon.proficiency = 3;
        weapon.encumbrance = 5;
        weapon.damage_type = 2;
        weapon.weight = 6;
        weapon.damage = 8;
        weapon.critical = 2;
        weapon.critical_modifier = -1;
        weapon.range_increment = 80;
        weapon
            .description = "The repeating crossbow (whether heavy or light) holds 5 crossbow bolts. As long as it holds bolts, you can reload it by pulling the reloading lever (a free action). Loading a new case of 5 bolts is a full-round action that provokes attacks of opportunity.";
    }
}
