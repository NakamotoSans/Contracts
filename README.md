# Implementation of Decentralised Taxi Hailing Service using Ethereum Smart Contract

This project showcases the interaction between the commuter and driver during the course of booking a ride on blockchain. 

dRyver handles the sequence of activities and processes smoothly to make the experiance of travelling seamless.

#### Problems in Existing System
---

-Applications like Uber provide a matching service and apparently decentralize it. 
This is P2P technology at its finest .
Or is it? Several scandals have emerged out of {Uber’s corporate culture as of late.
Uber has become notorious both for its business practices, and for what it incentivi‐
zes and allows its drivers to do. Uber executive Emil Michael told the company to dig
up dirt on a particular critical female reporter as well as other opponents. The power
the company exerts over its drivers has grown from surveillance into possibly preda‐
tory lending practices. Uber’s “God Mode,” the ability to see all rides happening in
any location in real time with all social data attached to each rider, has been the sub‐
ject of controversy on multiple occasions. Drivers, meanwhile, have been known to
hail Lyft cabs only to cancel them, so that riders would instead choose Uber.
Despite these concerns, Uber has grown at an exponential rate over the past few years
and is showing revenue numbers in the billions. It provides a useful service: people
prefer using a location-aware app to hail a ride over calling a taxi, and it’s safe to
say the demand for real-time ride-sharing isn’t going away anytime soon. But privacy
invasion and the vast imbalance of power between a billion-dollar corporation and its
87 contractors are the negatives of Uber that riders must accept when they use its ser‐
vice.


- Blockchain can solve this by providing immutable and verifiable data sources.

		
 

#### What we are providing?
---

- We have implemented smart contract addressing the issue of storing critical data necessary at different stages of Taxi Hailing and making it verifiable by all stakeholders in dRyver.

-We eliminate the existence of middle agency, Thereby completely removing the regulation of salaries of drivers by corporations. And in that 


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
