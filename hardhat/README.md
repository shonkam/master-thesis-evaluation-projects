# Source code of Hardhat evaluation

##  Functionalities
* fetches token's name
* fetches metamask address
* fetches account's balance
* request (transfer) tokens from a fixed account to your own
* donate tokens to a fixed account

If you face some problems (e.g., error about invalid block), try resetting your metamask account (settings -> advanced -> reset account)

## How to run

* clone the repo at root
* cd hardhat
* npm install
* ```npx hardhat node```
* ```npx hardhat --network localhost run scripts/deploy.js ```
* (from another terminal) cd frontend
* npm install
* npm start
* frontend is accessible at www.localhost:3000
* transfer ETH into your account to be able to use the page with ```npx hardhat --network localhost faucet <your metamask address>```