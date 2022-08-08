// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract FoundryToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("FoundryToken", "FTK") {
        _mint(msg.sender, initialSupply);
    }

    function mintFor(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }
}
