// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../library/Codex.sol";

contract codex {
    string public constant index = "Items";
    string public constant class = "Masterwork Tools";
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
        if (_id == 2) {
            result = artisans_tools();
        } else if (_id == 7) {
            result = musical_instrument();
        } else if (_id == 9) {
            result = thieves_tools();
        } else if (_id == 10) {
            result = multitool();
        }
    }

    function artisans_tools() public pure returns (ITools.Tools memory result) {
        result.id = 2;
        result.weight = 5;
        result.cost = 55e18;
        result.name = "Masterwork Artisan's Tools";
        result
            .description = "These tools serve the same purpose as artisan's tools, but masterwork artisan's tools are the perfect tools for the job, so you get a +2 circumstance bonus on Craft checks made with them.";
        result.skill_bonus[5] = 2;
    }

    function musical_instrument()
        public
        pure
        returns (ITools.Tools memory result)
    {
        result.id = 7;
        result.weight = 3;
        result.cost = 100e18;
        result.name = "Masterwork Musical Instrument";
        result
            .description = "A masterwork instrument grants a +2 circumstance bonus on Perform checks involving its use.";
        result.skill_bonus[22] = 2;
    }

    function thieves_tools() public pure returns (ITools.Tools memory result) {
        result.id = 9;
        result.weight = 2;
        result.cost = 100e18;
        result.name = "Masterwork Thieve's Tools";
        result
            .description = "This kit contains extra tools and tools of better make, which grant a +2 circumstance bonus on Disable Device and Open Lock checks.";
        result.skill_bonus[8] = 2;
        result.skill_bonus[21] = 2;
    }

    function multitool() public pure returns (ITools.Tools memory result) {
        result.id = 10;
        result.weight = 1;
        result.cost = 50e18;
        result.name = "Masterwork Multitool";
        result
            .description = "This well-made item is the perfect tool for the job. It grants a +2 circumstance bonus on a related skill check (if any). Bonuses provided by multiple masterwork items used toward the same skill check do not stack.";
    }
}
