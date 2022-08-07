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
3.  Add another test to check that when transfering tokens from `alice` to `bob` the tokens are actually transfered.

[Documentation](https://book.getfoundry.sh/forge/tests)

[Step by step solution](./solutions/testing.md)

### Deploying a Smart Contract

1. Deploy and veryfy the `FoundryToken` to Goerli.

[Documentation](https://book.getfoundry.sh/forge/deploying)

[Step by step solution](./solutions/deploying.md)

## Resources

* https://book.getfoundry.sh/
