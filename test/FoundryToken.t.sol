// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {FoundryToken} from "../src/FoundryToken.sol";

contract FoundryTokenTest is Test {
    FoundryToken internal token;

    function setUp() public {
        token = new FoundryToken(1000);
    }

    function testName() public {
        assertEq(token.name(), "FoundryToken");
    }

    function testSupply() public {
        assertEq(token.totalSupply(), 1000);
    }
}
