// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Provider is ERC20 {
    address admin;
    IERC20 dai;

    constructor(address _dai) ERC20("Liquidity Provider", "LP") {
        admin = msg.sender;
        dai = IERC20(_dai);
    }

    //100 basis points = 1%
    function calculateFee(uint256 amount) external pure returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");
        return (amount * 100) / 10000;
    }
}
