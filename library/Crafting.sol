//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface ICrafting {
    function items(uint256 token)
        external
        view
        returns (
            uint8 base_type,
            uint8 item_type,
            uint32 crafted,
            uint256 crafter
        );
}

library Crafting {
    function isApprovedOrOwnerOfItem(uint256 token, address mint)
        public
        view
        returns (bool)
    {
        if (IERC721(mint).getApproved(token) == msg.sender) return true;
        address owner = IERC721(mint).ownerOf(token);
        return
            owner == msg.sender ||
            IERC721(mint).isApprovedForAll(owner, msg.sender);
    }
}
