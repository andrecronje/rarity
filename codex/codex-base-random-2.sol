// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract codex {
    string public constant index = "Base";
    string public constant class = "Random-2";

    function d100(uint256 a, uint256 b) external view returns (uint8) {
        return dn(a, b, 100);
    }

    function d20(uint256 a, uint256 b) external view returns (uint8) {
        return dn(a, b, 20);
    }

    function d12(uint256 a, uint256 b) external view returns (uint8) {
        return dn(a, b, 12);
    }

    function d10(uint256 a, uint256 b) external view returns (uint8) {
        return dn(a, b, 10);
    }

    function d8(uint256 a, uint256 b) external view returns (uint8) {
        return dn(a, b, 8);
    }

    function d6(uint256 a, uint256 b) external view returns (uint8) {
        return dn(a, b, 6);
    }

    function d4(uint256 a, uint256 b) external view returns (uint8) {
        return dn(a, b, 4);
    }

    function dn(
        uint256 a,
        uint256 b,
        uint8 die_sides
    ) public view returns (uint8) {
        return uint8((_seed(a, b) % uint256(die_sides)) + 1);
    }

    function _random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function _seed(uint256 a, uint256 b) internal view returns (uint256 rand) {
        rand = _random(
            string(abi.encodePacked(block.timestamp, a, b, msg.sender))
        );
    }
}
