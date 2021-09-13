// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./IERC721.sol";

interface rarity_manifested is IERC721 {
    function summoner(uint _summoner) external view returns (uint _xp, uint _log, uint _class, uint _level);
    function level(uint) external view returns (uint);
    function class(uint) external view returns (uint);
    function classes(uint) external pure returns (string memory);
}

interface rarity_attributes {
    function ability_scores(uint _summoner) external view returns (uint32, uint32, uint32, uint32, uint32, uint32);
    function abilities_by_level(uint _level) external view returns (uint);
    function character_created(uint _summoner) external view returns (bool);
}

interface rarity_skills {
    function get_skills(uint _summoner) external view returns (uint8[36] memory);
    function skills_per_level(int _int, uint _class, uint _level) external view returns (uint points);
    function calculate_points_for_set(uint _class, uint8[36] memory _skills) external view returns (uint points);
    function class_skills(uint _class) external view returns (bool[36] memory _skills);
}

interface rarity_fungible {
    event Transfer(uint indexed from, uint indexed to, uint amount);
    event Approval(uint indexed from, uint indexed to, uint amount);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(uint owner) external view returns (uint);
    function allowance(uint owner, uint spender) external view returns (uint);

    function approve(uint from, uint spender, uint amount) external returns (bool);
    function transfer(uint from, uint to, uint amount) external returns (bool);
    function transferFrom(uint executor, uint from, uint to, uint amount) external returns (bool);
}

interface rarity_gold is rarity_fungible {
    function claimed(uint _summoner) external view returns (uint);
}

interface rarity_mat1 is rarity_fungible {
    function scout(uint _summoner) external view returns (uint reward);
}

interface rarity_item1 is IERC721Enumerable {
    function items(uint) external view returns (uint8, uint8, uint32, uint);
}

interface rarity_names is IERC721Enumerable {
    function summoner_name(uint) external view returns (string memory);
}
