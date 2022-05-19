// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../library/Codex.sol";

contract codex {
    string public constant index = "Items";
    string public constant class = "Armor";

    function get_proficiency_by_id(uint256 _id)
        public
        pure
        returns (string memory description)
    {
        if (_id == 1) {
            return "Light";
        } else if (_id == 2) {
            return "Medium";
        } else if (_id == 3) {
            return "Heavy";
        } else if (_id == 4) {
            return "Shields";
        }
    }

    function armor_check_bonus(uint256 id) public pure returns (int8) {
        id; //shhh
        return 0;
    }

    function item_by_id(uint256 _id)
        public
        pure
        returns (IArmor.Armor memory armor)
    {
        if (_id == 1) {
            return padded();
        } else if (_id == 2) {
            return leather();
        } else if (_id == 3) {
            return studded_leather();
        } else if (_id == 4) {
            return chain_shirt();
        } else if (_id == 5) {
            return hide();
        } else if (_id == 6) {
            return scale_mail();
        } else if (_id == 7) {
            return chainmail();
        } else if (_id == 8) {
            return breastplate();
        } else if (_id == 9) {
            return splint_mail();
        } else if (_id == 10) {
            return banded_mail();
        } else if (_id == 11) {
            return half_plate();
        } else if (_id == 12) {
            return full_plate();
        } else if (_id == 13) {
            return buckler();
        } else if (_id == 14) {
            return shield_light_wooden();
        } else if (_id == 15) {
            return shield_light_steel();
        } else if (_id == 16) {
            return shield_heavy_wooden();
        } else if (_id == 17) {
            return shield_heavy_steel();
        } else if (_id == 18) {
            return shield_tower();
        }
    }

    function padded() public pure returns (IArmor.Armor memory armor) {
        armor.id = 1;
        armor.name = "Padded";
        armor.cost = 5e18;
        armor.proficiency = 1;
        armor.weight = 10;
        armor.armor_bonus = 1;
        armor.max_dex_bonus = 8;
        armor.penalty = 0;
        armor.spell_failure = 5;
        armor
            .description = "More than simple clothing, padded armor combines heavy, quilted cloth and layers of densely packed stuffing to create a cheap and basic protection. It is typically worn by those not intending to face lethal combat or those who wish their maneuverability to be impacted as little as possible.";
    }

    function leather() public pure returns (IArmor.Armor memory armor) {
        armor.id = 2;
        armor.name = "Leather";
        armor.cost = 10e18;
        armor.proficiency = 1;
        armor.weight = 15;
        armor.armor_bonus = 2;
        armor.max_dex_bonus = 6;
        armor.penalty = 0;
        armor.spell_failure = 10;
        armor
            .description = "Leather armor is made up of multiple overlapping pieces of leather, boiled to increase their natural toughness and then deliberately stitched together. Although not as sturdy as metal armor, the flexibility it allows wearers makes it among the most widely used types of armor.";
    }

    function studded_leather() public pure returns (IArmor.Armor memory armor) {
        armor.id = 3;
        armor.name = "Studded leather";
        armor.cost = 25e18;
        armor.proficiency = 1;
        armor.weight = 20;
        armor.armor_bonus = 3;
        armor.max_dex_bonus = 5;
        armor.penalty = -1;
        armor.spell_failure = 15;
        armor
            .description = "An improved form of leather armor, studded leather armor is covered with dozens of metal protuberances. While these rounded studs offer little defense individually, in the numbers they are arrayed in upon such armor, they help catch lethal edges and channel them away from vital spots. The rigidity caused by the additional metal does, however, result in less mobility than is afforded by a suit of normal leather armor.";
    }

    function chain_shirt() public pure returns (IArmor.Armor memory armor) {
        armor.id = 4;
        armor.name = "Chain shirt";
        armor.cost = 100e18;
        armor.proficiency = 1;
        armor.weight = 25;
        armor.armor_bonus = 4;
        armor.max_dex_bonus = 4;
        armor.penalty = -2;
        armor.spell_failure = 20;
        armor.description = "A chain shirt comes with a steel cap.";
    }

    function hide() public pure returns (IArmor.Armor memory armor) {
        armor.id = 5;
        armor.name = "Hide";
        armor.cost = 15e18;
        armor.proficiency = 2;
        armor.weight = 25;
        armor.armor_bonus = 3;
        armor.max_dex_bonus = 4;
        armor.penalty = -3;
        armor.spell_failure = 20;
        armor
            .description = "Hide armor is made from the tanned skin of particularly thick-hided beasts, stitched with either multiple overlapping layers of crude leather or exterior pieces of leather stuffed with padding or fur. Damage to the armor is typically repaired by restitching gashes or adding new pieces of hide, giving the most heavily used suits a distinctively patchwork quality.";
    }

    function scale_mail() public pure returns (IArmor.Armor memory armor) {
        armor.id = 6;
        armor.name = "Scale mail";
        armor.cost = 50e18;
        armor.proficiency = 2;
        armor.weight = 30;
        armor.armor_bonus = 4;
        armor.max_dex_bonus = 3;
        armor.penalty = -4;
        armor.spell_failure = 25;
        armor.description = "The suit includes gauntlets.";
    }

    function chainmail() public pure returns (IArmor.Armor memory armor) {
        armor.id = 7;
        armor.name = "Chainmail";
        armor.cost = 150e18;
        armor.proficiency = 2;
        armor.weight = 40;
        armor.armor_bonus = 5;
        armor.max_dex_bonus = 2;
        armor.penalty = -5;
        armor.spell_failure = 30;
        armor.description = "The suit includes gauntlets";
    }

    function breastplate() public pure returns (IArmor.Armor memory armor) {
        armor.id = 8;
        armor.name = "Breastplate";
        armor.cost = 200e18;
        armor.proficiency = 2;
        armor.weight = 30;
        armor.armor_bonus = 5;
        armor.max_dex_bonus = 3;
        armor.penalty = -4;
        armor.spell_failure = 25;
        armor.description = "It comes with a helmet and greaves.";
    }

    function splint_mail() public pure returns (IArmor.Armor memory armor) {
        armor.id = 9;
        armor.name = "Splint mail";
        armor.cost = 200e18;
        armor.proficiency = 3;
        armor.weight = 45;
        armor.armor_bonus = 6;
        armor.max_dex_bonus = 0;
        armor.penalty = -7;
        armor.spell_failure = 40;
        armor.description = "The suit includes gauntlets.";
    }

    function banded_mail() public pure returns (IArmor.Armor memory armor) {
        armor.id = 10;
        armor.name = "Banded mail";
        armor.cost = 250e18;
        armor.proficiency = 3;
        armor.weight = 35;
        armor.armor_bonus = 6;
        armor.max_dex_bonus = 1;
        armor.penalty = -6;
        armor.spell_failure = 35;
        armor.description = "The suit includes gauntlets.";
    }

    function half_plate() public pure returns (IArmor.Armor memory armor) {
        armor.id = 11;
        armor.name = "Half-plate";
        armor.cost = 600e18;
        armor.proficiency = 3;
        armor.weight = 50;
        armor.armor_bonus = 7;
        armor.max_dex_bonus = 0;
        armor.penalty = -7;
        armor.spell_failure = 40;
        armor.description = "The suit includes gauntlets.";
    }

    function full_plate() public pure returns (IArmor.Armor memory armor) {
        armor.id = 12;
        armor.name = "Full plate";
        armor.cost = 1500e18;
        armor.proficiency = 3;
        armor.weight = 50;
        armor.armor_bonus = 8;
        armor.max_dex_bonus = 1;
        armor.penalty = -6;
        armor.spell_failure = 35;
        armor
            .description = "The suit includes gauntlets, heavy leather boots, a visored helmet, and a thick layer of padding that is worn underneath the armor. Each suit of full plate must be individually fitted to its owner by a master armorsmith, although a captured suit can be resized to fit a new owner at a cost of 200 to 800 (2d4x100) gold pieces.";
    }

    function buckler() public pure returns (IArmor.Armor memory armor) {
        armor.id = 13;
        armor.name = "Buckler";
        armor.cost = 15e18;
        armor.proficiency = 4;
        armor.weight = 5;
        armor.armor_bonus = 1;
        armor.max_dex_bonus = 8;
        armor.penalty = -1;
        armor.spell_failure = 5;
        armor
            .description = "This small metal shield is worn strapped to your forearm. You can use a bow or crossbow without penalty while carrying it. You can also use your shield arm to wield a weapon (whether you are using an off-hand weapon or using your off hand to help wield a two-handed weapon), but you take a -1 penalty on attack rolls while doing so. This penalty stacks with those that may apply for fighting with your off hand and for fighting with two weapons. In any case, if you use a weapon in your off hand, you dont get the bucklers AC bonus for the rest of the round.";
    }

    function shield_light_wooden()
        public
        pure
        returns (IArmor.Armor memory armor)
    {
        armor.id = 14;
        armor.name = "Shield, light wooden";
        armor.cost = 3e18;
        armor.proficiency = 4;
        armor.weight = 5;
        armor.armor_bonus = 1;
        armor.max_dex_bonus = 8;
        armor.penalty = -1;
        armor.spell_failure = 5;
        armor
            .description = "Wooden and steel shields offer the same basic protection, though they respond differently to special attacks";
    }

    function shield_light_steel()
        public
        pure
        returns (IArmor.Armor memory armor)
    {
        armor.id = 15;
        armor.name = "Shield, light steel";
        armor.cost = 9e18;
        armor.proficiency = 4;
        armor.weight = 6;
        armor.armor_bonus = 1;
        armor.max_dex_bonus = 8;
        armor.penalty = -1;
        armor.spell_failure = 5;
        armor
            .description = "Wooden and steel shields offer the same basic protection, though they respond differently to special attacks";
    }

    function shield_heavy_wooden()
        public
        pure
        returns (IArmor.Armor memory armor)
    {
        armor.id = 16;
        armor.name = "Shield, heavy wooden";
        armor.cost = 7e18;
        armor.proficiency = 4;
        armor.weight = 10;
        armor.armor_bonus = 2;
        armor.max_dex_bonus = 8;
        armor.penalty = -2;
        armor.spell_failure = 15;
        armor
            .description = "Wooden and steel shields offer the same basic protection, though they respond differently to special attacks.";
    }

    function shield_heavy_steel()
        public
        pure
        returns (IArmor.Armor memory armor)
    {
        armor.id = 17;
        armor.name = "Shield, heavy steel";
        armor.cost = 20e18;
        armor.proficiency = 4;
        armor.weight = 15;
        armor.armor_bonus = 2;
        armor.max_dex_bonus = 8;
        armor.penalty = -2;
        armor.spell_failure = 15;
        armor
            .description = "Wooden and steel shields offer the same basic protection, though they respond differently to special attacks.";
    }

    function shield_tower() public pure returns (IArmor.Armor memory armor) {
        armor.id = 18;
        armor.name = "Shield, tower";
        armor.cost = 30e18;
        armor.proficiency = 4;
        armor.weight = 45;
        armor.armor_bonus = 4;
        armor.max_dex_bonus = 2;
        armor.penalty = -10;
        armor.spell_failure = 50;
        armor
            .description = "This massive wooden shield is nearly as tall as you are. In most situations, it provides the indicated shield bonus to your AC. However, you can instead use it as total cover, though you must give up your attacks to do so. The shield does not, however, provide cover against targeted spells; a spellcaster can cast a spell on you by targeting the shield you are holding. You cannot bash with a tower shield, nor can you use your shield hand for anything else.";
    }
}
