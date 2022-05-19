//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./Crafting.sol";

contract ForItems {
    modifier approvedForItem(uint256 token, address mint) {
        if (
            (mint == address(0)) ||
            Crafting.isApprovedOrOwnerOfItem(token, mint)
        ) {
            _;
        } else {
            revert("!approvedForItem");
        }
    }
}
