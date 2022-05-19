//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../interfaces/codex/IRarityCodexBaseRandom2.sol";

library Random {
    IRarityCodexBaseRandom2 constant RANDOM =
        IRarityCodexBaseRandom2(0x165AD01B090BC91352AeA8cEF7513C63852797Ed);

    function dn(
        uint256 seed_a,
        uint256 seed_b,
        uint8 dice_sides
    ) public view returns (uint8) {
        return RANDOM.dn(seed_a, seed_b, dice_sides);
    }

    function dn(
        uint256 seed_a,
        uint256 seed_b,
        uint8 dice_count,
        uint8 dice_sides
    ) public view returns (uint8) {
        uint8 result = 0;
        for (uint256 i; i < dice_count; i++) {
            result += RANDOM.dn(seed_a + i, seed_b, dice_sides);
        }
        return result;
    }
}
