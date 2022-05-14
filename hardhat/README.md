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
``` shell
git clone https://github.com/shonkam/master-thesis-evaluation-projects.git
cd master-thesis-evaluation-projects
cd hardhat
npm install
npx hardhat node
```
* (from another terminal) at the root of the repo
```shell
cd hardhat
npx hardhat --network localhost run scripts/deploy.js 
```
* (from another terminal) at the root of the repo
```shell
cd hardhat
cd frontend
npm install
npm start
```
* frontend is now accessible at localhost:3000
* your browser must have the metamask extension and you must login to metamask to use it

transfer ETH into your account to be able to use the page with
* (from another terminal) at the root of the repo
```shell
cd hardhat
npx hardhat --network localhost faucet <your metamask address>
```