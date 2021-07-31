# Learning to code a smart contract with solidity. 

This repository contains a sample code that can use as the starting point. 
It's also a great fit for learning the basics of smart contract development.

## Sample Code


## How to start project.

The first things you need to do are cloning this repository and installing its
dependencies:

```sh
git clone https://github.com/boonys20/solidity.git
cd solidity
npm install
```

Once installed, let's run Hardhat's testing network:

```sh
npx hardhat node
```

Also, you can run unit test to understand how the code works.

```sh
npx hardhat test
```

Then, on a new terminal, go to the repository's root folder and run this to
deploy your contract:

```sh
npx hardhat run scripts/deploy.js --network localhost
```

## User Guide

You can find detailed instructions on using this repository and many tips in [its documentation](https://hardhat.org/tutorial).
- [Project description (Token.sol)](https://hardhat.org/tutorial/4-contracts/)
- [Setting up the environment](https://hardhat.org/tutorial/1-setup/)
- [Testing with Hardhat, Mocha and Waffle](https://hardhat.org/tutorial/5-test/)
- [Setting up Metamask](https://hardhat.org/tutorial/8-frontend/#setting-up-metamask)
- [Hardhat's full documentation](https://hardhat.org/getting-started/)

For a complete introduction to Hardhat, refer to [this guide](https://hardhat.org/getting-started/#overview).

**Happy _buidling_!**
