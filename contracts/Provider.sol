// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Provider {
    address admin;

    constructor() {}

    //100 basis points = 1%
    function calculateFee(uint256 amount) external pure returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");
        return (amount * 100) / 10000;
    }
}
