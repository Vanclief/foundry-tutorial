
## Deployment

Export all your secrets
```
export RPC_URL=<Your rpc url>
export PRIVATE_KEY=<Your metamask private key>
export ETHERSCAN_API_KEY=<Your Etherscan API Key>
```

Deploy the contract with `forge create`
```
forge create FoundryToken --rpc-url=$RPC_URL --constructor-args 1000000000000000000 --private-key=$PRIVATE_KEY --etherscan-api-key=$ETHERSCAN_API_KEY --verify
```