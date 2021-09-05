// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string constant public index = "Spells";
    string constant public class = "Wizard";
    string constant public school = "Conjuration";
    uint constant public level = 0;

    function acid_splash() external pure returns (
        uint id,
        string memory name,
        bool verbal,
        bool somatic,
        bool focus,
        uint xp_cost,
        uint time,
        uint range,
        uint duration,
        uint saving_throw_type,
        uint saving_throw_effect,
        bool spell_resistance,
        string memory description
    ) {
        id = 1;
        name = "Acid Splash";
        verbal = true;
        somatic = true;
        focus = false;
        xp_cost = 0;
        time = 1;
        range = 2;
        duration = 0;
        saving_throw_type = 0;
        saving_throw_effect = 0;
        spell_resistance = false;
        description = "You fire a small orb of acid at the target. You must succeed on a ranged touch attack to hit your target. The orb deals 1d3 points of acid damage.";
    }
}
