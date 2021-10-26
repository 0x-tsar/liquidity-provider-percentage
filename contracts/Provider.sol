// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Provider is ERC20 {
    address admin;
    IERC20 dai;

    mapping(address => uint256) public checkpoint;

    constructor(address _dai) ERC20("Liquidity Provider", "LP") {
        admin = msg.sender;
        dai = IERC20(_dai);
    }

    function addingLiquidity(uint256 _amount) external {
        require(checkpoint[msg.sender] > 0, "First withdraw your funds");
        //first approve this contract to use dai
        dai.transferFrom(msg.sender, address(this), _amount);
        checkpoint[msg.sender] = block.timestamp;

        //added some percentage to it related to minutes
        _mint(msg.sender, _amount);
    }

    //100 basis points = 1%
    function calculateFee(uint256 amount) external pure returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");
        return (amount * 100) / 10000;
    }
}
