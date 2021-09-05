// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Feats";
    string constant public class = "Any";

    function feat_by_id(uint _id) external pure returns(
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        if (_id == 1) {
            return acrobatic();
        } else if (_id == 2) {
            return agile();
        } else if (_id == 3) {
            return alertness();
        } else if (_id == 4) {
            return animal_affinity();
        }
    }

    function acrobatic() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 1;
        name = "Acrobat";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Jump checks and Tumble checks.";
    }

    function agile() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 2;
        name = "Agile";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Balance checks and Escape Artist checks.";
    }

    function alertness() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 3;
        name = "Alertness";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Listen checks and Spot checks.";
    }

    function animal_affinity() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 4;
        name = "Animal Affinity";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Handle Animal checks and Ride checks.";
    }

    function armor_proficiency_light() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 5;
        name = "Armor Proficiency (Light)";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "When you wear a type of armor with which you are proficient, the armor check penalty for that armor applies only to Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Sleight of Hand, and Tumble checks.";
    }

    function armor_proficiency_medium() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 6;
        name = "Armor Proficiency (Medium)";
        prerequisites = true;
        prequisite_feat = 5;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "When you wear a type of armor with which you are proficient, the armor check penalty for that armor applies only to Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Sleight of Hand, and Tumble checks.";
    }

    function armor_proficiency_heavy() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 7;
        name = "Armor Proficiency (Heavy)";
        prerequisites = true;
        prequisite_feat = 6;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "When you wear a type of armor with which you are proficient, the armor check penalty for that armor applies only to Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Sleight of Hand, and Tumble checks.";
    }

    function athletic() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 8;
        name = "Athletic";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Climb checks and Swim checks.";
    }

    function spell_focus() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 9;
        name = "Spell Focus";
        prerequisites = true;
        prequisite_feat = 0;
        preprequisite_class = 1614;
        prequisite_level = 0;
        benefit = "Add +1 to the Difficulty Class for all saving throws against spells from the school of magic you select.";
    }

    function augment_summoning() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 10;
        name = "Augment Summoning";
        prerequisites = true;
        prequisite_feat = 9;
        preprequisite_class = 1614;
        prequisite_level = 0;
        benefit = "Each creature you conjure with any summon spell gains a +4 enhancement bonus to Strength and Constitution for the duration of the spell that summoned it.";
    }

    function blind_fight() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 10;
        name = "Blind-Fight";
        prerequisites = true;
        prequisite_feat = 9;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "In melee, every time you miss because of concealment, you can reroll your miss chance percentile roll one time to see if you actually hit. An invisible attacker gets no advantages related to hitting you in melee. That is, you dont lose your Dexterity bonus to Armor Class, and the attacker doesnt get the usual +2 bonus for being invisible. The invisible attackers bonuses do still apply for ranged attacks, however. You take only half the usual penalty to speed for being unable to see. Darkness and poor visibility in general reduces your speed to three-quarters normal, instead of one half.";
    }

    function brew_potion() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 11;
        name = "Brew Potion";
        prerequisites = true;
        prequisite_feat = 0;
        preprequisite_class = 1540;
        prequisite_level = 3;
        benefit = "You can create a potion of any 3rd level or lower spell that you know and that targets one or more creatures. Brewing a potion takes one day. When you create a potion, you set the caster level, which must be sufficient to cast the spell in question and no higher than your own level. The base price of a potion is its spell level * its caster level * 50 gp. To brew a potion, you must spend 1/25 of this base price in XP and use up raw materials costing one half this base price. When you create a potion, you make any choices that you would normally make when casting the spell. Whoever drinks the potion is the target of the spell. Any potion that stores a spell with a costly material component or an XP cost also carries a commensurate cost. In addition to the costs derived from the base price, you must expend the material component or pay the XP when creating the potion.";
    }

    function power_attack() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 12;
        name = "Power Attack";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "On your action, before making attack rolls for a round, you may choose to subtract a number from all melee attack rolls and add the same number to all melee damage rolls. This number may not exceed your base attack bonus. The penalty on attacks and bonus on damage apply until your next turn.";
    }

    function cleave() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 13;
        name = "Cleave";
        prerequisites = true;
        prequisite_feat = 12;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "If you deal a creature enough damage to make it drop (typically by dropping it to below 0 hit points or killing it), you get an immediate, extra melee attack against another creature within reach. You cannot take a 5-foot step before making this extra attack. The extra attack is with the same weapon and at the same bonus as the attack that dropped the previous creature. You can use this ability once per round.";
    }

    function combat_casting() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 14;
        name = "Combat Casting";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +4 bonus on Concentration checks made to cast a spell or use a spell-like ability while on the defensive or while you are grappling or pinned.";
    }

    function combat_expertise() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 15;
        name = "Combat Expertise";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "When you use the attack action or the full attack action in melee, you can take a penalty of as much as -5 on your attack roll and add the same number (+5 or less) as a dodge bonus to your Armor Class. This number may not exceed your base attack bonus. The changes to attack rolls and Armor Class last until your next action.";
    }

    function combat_reflexes() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 16;
        name = "Combat Reflexes";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You may make a number of additional attacks of opportunity equal to your Dexterity bonus. With this feat, you may also make attacks of opportunity while flat-footed.";
    }

    function craft_magic_arms_and_armor() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 17;
        name = "Craft Magic Arms And Armor";
        prerequisites = true;
        prequisite_feat = 0;
        preprequisite_class = 1540;
        prequisite_level = 5;
        benefit = "You can create any magic weapon, armor, or shield whose prerequisites you meet. Enhancing a weapon, suit of armor, or shield takes one day for each 1,000 gp in the price of its magical features. To enhance a weapon, suit of armor, or shield, you must spend 1/25 of its features total price in XP and use up raw materials costing one-half of this total price. The weapon, armor, or shield to be enhanced must be a masterwork item that you provide. Its cost is not included in the above cost. You can also mend a broken magic weapon, suit of armor, or shield if it is one that you could make. Doing so costs half the XP, half the raw materials, and half the time it would take to craft that item in the first place.";
    }

    function craft_rod() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 18;
        name = "Craft Rod";
        prerequisites = true;
        prequisite_feat = 0;
        preprequisite_class = 1540;
        prequisite_level = 9;
        benefit = "You can create any rod whose prerequisites you meet. Crafting a rod takes one day for each 1,000 gp in its base price. To craft a rod, you must spend 1/25 of its base price in XP and use up raw materials costing one-half of its base price. Some rods incur extra costs in material components or XP, as noted in their descriptions. These costs are in addition to those derived from the rods base price.";
    }

    function craft_staff() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 19;
        name = "Craft Staff";
        prerequisites = true;
        prequisite_feat = 0;
        preprequisite_class = 1540;
        prequisite_level = 12;
        benefit = "You can create any staff whose prerequisites you meet. Crafting a staff takes one day for each 1,000 gp in its base price. To craft a staff, you must spend 1/25 of its base price in XP and use up raw materials costing one-half of its base price. A newly created staff has 50 charges. Some staffs incur extra costs in material components or XP, as noted in their descriptions. These costs are in addition to those derived from the staffs base price.";
    }

    function craft_wand() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 20;
        name = "Craft Wand";
        prerequisites = true;
        prequisite_feat = 0;
        preprequisite_class = 1540;
        prequisite_level = 5;
        benefit = "You can create a wand of any 4th-level or lower spell that you know. Crafting a wand takes one day for each 1,000 gp in its base price. The base price of a wand is its caster level * the spell level * 750 gp. To craft a wand, you must spend 1/25 of this base price in XP and use up raw materials costing one half of this base price. A newly created wand has 50 charges. Any wand that stores a spell with a costly material component or an XP cost also carries a commensurate cost. In addition to the cost derived from the base price, you must expend fifty copies of the material component or pay fifty times the XP cost.";
    }

    function craft_wondrous_item() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 21;
        name = "Craft Wondrous Item";
        prerequisites = true;
        prequisite_feat = 0;
        preprequisite_class = 1540;
        prequisite_level = 3;
        benefit = "You can create any wondrous item whose prerequisites you meet. Enchanting a wondrous item takes one day for each 1,000 gp in its price. To enchant a wondrous item, you must spend 1/25 of the items price in XP and use up raw materials costing half of this price. You can also mend a broken wondrous item if it is one that you could make. Doing so costs half the XP, half the raw materials, and half the time it would take to craft that item in the first place. Some wondrous items incur extra costs in material components or XP, as noted in their descriptions. These costs are in addition to those derived from the items base price. You must pay such a cost to create an item or to mend a broken one.";
    }

    function deceitful() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 22;
        name = "Deceitful";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Disguise checks and Forgery checks.";
    }

    function improved_unarmed_strike() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 23;
        name = "Improved Unarmed Strike";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You are considered to be armed even when unarmed that is, you do not provoke attacks or opportunity from armed opponents when you attack them while unarmed. However, you still get an attack of opportunity against any opponent who makes an unarmed attack on you. In addition, your unarmed strikes can deal lethal or nonlethal damage, at your option.";
    }

    function deflect_arrows() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 24;
        name = "Deflect Arrows";
        prerequisites = true;
        prequisite_feat = 23;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You must have at least one hand free (holding nothing) to use this feat. Once per round when you would normally be hit with a ranged weapon, you may deflect it so that you take no damage from it. You must be aware of the attack and not flat-footed. Attempting to deflect a ranged weapon doesnt count as an action. Unusually massive ranged weapons and ranged attacks generated by spell effects cant be deflected.";
    }

    function deft_hands() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 25;
        name = "Deft Hands";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Sleight of Hand checks and Use Rope checks.";
    }

    function endurance() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 26;
        name = "Endurance";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You gain a +4 bonus on the following checks and saves: Swim checks made to resist nonlethal damage, Constitution checks made to continue running, Constitution checks made to avoid nonlethal damage from a forced march, Constitution checks made to hold your breath, Constitution checks made to avoid nonlethal damage from starvation or thirst, Fortitude saves made to avoid nonlethal damage from hot or cold environments, and Fortitude saves made to resist damage from suffocation. Also, you may sleep in light or medium armor without becoming fatigued.";
    }

    function diehard() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 27;
        name = "Diehard";
        prerequisites = true;
        prequisite_feat = 26;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "When reduced to between -1 and -9 hit points, you automatically become stable. You dont have to roll d% to see if you lose 1 hit point each round. When reduced to negative hit points, you may choose to act as if you were disabled, rather than dying. You must make this decision as soon as you are reduced to negative hit points (even if it isnt your turn). If you do not choose to act as if you were disabled, you immediately fall unconscious. When using this feat, you can take either a single move or standard action each turn, but not both, and you cannot take a full round action. You can take a move action without further injuring yourself, but if you perform any standard action (or any other action deemed as strenuous, including some free actions, swift actions, or immediate actions, such as casting a quickened spell) you take 1 point of damage after completing the act. If you reach -10 hit points, you immediately die.";
    }

    function diligent() public pure returns (
        uint id,
        string memory name,
        bool prerequisites,
        uint prequisite_feat,
        uint preprequisite_class,
        uint prequisite_level,
        string memory benefit
    ) {
        id = 28;
        name = "Diligent";
        prerequisites = false;
        prequisite_feat = 0;
        preprequisite_class = 2047;
        prequisite_level = 0;
        benefit = "You get a +2 bonus on all Appraise checks and Decipher Script checks.";
    }
}
