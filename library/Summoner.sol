//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./Attributes.sol";
import "./Codex.sol";
import "./Combat.sol";
import "./Crafting.sol";
import "./Equipment.sol";
import "./Proficiency.sol";
import "./Rarity.sol";

library Summoner {
    IRarityEquipment constant EQUIPMENT =
        IRarityEquipment(0xB6Ee6A99d474a30C9C407E7f32a88fF82071FDC0);

    function summoner_combatant(
        uint256 summoner,
        Equipment.Slot[3] memory loadout
    ) public view returns (Combat.Combatant memory combatant) {
        (uint8 initiative_roll, int8 initiative_score) = Roll.initiative(
            summoner
        );

        Equipment.Slot memory weapon_slot = loadout[0];
        Equipment.Slot memory armor_slot = loadout[1];
        Equipment.Slot memory shield_slot = loadout[2];

        combatant.mint = address(0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb);
        combatant.token = summoner;
        combatant.initiative_roll = initiative_roll;
        combatant.initiative_score = initiative_score;
        combatant.hit_points = int16(uint16(hit_points(summoner)));
        combatant.armor_class = armor_class(summoner, armor_slot, shield_slot);
        combatant.attacks = attacks(
            summoner,
            weapon_slot,
            armor_slot,
            shield_slot
        );
    }

    function armor_class(
        uint256 summoner,
        Equipment.Slot memory armor_slot,
        Equipment.Slot memory shield_slot
    ) public view returns (uint8) {
        int8 result = 10;
        int8 dex_modifier = Attributes.dexterity_modifier(summoner);

        uint256 max_dex_bonus = (2**128 - 1);

        if (armor_slot.mint != address(0)) {
            IArmor.Armor memory armor = get_armor(armor_slot);
            result += int8(uint8(armor.armor_bonus));
            if (armor.max_dex_bonus < max_dex_bonus)
                max_dex_bonus = armor.max_dex_bonus;
        }

        if (shield_slot.mint != address(0)) {
            IArmor.Armor memory shield = get_armor(shield_slot);
            result += int8(uint8(shield.armor_bonus));
            if (shield.max_dex_bonus < max_dex_bonus)
                max_dex_bonus = shield.max_dex_bonus;
        }

        if (
            armor_slot.mint == address(0) &&
            shield_slot.mint == address(0) &&
            Rarity.class(summoner) == 6
        ) {
            result +=
                int8(Attributes.wisdom_modifier(summoner)) +
                int8(int256(Rarity.level(summoner) / 5));
        }

        result =
            result +
            (
                (dex_modifier > int256(max_dex_bonus))
                    ? int8(uint8(max_dex_bonus))
                    : dex_modifier
            );

        return uint8(result);
    }

    // https://github.com/NomicFoundation/hardhat/issues/2592
    function _armor_class_test_wrapper(
        uint256 summoner,
        uint256 armor_token,
        address armor_mint,
        uint256 shield_token,
        address shield_mint
    ) public view returns (uint8) {
        return
            armor_class(
                summoner,
                Equipment.Slot(armor_mint, armor_token),
                Equipment.Slot(shield_mint, shield_token)
            );
    }

    function armor_check_penalty(
        uint256 summoner,
        Equipment.Slot memory armor_slot
    ) public view returns (int8) {
        if (armor_slot.mint == address(0)) return 0;
        (, uint256 item_type, , ) = ICrafting(armor_slot.mint).items(
            armor_slot.token
        );
        IArmor.Armor memory armor = get_armor(armor_slot);
        return
            Proficiency.is_proficient_with_armor(
                summoner,
                armor.proficiency,
                item_type
            )
                ? int8(0)
                : int8(armor.penalty);
    }

    // https://github.com/NomicFoundation/hardhat/issues/2592
    function _armor_check_penalty_wrapper(
        uint256 summoner,
        uint256 armor_token,
        address armor_mint
    ) public view returns (int8) {
        return
            armor_check_penalty(
                summoner,
                Equipment.Slot(armor_mint, armor_token)
            );
    }

    function get_armor(Equipment.Slot memory armor_slot)
        internal
        view
        returns (IArmor.Armor memory armor)
    {
        if (armor_slot.mint != address(0)) {
            (, uint8 item_type, , ) = ICrafting(armor_slot.mint).items(
                armor_slot.token
            );
            return
                ICodexArmor(EQUIPMENT.codexes(armor_slot.mint, 2)).item_by_id(
                    item_type
                );
        }
    }

    function hit_points(uint256 summoner) public view returns (uint8) {
        int8 con_modifier = Attributes.constitution_modifier(summoner);
        int256 hp = int256(health_by_class(Rarity.class(summoner))) +
            con_modifier;
        if (hp <= 0) hp = 1;
        return uint8(uint256(hp) * Rarity.level(summoner));
    }

    function health_by_class(uint256 class)
        internal
        pure
        returns (uint256 health)
    {
        if (class == 1) {
            health = 12;
        } else if (class == 2) {
            health = 6;
        } else if (class == 3) {
            health = 8;
        } else if (class == 4) {
            health = 8;
        } else if (class == 5) {
            health = 10;
        } else if (class == 6) {
            health = 8;
        } else if (class == 7) {
            health = 10;
        } else if (class == 8) {
            health = 8;
        } else if (class == 9) {
            health = 6;
        } else if (class == 10) {
            health = 4;
        } else if (class == 11) {
            health = 4;
        }
    }

    function attacks(
        uint256 summoner,
        Equipment.Slot memory weapon_slot,
        Equipment.Slot memory armor_slot,
        Equipment.Slot memory shield_slot
    ) public view returns (int8[28] memory result) {
        (IWeapon.Weapon memory weapon, int8 weapon_attack_bonus) = get_weapon(
            weapon_slot
        );

        if (weapon.id == 0 && Rarity.class(summoner) == 6) {
            uint256 level = Rarity.level(summoner);
            weapon.damage = level < 4 ? 6 : level < 8 ? 8 : level < 12
                ? 10
                : level < 16
                ? 12
                : level < 20
                ? 16
                : 20;
        }

        int8 attack_modifier = weapon_attack_modifier(
            summoner,
            weapon.encumbrance
        ) +
            armor_check_penalty(summoner, armor_slot) +
            armor_check_penalty(summoner, shield_slot) +
            weapon_attack_bonus;

        if (
            weapon.id != 0 &&
            !Proficiency.is_proficient_with_weapon(
                summoner,
                weapon.proficiency,
                weapon.id
            )
        ) {
            attack_modifier -= 4;
        }

        int8 damage_modifier = weapon_damage_modifier(
            summoner,
            weapon.encumbrance
        );

        int8[4] memory attack_bonus = base_attack_bonus(summoner);
        for (uint256 i = 0; i < 4; i++) {
            if (i == 0 || attack_bonus[i] > 0) {
                Combat.pack_attack(
                    attack_bonus[i] + attack_modifier,
                    int8(weapon.critical_modifier),
                    uint8(weapon.critical),
                    1,
                    uint8(weapon.damage),
                    damage_modifier,
                    uint8(weapon.damage_type),
                    i,
                    result
                );
            } else {
                break;
            }
        }
    }

    // https://github.com/NomicFoundation/hardhat/issues/2592
    function _attacks_test_wrapper(
        uint256 summoner,
        uint256 weapon,
        address weapon_mint,
        uint256 armor,
        address armor_mint,
        uint256 shield,
        address shield_mint
    ) public view returns (int8[28] memory result) {
        return
            attacks(
                summoner,
                Equipment.Slot(weapon_mint, weapon),
                Equipment.Slot(armor_mint, armor),
                Equipment.Slot(shield_mint, shield)
            );
    }

    function get_weapon(Equipment.Slot memory weapon_slot)
        internal
        view
        returns (IWeapon.Weapon memory, int8 attack_bonus)
    {
        if (weapon_slot.mint == address(0)) {
            return (unarmed_strike_codex(), 0);
        } else {
            ICodexWeapon codex = ICodexWeapon(
                EQUIPMENT.codexes(weapon_slot.mint, 3)
            );
            (, uint8 item_type, , ) = ICrafting(weapon_slot.mint).items(
                weapon_slot.token
            );
            return (
                codex.item_by_id(item_type),
                codex.get_attack_bonus(item_type)
            );
        }
    }

    function unarmed_strike_codex()
        internal
        pure
        returns (IWeapon.Weapon memory)
    {
        return IWeapon.Weapon(0, 1, 0, 1, 0, 3, 2, 0, 0, 0, "", "");
    }

    function weapon_attack_modifier(
        uint256 summoner,
        uint256 weapon_encumbrance
    ) public view returns (int8) {
        return
            weapon_encumbrance < 5
                ? Attributes.strength_modifier(summoner)
                : weapon_encumbrance == 5
                ? Attributes.dexterity_modifier(summoner)
                : int8(0);
    }

    function weapon_damage_modifier(
        uint256 summoner,
        uint256 weapon_encumbrance
    ) public view returns (int8) {
        return
            weapon_encumbrance < 4
                ? Attributes.strength_modifier(summoner)
                : weapon_encumbrance == 4
                ? (3 * Attributes.strength_modifier(summoner)) / 2
                : weapon_encumbrance == 5
                ? Attributes.dexterity_modifier(summoner)
                : int8(0);
    }

    function base_attack_bonus(uint256 summoner)
        public
        view
        returns (int8[4] memory result)
    {
        result = [int8(0), 0, 0, 0];
        result[0] = int8(
            (uint8(Rarity.level(summoner)) *
                base_attack_bonus_for_class(Rarity.class(summoner))) / 4
        );
        for (uint256 i = 1; i < 4; i++) {
            if (result[i - 1] > 5) result[i] = result[i - 1] - 5;
            else break;
        }
    }

    function base_attack_bonus_for_class(uint256 _class)
        public
        pure
        returns (uint8)
    {
        if (_class == 1) {
            return 4;
        } else if (_class == 2) {
            return 3;
        } else if (_class == 3) {
            return 3;
        } else if (_class == 4) {
            return 3;
        } else if (_class == 5) {
            return 4;
        } else if (_class == 6) {
            return 3;
        } else if (_class == 7) {
            return 4;
        } else if (_class == 8) {
            return 4;
        } else if (_class == 9) {
            return 3;
        } else if (_class == 10) {
            return 2;
        } else if (_class == 11) {
            return 2;
        } else {
            return 0;
        }
    }

    function is_proficient_with_weapon(
        uint256 summoner,
        uint8 weapon_type,
        address mint
    ) public view returns (bool) {
        return
            Proficiency.is_proficient_with_weapon(
                summoner,
                ICodexWeapon(EQUIPMENT.codexes(mint, 3))
                    .item_by_id(weapon_type)
                    .proficiency,
                weapon_type
            );
    }

    function is_proficient_with_armor(
        uint256 summoner,
        uint8 armor_type,
        address mint
    ) public view returns (bool) {
        return
            Proficiency.is_proficient_with_armor(
                summoner,
                ICodexArmor(EQUIPMENT.codexes(mint, 2))
                    .item_by_id(armor_type)
                    .proficiency,
                armor_type
            );
    }

    function preview(
        uint256 summoner,
        address weapon_mint,
        uint256 weapon_token,
        address armor_mint,
        uint256 armor_token,
        address shield_mint,
        uint256 shield_token
    ) public view returns (Combat.Combatant memory result) {
        Equipment.Slot memory weapon_slot = Equipment.Slot(
            weapon_mint,
            weapon_token
        );
        Equipment.Slot memory armor_slot = Equipment.Slot(
            armor_mint,
            armor_token
        );
        Equipment.Slot memory shield_slot = Equipment.Slot(
            shield_mint,
            shield_token
        );

        result.token = summoner;
        result.mint = address(Rarity.RARITY);
        result.hit_points = int16(uint16(hit_points(summoner)));
        result.armor_class = armor_class(summoner, armor_slot, shield_slot);
        result.attacks = attacks(
            summoner,
            weapon_slot,
            armor_slot,
            shield_slot
        );
    }
}
