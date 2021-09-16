// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 3.5e has 40 conditions. Using 14 (5e) for simplicity. Conditions remain for duration of spell and may persist post adventure
contract codex {
    string constant public index = "Condition";
    string constant public class = "Any";

    function advantage_by_id(uint _id) external pure returns(
	    string memory advantage
    ) {
        if (_id == 0) {
            return "Normal";
        } else if (_id == 1) {
            return "Advantage";
        } else if (_id == 2) {
            return "Disadvantage";
        } else if (_id == 3) {
            return "Disabled";	// to prevent actions occurring. Not d&d20 canon
        }
    }

    function get_condition(uint _id) external pure returns(
        uint id,
        string memory name,
        uint attribute_id,
	      uint advantage_ability_check,
	      uint advantage_attack_for,
	      uint advantage_attack_against,
        string memory description
    ) {
        if (_id == 0) {            
            return normal();
        } if (_id == 1) {
            return blinded();
        } if (_id == 2) {
            return charmed();
        } if (_id == 3) {
            return deafened();
        } if (_id == 4) {
            return frightened();
        } if (_id == 5) {
            return grappled();
        } if (_id == 6) {
            return incapacitated();
        } if (_id == 7) {
            return invisible();
        } if (_id == 8) {
            return paralyzed();
        } if (_id == 9) {
            return petrified();
        } if (_id == 10) {
            return poisoned();
        } if (_id == 11) {
            return prone();
        } if (_id == 12) {
            return restrained();
        } if (_id == 13) {
            return stunned();
        } if (_id == 14) {
            return unconscious();
        }
    }

    function get_attribute(uint id) external pure returns (string memory attribute) {
        if (id == 0) {
            return "None";
        } if (id == 1) {
            return "Strength";
        } else if (id == 2) {
            return "Dexterity";
        } else if (id == 3) {
            return "Constitution";
        } else if (id == 4) {
            return "Intelligence";
        } else if (id == 5) {
            return "Wisdom";
        } else if (id == 6) {
            return "Charisma";
        } else if (id == 7) {
            return "All";
        }
    }

    function normal() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
        uint advantage_ability_check,
        uint advantage_attack_for,
        uint advantage_attack_against,
        string memory description
    ) {
        id = 0;
        name = "Normal";
        attribute_id = 0;
        advantage_ability_check = 0;
        advantage_attack_for = 0;
        advantage_attack_against = 0;
        description = "Healthy - in good condition and enjoying life, for now.";
    }

    function blinded() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 1;
        name = "Blinded";
        attribute_id = 7;
        advantage_ability_check = 3;
        advantage_attack_for = 2;
        advantage_attack_against = 1;
        description = "For a blinded creature, attacks against it has advantage and its attacks have disadvantage. Ability checks that require sight automatically fail.";
    }

    function charmed() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
        uint advantage_ability_check,
        uint advantage_attack_for,
        uint advantage_attack_against,
        string memory description
    ) {
        id = 2;
        name = "Charmed";
        attribute_id = 0;
	advantage_ability_check = 0;
	advantage_attack_for = 3;
	advantage_attack_against = 1;
        description = "Charmed creatures cannot attack their charmer and attacks against it have advantage";
    }

    function deafened() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 3;
        name = "Deafened"; // for roleplaying
        attribute_id = 0;
	advantage_ability_check = 0;
	advantage_attack_for = 0;
	advantage_attack_against = 0;
        description = "A deafened creature can't hear and automatically fails any ability check that requires hearing.";
    }

    function frightened() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 4;
        name = "Frightened"; // for roleplaying
        attribute_id = 7;
	advantage_ability_check = 2;
	advantage_attack_for = 0;
	advantage_attack_against = 2;
        description = "A frightened creature has disadvantage on ability checks and attack rolls while the source of its fear is within line of sight.";
    }

    function grappled() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 5;
        name = "Grappled"; // for roleplaying
        attribute_id = 0;
	advantage_ability_check = 0;
	advantage_attack_for = 0;
	advantage_attack_against = 0;
        description = "A grappled creature's speed becomes 0, and it can't benefit from any bonus to its speed. The condition ends if the grappler is incapacitated";
    }

    function incapacitated() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 6;
        name = "Incapacitated";
        attribute_id = 7;
	advantage_ability_check = 3;
	advantage_attack_for = 3;
	advantage_attack_against = 2;
        description = "An incapacitated creature can't take actions or reactions.";
    }

    function invisible() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 7;
        name = "Invisible";
        attribute_id = 0;
	advantage_ability_check = 0;
	advantage_attack_for = 1;
	advantage_attack_against = 2;
        description = "An invisible creature is impossible to see without the aid of magic or a special sense. he creature's location can be detected by any noise it makes or any tracks it leaves. Attack rolls against the creature have disadvantage, and the creature's attack rolls have advantage.";
    }

    function paralyzed() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 8;
        name = "Paralyzed";
        attribute_id = 0;
	advantage_ability_check = 0;
	advantage_attack_for = 1;
	advantage_attack_against = 2;
        description = "A paralyzed creature is incapacitated (see the condition) and can't move or speak. The creature automatically fails Strength and Dexterity Saving Throws. Attack rolls against the creature have advantage. Any Attack that hits the creature is a critical hit if the attacker is within 5 feet of the creature.";
    }

    function petrified() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 9; // n.b. additional benefits not captured include resistences
        name = "Petrified";
        attribute_id = 7;
	advantage_ability_check = 3;
	advantage_attack_for = 3;
	advantage_attack_against = 1;
        description = "A petrified creature is transformed, along with any nonmagical object it is wearing or carrying, into stone. Its weight increases by a factor of ten, and it ceases aging.The creature is incapacitated, can't move or speak, and is unaware of its surroundings.";
    }

    function poisoned() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 10;
        name = "Poisoned";
        attribute_id = 7;
	advantage_ability_check = 2;
	advantage_attack_for = 2;
	advantage_attack_against = 2;
        description = "A poisoned creature has disadvantage on attack rolls and ability checks.";
    }

    function prone() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 11;
        name = "Prone";
        attribute_id = 0;
	advantage_ability_check = 0;
	advantage_attack_for = 2;
	advantage_attack_against = 2;
        description = "A prone creature's only movement option is to crawl, unless it stands up and thereby ends the condition.";
    }

    function restrained() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 12;
        name = "Restrained";
        attribute_id = 2;
	advantage_ability_check = 2; // also Str but only capture one effect
	advantage_attack_for = 2;
	advantage_attack_against = 1;
        description = "A restrained creature's speed becomes 0, and it can't benefit from any bonus to its speed. Attack rolls against the creature have advantage, and the creature's attack rolls have disadvantage. The creature has disadvantage on Dexterity saving throws.";
    }

    function stunned() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 13; 
        name = "Stunned";
        attribute_id = 1; // also Dex but only capture one effect
	advantage_ability_check = 3;
	advantage_attack_for = 0;
	advantage_attack_against = 1;
        description = "A stunned creature is incapacitated, can't move, and can speak only falteringly. The creature automatically fails Strength saving throws. Attack rolls against the creature have advantage.";
    }

    function unconscious() public pure returns (
        uint id,
        string memory name,
        uint attribute_id,
	uint advantage_ability_check,
	uint advantage_attack_for,
	uint advantage_attack_against,
    string memory description
    ) {
        id = 14; 
        name = "Unconcious";
        attribute_id = 7; 
	advantage_ability_check = 3;
	advantage_attack_for = 3;
	advantage_attack_against = 2;
        description = "An unconscious creature is incapacitated, can't move or speak, and is unaware of its surroundings. It falls Prone. Attack rolls against the creature have advantage. Any attack that hits the creature is a critical hit if the attacker is within 5 feet of the creature.";
    }
}
