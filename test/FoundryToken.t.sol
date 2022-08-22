// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {Utilities} from "./utils/Utilities.sol";
import {FoundryToken} from "../src/FoundryToken.sol";

contract FoundryTokenTest is Test {
    Utilities internal utils;
    FoundryToken internal token;

    address payable internal alice;
    address payable internal bob;

    function setUp() public {
        utils = new Utilities();
        token = new FoundryToken(1000);

        // Create users
        address payable[] memory users = utils.createUsers(2);

        // Assign the user 0 as Alice
        alice = users[0];
        vm.label(alice, "Alice");

        // Asign the user 1 as Bob
        bob = users[1];
        vm.label(bob, "Bob");

        // Asign 100 tokens to Alice
        token.transfer(alice, 100);
    }

    function testName() public {
        assertEq(token.name(), "FoundryToken");
    }

    function testSupply() public {
        assertEq(token.totalSupply(), 1000);
    }

    function testOnlyOwnerCanMint() public {
        // The owner can mint more tokens
        token.mintFor(address(this), 1000);
        assertEq(token.totalSupply(), 2000);

        // Alice can't mint more tokens
        vm.startPrank(alice);
        vm.expectRevert(bytes("Ownable: caller is not the owner"));
        token.mintFor(alice, 1000);
    }
    
    // Symbol Test
    function testSymbol() public {
        assertEq(token.symbol(), "FTK");
    }

    // Transfer test
    function testTransfer() public {
        assertEq(token.balanceOf(alice), 100);
        // Set Alice as the sender
        vm.startPrank(alice);
        // Transfer the tokens to Bob
        token.transfer(bob, 35);
        // Check the balances after the transfer
        assertEq(token.balanceOf(alice), 65);
        assertEq(token.balanceOf(bob), 35);
    }
}
