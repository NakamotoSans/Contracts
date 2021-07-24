# Implementation of Coffee Supplychain using Ethereum Smart Contract

This project showcases the journey of coffee beans on blockchain. 

The coffee supply chain is the sequence of activities and process  to bring raw coffee beans from coffee farms to processed coffee in markets. 

#### Problems in Existing System
---

- Currently Coffee trade mostly relies on fax machines and emails to send and recieve contracts across the globe, resulting into slower and error prone paper work.

- Blockchain can solve this by providing immutable and verifiable data sources

		
 

#### What we are providing?
---

- We have implemented smart contract addressing the issue of storing critical data necessary at different stages of supplychain and making it verifiable by all stakeholders in supplychain.


#### Application Workflow Diagram
---
![](screens/workflow.png)

#### In this application we have Six stages
---

1. Admin
2. Farm-Inspector
3. Harvester
4. Exporter
5. Importer
6. Processor

**Admin :** Admin creates new batch which is initial stage of coffee batch.

**Farm-Inspector :**  Farm-inspectors are responsible for inspecting coffee farms and updating the information like coffee family, type of seed and fertilizers used for growing coffee.

**Harvester :** Harvesters conducting plucking, hulling , polishing , grading and sorting activities, further updating the information of crop variety, temperature used and humidity maintained during the process.

**Exporter :** Exporters are the organization who exports coffee beans throughout the world. Exporter  adds quantity, destination address, ship name, ship number , estimated date and time and exporter id.

**Importer :** Importers imports the coffee from coffee suppliers and  updates quantity, ship name, ship number , transporters information, warehouse name, warehouse address and the importer's address.

**Processor :** Processors are the organizations who processes raw coffee beans by roasting them on particular temperature and humidity and makes it ready for packaging and to sale into markets. Processor adds the information like quantity, temperature , roasting duration , internal batch number , packaging date time, processor name and processor address.

#### Included Components
---
-  Solidity (Ethereum)
-  Metamask  (Ethereum wallet)
-  Rinkeby test network ( use rinkeby faucet to get ethers on rinkeby network )
-  Infura
-  Truffle
-  IPFS
-  Web3JS
-  Apache and PHP

#### Prerequisites
---
- Nodejs v9.10 or above
- Truffle v4.1.8 (core: 4.1.8) (http://truffleframework.com/docs/getting_started/installation)
- Solidity v0.4.23
- Metamask (https://metamask.io) /Ganache Wallet
> [Please Note : infura.io provider is used for the demo ]

#### Deployment Steps:
---
**Setting up Ethereum Smart Contract:**

```
git clone https://github.com/rwaltzsoftware-org/coffee-supplychain-ethereum
cd coffee-supplychain-ethereum/
```

**Update truffle.js **

```
var HDWalletProvider = require("truffle-hdwallet-provider");
module.exports = 
{
    networks: 
    {
	    development: 
		{
	   		host: "localhost",
	   		port: 8545,
	   		network_id: "*" // Match any network id
		},
    	rinkeby: {
    	    provider: function() {
		      var mnemonic = "steel neither fatigue ...";//put ETH wallet 12 mnemonic code	
		      return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/8U0AE4DUGSh8lVO3zmma");
		    },
		    network_id: '4',
		    from: '0xab0874cb61d.....',/*ETH wallet 12 mnemonic code wallet address*/
		}  
    }
};
```

Go to your project folder in terminal then execute :

```
rm -rf build/
truffle compile 
npm install truffle-hdwallet-provider
truffle migrate --network rinkeby reset
```
**Please note:**
1. After successfully deployment you will get response in bash terminal like below
```
Running migration: 1_initial_migration.js
  Deploying Migrations...
  ... 0x8be4cb8e9c1be61bb83f2661bb8e8a4fefc31433b68137f88a7088a0bb0cccda
  Migrations: 0xd0fc5980df528878573d97e91a11b4196b060174
Saving successful migration to network...
  ... 0x68483eb11712987b190469033e3b12e04bbe960ffbdbfd508eb7618f91ca7dd6
Saving artifacts...
Running migration: 2_deploy_contracts.js
  Deploying SupplyChainStorage...
  ... 0x42bd453f05e530d312c6140a848aa111d08e2edb8ec96bd380e78d1fd0ebc444
