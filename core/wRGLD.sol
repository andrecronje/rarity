// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface rarity_interface {
    function next_summoner() external returns (uint);
    function summon(uint _class) external;
}

interface rarity_gold_interface {
    function transfer(uint from, uint to, uint amount) external returns (bool);
    function transferFrom(uint executor, uint from, uint to, uint amount) external returns (bool);
}

/// @title Wrapped Rarity Gold
/// @dev Make Rarity Gold ERC-20 compatible with ERC20 to make it usable with existing DeFi tools such as Uniswap-like DEXes.
/// @author swit.eth / https://twitter.com/nomorebear
contract wrapped_rarity_gold {
    uint public immutable SUMMMONER_ID;
    rarity_interface public constant rarity = rarity_interface(0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb);
    rarity_gold_interface public constant gold = rarity_gold_interface(0x2069B76Afe6b734Fb65D1d099E7ec64ee9CC76B2);

    string public constant name = "wrapped rarity gold";
    string public constant symbol = "wrgld";
    uint8 public constant decimals = 18;

    uint public totalSupply = 0;

    mapping(address => mapping (address => uint)) public allowance;
    mapping(address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);

    constructor() {
        SUMMMONER_ID = rarity.next_summoner();
        rarity.summon(11);
    }


    function deposit(uint from, uint amount) external {
        require(from != SUMMMONER_ID, '!from');
        require(gold.transferFrom(SUMMMONER_ID, from, SUMMMONER_ID, amount), '!transferFrom');
        _mint(msg.sender, amount);
    }

    function withdraw(uint to, uint amount) external {
        require(to != SUMMMONER_ID, '!to');
        _burn(msg.sender, amount);
        require(gold.transfer(SUMMMONER_ID, to, amount), '!transfer');
    }

    function _mint(address to, uint amount) internal {
        // mint the amount
        totalSupply += amount;
        // transfer the amount to the recipient
        balanceOf[to] += amount;
        emit Transfer(address(0), to, amount);
    }

    function _burn(address from, uint amount) internal {
        // burn the amount
        totalSupply -= amount;
        // transfer the amount from the recipient
        balanceOf[from] -= amount;
        emit Transfer(from, address(0), amount);
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transfer(address dst, uint amount) external returns (bool) {
        _transferTokens(msg.sender, dst, amount);
        return true;
    }

    function transferFrom(address src, address dst, uint amount) external returns (bool) {
        address spender = msg.sender;
        uint spenderAllowance = allowance[src][spender];

        if (spender != src && spenderAllowance != type(uint).max) {
            uint newAllowance = spenderAllowance - amount;
            allowance[src][spender] = newAllowance;

            emit Approval(src, spender, newAllowance);
        }

        _transferTokens(src, dst, amount);
        return true;
    }

    function _transferTokens(address src, address dst, uint amount) internal {
        balanceOf[src] -= amount;
        balanceOf[dst] += amount;

        emit Transfer(src, dst, amount);
    }
}
