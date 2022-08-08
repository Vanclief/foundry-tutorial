## Symbol value

Checking for the symbol value, is quite straight forward:

```
    function testSymbol() public {
        assertEq(token.symbol(), "FTK");
    }
```


## Test transfer balances

This one is a bit, more tricky.

First we need to create the accounts for `alice` and `bob`. We do this by first declaring a `payable address` for both of them:

```
    address payable internal alice;
    address payable internal bob;

```

Then on our `setUp` function we need to create 2 users and assign them to the variables:
```
        // Create 2 users
        address payable[] memory users = utils.createUsers(2);

        // Assign the user 0 as Alice
        alice = users[0];
        vm.label(alice, "Alice");

        // Assign the user 1 as Bob
        bob = users[1];
        vm.label(bob, "Bob");
```


We need to transfer some tokens to alice, so that we can test the transfer as well:
```
        // Transfer 100 tokens to Alice
        token.transfer(alice, 100);
```

Finally, we write our test:
```
    function testTransfer() public {
        // Make sure alice has 100 tokens
        assertEq(token.balanceOf(alice), 100);

        // Use alice as the sender
        vm.startPrank(alice);

        // Transfer the tokens
        token.transfer(bob, 60);

        // Check that the balance of alice is 40
        assertEq(token.balanceOf(alice), 40);

        // Check that the balance of bob is 60
        assertEq(token.balanceOf(bob), 60);
    }
```

Full contract:

```
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

        // Create 2 users
        address payable[] memory users = utils.createUsers(2);

        // Assign the user 0 as Alice
        alice = users[0];
        vm.label(alice, "Alice");

        // Assign the user 1 as Bob
        bob = users[1];
        vm.label(bob, "Bob");

        // Transfer 100 tokens to Alice
        token.transfer(alice, 100);
    }

    function testName() public {
        assertEq(token.name(), "FoundryToken");
    }

    function testSupply() public {
        assertEq(token.totalSupply(), 1000);
    }

    function testOnlyOwner() public {
        // Mint more tokens
        token.mintFor(address(this), 1000);
        assertEq(token.totalSupply(), 2000);

        vm.startPrank(alice);
        vm.expectRevert(bytes("Ownable: caller is not the owner"));
        token.mintFor(alice, 1000);
    }

    function testTransfer() public {
        // Make sure alice has 100 tokens
        assertEq(token.balanceOf(alice), 100);

        // Use alice as the sender
        vm.startPrank(alice);

        // Transfer the tokens
        token.transfer(bob, 60);

        // Check that the balance of alice is 40
        assertEq(token.balanceOf(alice), 40);

        // Check that the balance of bob is 60
        assertEq(token.balanceOf(bob), 60);
    }
}
```