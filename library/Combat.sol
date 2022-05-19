//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./Roll.sol";

library Combat {
    uint256 internal constant ATTACK_STRIDE = 7;

    struct Combatant {
        uint8 initiative_roll;
        int8 initiative_score;
        uint8 armor_class;
        int16 hit_points;
        address mint;
        uint256 token;
        int8[28] attacks; // layout: [attack_bonus, critical_modifier, critical_multiplier, damage_dice_count, damage_dice_sides, damage_modifier, damage_type.. x4]
    }

    struct Attack {
        int8 attack_bonus;
        int8 critical_modifier;
        uint8 critical_multiplier;
        uint8 damage_dice_count;
        uint8 damage_dice_sides;
        int8 damage_modifier;
        uint8 damage_type;
    }

    function pack_attack(
        int8 attack_bonus,
        int8 critical_modifier,
        uint8 critical_multiplier,
        uint8 damage_dice_count,
        uint8 damage_dice_sides,
        int8 damage_modifier,
        uint8 damage_type,
        uint256 attack_number,
        int8[28] memory attacks
    ) internal pure {
        uint256 offset = attack_number * ATTACK_STRIDE;
        attacks[offset + 0] = attack_bonus;
        attacks[offset + 1] = critical_modifier;
        attacks[offset + 2] = int8(critical_multiplier);
        attacks[offset + 3] = int8(damage_dice_count);
        attacks[offset + 4] = int8(damage_dice_sides);
        attacks[offset + 5] = damage_modifier;
        attacks[offset + 6] = int8(damage_type);
    }

    function unpack_attack(int8[28] memory attacks, uint256 attack_number)
        internal
        pure
        returns (Attack memory attack)
    {
        uint256 offset = attack_number * ATTACK_STRIDE;
        attack.attack_bonus = attacks[offset + 0];
        attack.critical_modifier = attacks[offset + 1];
        attack.critical_multiplier = uint8(attacks[offset + 2]);
        attack.damage_dice_count = uint8(attacks[offset + 3]);
        attack.damage_dice_sides = uint8(attacks[offset + 4]);
        attack.damage_modifier = attacks[offset + 5];
        attack.damage_type = uint8(attacks[offset + 6]);
    }

    function has_attack(int8[28] memory attacks, uint256 attack_number)
        internal
        pure
        returns (bool)
    {
        return attacks[ATTACK_STRIDE * (attack_number + 1) - 1] > 0;
    }

    function order_by_initiative(Combatant[] memory combatants) internal pure {
        uint256 length = combatants.length;
        for (uint256 i = 0; i < length; i++) {
            for (uint256 j = i + 1; j < length; j++) {
                Combatant memory i_combatant = combatants[i];
                Combatant memory j_combatant = combatants[j];
                if (
                    i_combatant.initiative_score < j_combatant.initiative_score
                ) {
                    combatants[i] = j_combatant;
                    combatants[j] = i_combatant;
                } else if (
                    i_combatant.initiative_score == j_combatant.initiative_score
                ) {
                    if (
                        i_combatant.initiative_roll >
                        j_combatant.initiative_roll
                    ) {
                        combatants[i] = j_combatant;
                        combatants[j] = i_combatant;
                    }
                }
            }
        }
    }

    function attack_combatant(
        Combatant memory attacker,
        Combatant storage defender,
        uint256 attack_number
    )
        internal
        returns (
            bool hit,
            uint8 roll,
            int8 score,
            uint8 critical_confirmation,
            uint8 damage,
            uint8 damage_type
        )
    {
        Attack memory attack = unpack_attack(attacker.attacks, attack_number);

        AttackRoll memory attack_roll = Roll.attack(
            attacker.token + attack_number,
            attack.attack_bonus,
            attack.critical_modifier,
            attack.critical_multiplier,
            defender.armor_class
        );

        if (attack_roll.damage_multiplier == 0) {
            return (
                false,
                attack_roll.roll,
                attack_roll.score,
                attack_roll.critical_confirmation,
                0,
                0
            );
        } else {
            damage = Roll.damage(
                attacker.token + attack_number,
                attack.damage_dice_count,
                attack.damage_dice_sides,
                attack.damage_modifier,
                attack_roll.damage_multiplier
            );
            defender.hit_points -= int16(uint16(damage));
            return (
                true,
                attack_roll.roll,
                attack_roll.score,
                attack_roll.critical_confirmation,
                damage,
                attack.damage_type
            );
        }
    }
}
