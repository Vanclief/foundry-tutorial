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

        // Create a user
        address payable[] memory users = utils.createUsers(2);

        // Assign the user 0 as Alice
        alice = users[0];
        vm.label(alice, "Alice");
        // Assign the user 1 as Bob
        bob = users[1];
        vm.label(bob, "Bob");
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

    // checks that the symbol of the token is `FTK`
    function testTokenSymbolFTK() public {
        assertEq(token.symbol(), "FTK");
    }

    // test to check that when transfering tokens from `alice` to `bob` the tokens are actually transfered and that `alice` balance is reduced by the amount of tokens transfered
    function testTransferTokens() public {
        // Transfer to Alice the amount of 100 tokens
        token.transfer(alice, 100);
        assertEq(token.balanceOf(alice), 100);
        // Alice is the sender
        vm.startPrank(alice);
        // Transfering the tokens to Bob
        token.transfer(bob, 10);
        // Checking the balances of alice and bob after transfer is done
        assertEq(token.balanceOf(alice), 90);
        assertEq(token.balanceOf(bob), 10);
    }    
}