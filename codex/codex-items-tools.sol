// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../library/Codex.sol";

contract codex {
    string public constant index = "Items";
    string public constant class = "Tools & Kits";
    uint8 public constant base_type = 4;

    function get_skill_bonus(uint256 id, uint256 skill_id)
        external
        pure
        returns (int8)
    {
        return item_by_id(id).skill_bonus[skill_id - 1];
    }

    function item_by_id(uint256 _id)
        public
        pure
        returns (ITools.Tools memory result)
    {
        if (_id == 1) {
            result = alchemists_lab();
        } else if (_id == 2) {
            result = artisans_tools();
        } else if (_id == 3) {
            result = climbers_kit();
        } else if (_id == 4) {
            result = disguise_kit();
        } else if (_id == 5) {
            result = healers_kit();
        } else if (_id == 6) {
            result = magnifying_glass();
        } else if (_id == 7) {
            result = musical_instrument();
        } else if (_id == 8) {
            result = merchants_scale();
        } else if (_id == 9) {
            result = thieves_tools();
        } else if (_id == 11) {
            result = water_clock();
        }
    }

    function alchemists_lab() public pure returns (ITools.Tools memory result) {
        result.id = 1;
        result.weight = 40;
        result.cost = 500e18;
        result.name = "Alchemist's lab";
        result
            .description = "An alchemist's lab always has the perfect tool for making alchemical items, so it provides a +2 circumstance bonus on Craft (alchemy) checks. It has no bearing on the costs related to the Craft (alchemy) skill. Without this lab, a character with the Craft (alchemy) skill is assumed to have enough tools to use the skill but not enough to get the +2 bonus that the lab provides.";
        result.skill_bonus[5] = 2;
    }

    function artisans_tools() public pure returns (ITools.Tools memory result) {
        result.id = 2;
        result.weight = 5;
        result.cost = 5e18;
        result.name = "Artisan's Tools";
        result
            .description = "These special tools include the items needed to pursue any craft. Without them, you have to use improvised tools (-2 penalty on Craft checks), if you can do the job at all.";
        result.skill_bonus[5] = 0;
    }

    function climbers_kit() public pure returns (ITools.Tools memory result) {
        result.id = 3;
        result.weight = 5;
        result.cost = 80e18;
        result.name = "Climber's Kit";
        result
            .description = "This is the perfect tool for climbing and gives you a +2 circumstance bonus on Climb checks.";
        result.skill_bonus[3] = 2;
    }

    function disguise_kit() public pure returns (ITools.Tools memory result) {
        result.id = 4;
        result.weight = 8;
        result.cost = 50e18;
        result.name = "Disguise Kit";
        result
            .description = "The kit is the perfect tool for disguise and provides a +2 circumstance bonus on Disguise checks. A disguise kit is exhausted after ten uses.";
        result.skill_bonus[9] = 2;
    }

    function healers_kit() public pure returns (ITools.Tools memory result) {
        result.id = 5;
        result.weight = 1;
        result.cost = 50e18;
        result.name = "Healer's Kit";
        result
            .description = "It is the perfect tool for healing and provides a +2 circumstance bonus on Heal checks. A healer's kit is exhausted after ten uses.";
        result.skill_bonus[14] = 2;
    }

    function magnifying_glass()
        public
        pure
        returns (ITools.Tools memory result)
    {
        result.id = 6;
        result.weight = 0;
        result.cost = 100e18;
        result.name = "Magnifying Glass";
        result
            .description = "This simple lens allows a closer look at small objects. It is also useful as a substitute for flint and steel when starting fires. Lighting a fire with a magnifying glass requires light as bright as sunlight to focus, tinder to ignite, and at least a full-round action. A magnifying glass grants a +2 circumstance bonus on Appraise checks involving any item that is small or highly detailed.";
        result.skill_bonus[0] = 2;
    }

    function musical_instrument()
        public
        pure
        returns (ITools.Tools memory result)
    {
        result.id = 7;
        result.weight = 3;
        result.cost = 5e18;
        result.name = "Musical Instrument";
        result
            .description = "A common instrument grants a +0 circumstance bonus on Perform checks involving its use.";
        result
            .description = "Common instruments can be used for any kind of performance. Without them, you have to use improvised instruments (-2 penalty on Perform checks).";
        result.skill_bonus[22] = 0;
    }

    function merchants_scale()
        public
        pure
        returns (ITools.Tools memory result)
    {
        result.id = 8;
        result.weight = 1;
        result.cost = 2e18;
        result.name = "Merchant's Scale";
        result
            .description = "A scale grants a +2 circumstance bonus on Appraise checks involving items that are valued by weight, including anything made of precious metals.";
        result.skill_bonus[0] = 2;
    }

    function thieves_tools() public pure returns (ITools.Tools memory result) {
        result.id = 9;
        result.weight = 2;
        result.cost = 30e18;
        result.name = "Thieve's Tools";
        result
            .description = "his kit contains the tools you need to use the Disable Device and Open Lock skills. Without these tools, you must improvise tools, and you take a -2 circumstance penalty on Disable Device and Open Lock checks.";
        result.skill_bonus[9] = 0;
        result.skill_bonus[22] = 0;
    }

    function water_clock() public pure returns (ITools.Tools memory result) {
        result.id = 11;
        result.weight = 200;
        result.cost = 1000e18;
        result.name = "Water Clock";
        result
            .description = "This large, bulky contrivance gives the time accurate to within half an hour per day since it was last set. It requires a source of water, and it must be kept still because it marks time by the regulated flow of droplets of water.";
    }
}
