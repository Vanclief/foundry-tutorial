# foundry-tutorial

Basic tutorial on how to get started with testing and deployment on foundry


## Prerequisites

1. Install [foundry](https://github.com/foundry-rs/foundry)

2. Clone this repo

3. Create an [alchemy](https://www.alchemy.com/) account and create a new Goerli App

4. Get some Goerli tokens from a [faucet](https://goerlifaucet.com/).

5. Create an Etherscan account

## Challenges

### Testing a Smart Contract

1.  Execute `forge test` to run the tests
2.  Add another test to `FoundryToken.t.sol` that checks that the symbol of the token is `FTK`
3.  Add another test to check that when transfering tokens from `alice` to `bob` the tokens are actually transfered and that `alice` balance is reduced by the amount of tokens transfered.

_hint_: You can use `forge test -vv` to see a more detailed output of the tests. 

_hint_: You can create an array of user accounts with `address payable[] memory users = utils.createUsers(2);`


[Step by step solution](./solutions/testing.md)

### Deploying a Smart Contract

1. Deploy and verify the `FoundryToken` to Goerli.

[Step by step solution](./solutions/deploying.md)

## Resources

* [Foundry test docs](https://book.getfoundry.sh/forge/tests)
* [Foundry deployment docs](https://book.getfoundry.sh/forge/deploying)

## Become a Security 

Do you want to become an OpenZeppelin Security Auditor? 

Join the Security Fellowship Program that starts in September.

Its a full time, paid program for people with a development or security
background.

More [info here](https://grnh.se/6bae0f373us)
