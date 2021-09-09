// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';


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
contract wrapped_rarity_gold is ERC20('Wrapped Scarcity Gold', 'WSGOLD') {
    uint public immutable SUMMMONER_ID;
    rarity_interface public constant rarity = rarity_interface(0x4fb729BDb96d735692DCACD9640cF7e3aA859B25);
    rarity_gold_interface public constant gold = rarity_gold_interface(0x7303E7a860DAFfE4d0b33615479648cb3496903b);

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
}