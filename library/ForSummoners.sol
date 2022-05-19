//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./Rarity.sol";

contract ForSummoners {
    modifier approvedForSummoner(uint256 summoner) {
        if (Rarity.isApprovedOrOwnerOfSummoner(summoner)) {
            _;
        } else {
            revert("!approvedForSummoner");
        }
    }
}
