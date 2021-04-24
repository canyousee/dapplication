# CrowdWisdoms
## Introduction
This project targets a blockchain-powered architecture with security protocols that allow screening out low-quality data, and aggregating useful ones, all in a privacy-preserving way. 

We tailor designs for three common data types: **numeric**, **categorical**, and **textual**. Based on them, we implement a comprehensive system prototyping, including one-stop management portal, blockchain smart contracts, trusted hardware module, etc., with extensive field testing. 

## Requirements

Recommended environment for system

`Ubuntu* 16.04 LTS Desktop 64bits`

Recommended public blockchain test network

	* Rinkeby
	* Rospten
	
Required tools

```
* Truffle
* Python v3.7
* Node.js v12
* Npm v6.14.6
* Mysql v5.7
* Redis v5.0.9
* Intel SGX SDK 2.11
```

## Setup
Backend Setup

```
cd ..\backend
npm install
npm start
cd ..\secapp
make
```

MySQL Setup

```
cd $RedisPATH
redis-server.exe redis.windows.conf
redis-cli.exe -h 127.0.0.1 -p 6379
set key 123
get key
```

Frontend Setup

```
cd ..\frontend
npm install
npm run serve
```

### Blockchain
#### Prerequisites
	* Install MetaMask extension on browser
	* Install Ganache for getting virtual ETH
	* Create account on Infura.io for connecting to the test networks
	* Create account on Etherscan.io for automatic contract verification
#### Setup
```
pip3 install eth-brownie web3
brownie pm install OpenZeppelin/openzeppelin-contracts@3.0.0
touch ~/.bash_profile
vim ~/.bash_profile
<!-- add the following inside the vim -->
export PUBLIC_KEY=$your_ETH_address
export PRIVATE_KEY=$your_ETH_private_key
export WEB3_INFURA_PROJECT_ID=$project_id_from_infura
export ETHERSCAN_TOKEN=$etherscan_token
<!-- end -->
`source ~/.bash_profile`
```

#### Configuration of blockchain network
```
networks:
  default: development
  development:
    gas_limit: max
    gas_buffer: 1
    gas_price: 0
    reverting_tx_gas_limit: max
    default_contract_owner: true
    cmd_settings:
      host: http://127.0.0.1:7545/
      port: 7545
  live:
    gas_limit: auto
    gas_buffer: 1.1
    gas_price: auto
    reverting_tx_gas_limit: false
    default_contract_owner: false
  rinkeby:
    host: https://rinkeby.infura.io/v3/id
    explorer: https://api-rinkeby.etherscan.io/api
```

#### Compile and Deploy contracts
```
`cd CrowdCoin`
`brownie compile --all`
# Deploy to rinkeby
`brownie run scripts/deploy.py --network rinkeby`
```

