//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

library StringUtil {
    function toString(int256 value) internal pure returns (string memory) {
        string memory _string = "";
        if (value < 0) {
            _string = "-";
            value = value * -1;
        }
        return string(abi.encodePacked(_string, toString(uint256(value))));
    }

    // Inspired by OraclizeAPI's implementation - MIT license
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol
    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
