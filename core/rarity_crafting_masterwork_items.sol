//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "./rarity_crafting_masterwork_uri.sol";
import "../library/Crafting.sol";
import "../library/Rarity.sol";

interface masterwork_projects {
    function projects(uint256 token)
        external
        view
        returns (masterwork_uri.Project memory);
}

contract rarity_masterwork_items is ERC721Enumerable {
    uint256 public next_token = 1;

    address public PROJECT_MINT;

    function set_project_mint(address mint) public {
        require(PROJECT_MINT == address(0), "already set");
        PROJECT_MINT = mint;
    }

    mapping(uint256 => masterwork_uri.Item) public items;
    mapping(uint256 => bool) public claims;

    event Crafted(
        address indexed owner,
        uint256 indexed token,
        uint256 crafter,
        uint8 base_type,
        uint8 item_type
    );

    constructor() ERC721("Rarity Crafting (II)", "RC(II)") {}

    function claim(uint256 projectToken) public {
        require(
            Crafting.isApprovedOrOwnerOfItem(projectToken, PROJECT_MINT),
            "!approvedForItem"
        );
        require(!claims[projectToken], "claimed");

        masterwork_uri.Project memory project = masterwork_projects(
            PROJECT_MINT
        ).projects(projectToken);
        require(project.complete, "!complete");
        require(
            Rarity.isApprovedOrOwnerOfSummoner(project.crafter),
            "!approvedForSummoner"
        );

        masterwork_uri.Item storage item = items[next_token];
        item.base_type = project.base_type;
        item.item_type = project.item_type;
        item.crafted = uint64(block.timestamp);
        item.crafter = project.crafter;

        _safeMint(msg.sender, next_token);

        emit Crafted(
            msg.sender,
            next_token,
            project.crafter,
            item.base_type,
            item.item_type
        );

        claims[projectToken] = true;
        next_token += 1;
    }

    function tokenURI(uint256 token)
        public
        view
        virtual
        override
        returns (string memory uri)
    {
        masterwork_uri.Item memory item = items[token];
        if (item.base_type == 2) {
            return masterwork_uri.armor_uri(token, item);
        } else if (item.base_type == 3) {
            return masterwork_uri.weapon_uri(token, item);
        } else if (item.base_type == 4) {
            return masterwork_uri.tools_uri(token, item);
        }
    }
}
