// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant index = "Base";
    string constant class = "Generic";
    uint constant level = 0;
    
    function classes(uint id) external pure returns (string memory description) {
        if (id == 0) {
            return "None";
        } else if (id == 1) {
            return "Barbarian";
        } else if (id == 2) {
            return "Bard";
        } else if (id == 3) {
            return "Cleric";
        } else if (id == 4) {
            return "Druid";
        } else if (id == 5) {
            return "Fighter";
        } else if (id == 6) {
            return "Monk";
        } else if (id == 7) {
            return "Paladin";
        } else if (id == 8) {
            return "Ranger";
        } else if (id == 9) {
            return "Rogue";
        } else if (id == 10) {
            return "Sorcerer";
        } else if (id == 11) {
            return "Wizard";
        } else if (id == 12) {
            return "Arcane Archer";
        } else if (id == 13) {
            return "Arcane Trickster";
        } else if (id == 14) {
            return "Archmage";
        } else if (id == 15) {
            return "Assassin";
        } else if (id == 16) {
            return "Blackguard";
        } else if (id == 17) {
            return "Dragon Disciple";
        } else if (id == 18) {
            return "Duelist";
        } else if (id == 19) {
            return "Dwarven Defender";
        } else if (id == 20) {
            return "Eldritch Knight";
        } else if (id == 21) {
            return "Hierophant";
        } else if (id == 22) {
            return "Horizon Walker";
        } else if (id == 23) {
            return "Loremaster";
        } else if (id == 24) {
            return "Mystic Theurge";
        } else if (id == 25) {
            return "Shadowdancer";
        } else if (id == 26) {
            return "Thaumaturgist";
        } else if (id == 27) {
            return "Adept";
        } else if (id == 28) {
            return "Aristocrat";
        } else if (id == 29) {
            return "Commoner";
        } else if (id == 30) {
            return "Expert";
        } else if (id == 31) {
            return "Warrior";
        }
    }
    
    function school(uint id) external pure returns (string memory description) {
        if (id == 0) {
            return "Abjuration";
        } else if (id == 1) {
            return "Conjuration";
        } else if (id == 2) {
            return "Divination";
        } else if (id == 3) {
            return "Enchantment";
        } else if (id == 4) {
            return "Evocation";
        } else if (id == 5) {
            return "Illusion";
        } else if (id == 6) {
            return "Necromancy";
        } else if (id == 7) {
            return "Transmutation";
        } else if (id == 8) {
            return "Universal";
        }
    }
    
    function casting_time(uint id) external pure returns (string memory description) {
        if (id == 0) {
            return "1 free action";
        } else if (id == 1) {
            return "1 standard action";
        } else if (id == 2) {
            return "full-round action";
        } else if (id == 3) {
            return "10 full-round actions";
        }
    }
    
    function range(uint id) external pure returns (string memory description) {
        if (id == 0) {
            return "Personal";
        } else if (id == 1) {
            return "Touch";
        } else if (id == 2) {
            return "Close";
        } else if (id == 3) {
            return "Medium";
        } else if (id == 4) {
            return "Long";
        } else if (id == 5) {
            return "Unlimited";
        }
    }
    function saving_throw_type(uint id) external pure returns (string memory description) {
        if (id == 0) {
            return "None";
        } else if (id == 1) {
            return "Fortitude";
        } else if (id == 2) {
            return "Reflex";
        } else if (id == 3) {
            return "Will";
        }
    }
    
    function saving_throw_effect(uint id) external pure returns (string memory description) {
        if (id == 0) {
            return "None";
        } else if (id == 1) {
            return "Partial";
        } else if (id == 2) {
            return "Half";
        } else if (id == 3) {
            return "Negates";
        }
    }
}
