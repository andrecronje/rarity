// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


interface rarity {
    function summoner(uint _summoner) external view returns (uint _xp, uint _log, uint _class, uint _level);
    function level(uint) external view returns (uint);
    function getApproved(uint) external view returns (address);
    function ownerOf(uint) external view returns (address);
}

interface gold {
    function transferFrom(uint executor, uint from, uint to, uint amount) external;
}


contract names  {


    string constant name = "Rarity Names";
    string constant symbol = "names";

    rarity constant rm = rarity(0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb);
    gold constant g = gold(0x2069B76Afe6b734Fb65D1d099E7ec64ee9CC76B2);

    mapping(uint => string) public n;

    function title(uint _lvl) public pure returns (string memory) {
        if (_lvl <= 3) {
            return "Noob";
        } else if (_lvl > 3 && _lvl <= 5) {
            return "Trainee";
        } else if (_lvl > 5 && _lvl <= 10) {
            return "Rookie";
        } else if (_lvl > 10 && _lvl <= 20) {
            return "Master";
        } else if (_lvl > 20 && _lvl <= 30) {
            return "Grandmaster";
        } else if (_lvl > 30 && _lvl <= 40) {
            return "Legend";
        } else {
            return "Hero";
        }
    }

    function summoner_name(uint _summoner) public view returns (string memory) {
        return n[_summoner];
    }

    function full_name(uint _summoner) public view returns (string memory) {
        (uint _xp, uint _log, uint _class, uint _level) = rm.summoner(_summoner);
        string memory sn = n[_summoner];
        return string(abi.encodePacked(title(_level), " ", sn));
    }

    function set_name(uint _summoner, string calldata _name) external {
        require(rm.ownerOf(_summoner) == msg.sender, "Names: not owner");
        n[_summoner] = _name;
    }


}