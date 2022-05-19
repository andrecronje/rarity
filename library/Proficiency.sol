//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./Rarity.sol";
import "./Feats.sol";

library Proficiency {
    function is_proficient_with_armor(
        uint256 summoner,
        uint256 proficiency,
        uint256 armor_type
    ) public view returns (bool) {
        uint256 class = Rarity.class(summoner);

        // Barbarian
        if (class == 1) {
            if (proficiency == 1 || proficiency == 2) {
                return true;
            } else if (
                proficiency == 3 && Feats.armor_proficiency_heavy(summoner)
            ) {
                return true;
            } else if (proficiency == 4) {
                if (armor_type == 18) {
                    return Feats.tower_shield_proficiency(summoner);
                } else {
                    return true;
                }
            }

            // Bard, Ranger
        } else if (class == 2 || class == 8) {
            if (proficiency == 1 || proficiency == 2) {
                return true;
            } else if (
                (Feats.armor_proficiency_medium(summoner)) ||
                (proficiency == 3 && Feats.armor_proficiency_heavy(summoner))
            ) {
                return true;
            } else if (proficiency == 4) {
                if (armor_type == 18) {
                    return Feats.tower_shield_proficiency(summoner);
                } else {
                    return true;
                }
            }

            // Cleric, Paladin
        } else if (class == 3 || class == 7) {
            if (proficiency == 4 && armor_type == 18) {
                return Feats.tower_shield_proficiency(summoner);
            }
            return true;

            // Druid
        } else if (class == 4) {
            if (proficiency == 1 || proficiency == 2) {
                return true;
            } else if (
                proficiency == 3 && Feats.armor_proficiency_heavy(summoner)
            ) {
                return true;
            } else if (proficiency == 4) {
                if (armor_type == 18) {
                    return Feats.tower_shield_proficiency(summoner);
                } else {
                    return true;
                }
            }

            // Fighter
        } else if (class == 5) {
            return true;

            // Rogue
        } else if (class == 9) {
            return
                (proficiency == 1) ||
                (proficiency == 2 &&
                    Feats.armor_proficiency_medium(summoner)) ||
                (proficiency == 3 && Feats.armor_proficiency_heavy(summoner)) ||
                (proficiency == 4 &&
                    armor_type == 18 &&
                    Feats.tower_shield_proficiency(summoner)) ||
                (proficiency == 4 && Feats.shield_proficiency(summoner));

            // Monk, Sorcerer, Wizard
        } else if (class == 6 || class == 10 || class == 11) {
            return
                (proficiency == 1 && Feats.armor_proficiency_light(summoner)) ||
                (proficiency == 2 &&
                    Feats.armor_proficiency_medium(summoner)) ||
                (proficiency == 3 && Feats.armor_proficiency_heavy(summoner)) ||
                (proficiency == 4 &&
                    armor_type == 18 &&
                    Feats.tower_shield_proficiency(summoner)) ||
                (proficiency == 4 && Feats.shield_proficiency(summoner));
        }

        return false;
    }

    function is_proficient_with_weapon(
        uint256 summoner,
        uint256 proficiency,
        uint256 weapon_type
    ) public view returns (bool) {
        uint256 class = Rarity.class(summoner);

        // Barbarian, Fighter, Paladin, Ranger
        if (class == 1 || class == 5 || class == 7 || class == 8) {
            if (proficiency == 1 || proficiency == 2) {
                return true;
            } else if (Feats.exotic_weapon_proficiency(summoner)) {
                return true;
            }

            // Bard
        } else if (class == 2) {
            if (proficiency == 1) {
                return true;
            } else if (
                (proficiency == 2 &&
                    Feats.martial_weapon_proficiency(summoner)) ||
                (proficiency == 3 && Feats.exotic_weapon_proficiency(summoner))
            ) {
                return true;
            } else if (
                weapon_type == 27 || // longsword
                weapon_type == 29 || // rapier
                weapon_type == 23 || // sap
                weapon_type == 24 || // short sword
                weapon_type == 46 // short bow
            ) {
                return true;
            }

            // Cleric, Sorcerer
        } else if (class == 3 || class == 10) {
            if (proficiency == 1) {
                return true;
            } else if (
                (proficiency == 2 &&
                    Feats.martial_weapon_proficiency(summoner)) ||
                (proficiency == 3 && Feats.exotic_weapon_proficiency(summoner))
            ) {
                return true;
            }

            // Druid, Monk, Wizard
        } else if (class == 4 || class == 6 || class == 11) {
            if (
                (proficiency == 1 &&
                    Feats.simple_weapon_proficiency(summoner)) ||
                (proficiency == 2 &&
                    Feats.martial_weapon_proficiency(summoner)) ||
                (proficiency == 3 && Feats.exotic_weapon_proficiency(summoner))
            ) {
                return true;

                // Druid
            } else if (
                class == 4 &&
                (weapon_type == 6 || // club
                    weapon_type == 2 || // dagger
                    weapon_type == 15 || // dart
                    weapon_type == 11 || // quarterstaff
                    weapon_type == 30 || // scimitar
                    weapon_type == 5 || // sickle
                    weapon_type == 9 || // shortspear
                    weapon_type == 17 || // sling
                    weapon_type == 12) // spear
            ) {
                return true;

                // Monk
            } else if (
                class == 6 &&
                (weapon_type == 6 || // club
                    weapon_type == 14 || // light crossbow
                    weapon_type == 13 || // heavy crossbow
                    weapon_type == 2 || // dagger
                    weapon_type == 20 || // hand axe
                    weapon_type == 16 || // javelin
                    weapon_type == 48 || // kama
                    weapon_type == 49 || // nunchaku
                    weapon_type == 11 || // quarterstaff
                    weapon_type == 50 || // sia
                    weapon_type == 51 || // siangham
                    weapon_type == 17) // sling
            ) {
                return true;

                // Rogue
            } else if (
                class == 9 &&
                (weapon_type <= 17 || // Simple weapons
                    weapon_type == 57 || // hand crossbow
                    weapon_type == 29 || // rapier
                    weapon_type == 23 || // sap
                    weapon_type == 46 || // shortbow
                    weapon_type == 24) // short sword
            ) {
                return true;

                // Wizard
            } else if (
                class == 11 &&
                (weapon_type == 6 || // club
                    weapon_type == 2 || // dagger
                    weapon_type == 13 || // heavy crossbow
                    weapon_type == 14 || // light crossbow
                    weapon_type == 11) // quarterstaff
            ) {
                return true;
            }
        }

        return false;
    }
}
