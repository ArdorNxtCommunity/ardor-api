---
title: Ardor API Reference
favicon: images/ardor-favicon.png
logo: images/logo.png

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL
  - javascript: JavaScript

toc_footers:
  - <a href='#'>Ardor API Documentation</a>
  - <a href='https://www.ardornxt.group'>Powered by ArdorNxt Group</a>
  
includes:
  - accounts.md
  - account-control.md
  - transactions.md
  - coin-exchange.md
  - asset-exchange.md
  - digital-goods.md
  - monetary-system.md
  - messaging.md
  - voting.md
  - data-storage.md
  - alias.md
  - privacy-shuffling.md
  - blocks.md
  - forging.md
  - node-network.md
  - phasing.md
  - search.md
  - utils.md

search: true
---

# Introduction to Ardor API

Welcome to the Ardor Blockchain-as-a-Service platform API reference documentation.
This documentation is intended for developers from all horizons who want to explore with Ardor platform, build Decentrealized Applications (Dapps), leverage and integrate their own solutions to a public blockchain with huge flexibility like Ardor.

All the interactions with Ardor blockchain are done using HTTP requests and the responses are delivered as JSON objects. Thus, Ardor API can be used universally with any langage of your choice. In the what follows, `shell` and `Javascript` langages will be used to demonstrate the usage of the API, but other sdks are in development.

If you want to interactivally test the API with more recent blockchain data, we recommend you to:

1. Download the Ardor wallet [here](https://www.ardorplatform.org/)
2. Follow the installation instructions
3. Launch the Ardor wallet (can be found as Ardor Server too on Windows) and wait for the wallet to sync
4. Go to http://localhost:27876/test
5. Scroll to the call you want to test, set the call parameters and explore the results on the side.

We provide you here with some general notes when using the API, before going in detail with the description of each available call.

When using the API, you may encounter in many places the usage of *nxt* either in the calls or in parameters and this is due to the fact that Ardor blockchain is an evolution of the Nxt blockchain that resulted in the creation of a new blockchain because of architecture changes introducing the Parent-ChildChain designed for high scalability. Nevertheless, many parts of the Nxt code source are shared between Nxt and Ardor and when you communicate with an Ardor server (using the API calls) then you can be ensured that all your interactions are with Ardor system and not Nxt system.

## Javascript API testing

> testArdor.js content:

```typescript
var config = {
    "comment": "Node JS module configuration file",
    "url": "http://localhost:27876",
    "secretPhrase": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "recipientPublicKey": "5b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c27",
    "isTestNet": true,
    "chain": "2",
    "adminPassword": ""
};

// Importing the package
ardor = require("ardor-blockchain");

// Initializing the object with meta parameters
ardor.init(config);

ardor.load(function(NRS) {
    // Request data
    var data = {
        account : "ARDOR-HWZW-5TT6-U68F-H26L8"
    };
    // Request query and response
    	NRS.sendRequest("getAccountProperties", data, function (response) {
        NRS.logConsole(JSON.stringify(response));
    });
});
```

> Api response in console:

```cmd
/usr/local/bin/node --inspect-brk=28964 testArdor.js 
Debugger listening on ws://127.0.0.1:28964/b0cd1c8b-bbbe-4105-b43d-28b228e6ccef
Debugger attached.
Test finished
testArdor.js:29
Started
nrs.node.bridge.js:45
done loading server constants
nrs.constants.js:139
2018-08-16T06:46:32.731Z Send request getAccountPublicKey to url https://testardor.jelurida.com/nxt?requestType=getAccountPublicKey id=0
nrs.console.js:39
2018-08-16T06:46:32.931Z {"publicKey":"5b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c27","requestProcessingTime":0}
```

As stated before, you can call the Ardor API both from `shell` and `Javascript`, we provide here we a simple demonstration of how you can achieve your testing in `javascript`.

1. Download the Ardor wallet from [official ardor website](https://www.ardorplatform.org/), then follow the installation instructions and please chose TestNet for your first tests
2. Create an empty project: `mkdir test-ardor-blockchain | cd test-ardor-blockchain`
3. Install the package for this project: `npm install --save <ArdorInstallationFolder>/html/www/js/`
4. Create a simple js in the `test-ardor-blockchain` folder and paste the javascript code on it
5. Start your Ardor node in order to execute the calls locally, otherwise you have to change the url in the js script to point the remote node
6. Run you script and you will get the desired response.

## Flexible Account IDs

All API requests that require an account ID accept either an account number or the corresponding Reed-Solomon address (ARDR-XXXX-XXXX-XXXX-XXXXX).

## Creating Unsigned Transactions

All API requests that create a new transaction will accept either a *secretPhrase* or a *publicKey* parameter:

- If *secretPhrase* is supplied, a transaction is created, signed at the server, and broadcast by the server as usual.
- If only a *publicKey* parameter is supplied as a 64-digit (32-byte) hex string, the transaction will be prepared by the server and returned in the JSON response as *transactionJSON* without a signature. This JSON object along with *secretPhrase* can then be supplied to Sign Transaction as *unsignedTransactionJSON* and the resulting signed *transactionJSON* can then be supplied to Broadcast Transaction. This sequence allows for:
  - Offline signing of transactions so that *secretPhrase* never needs to be exposed and increases security of account holdings
  - Voucher requests where a merchant can build the payment request and costumer signing it on his own device
- *unsignedTransactionBytes* may be used instead of unsigned transactionJSON when there is no encrypted message. Messages to be encrypted require the secretPhrase for encryption and so cannot be included in unsignedTransactionBytes.

## Escrow Operations

All API requests that create a new transaction will accept an optional *referencedTransactionFullHash* parameter which creates a chained transaction, meaning that the new transaction cannot be confirmed unless the referenced transaction is also confirmed. This feature allows a simple way of transaction escrow:

- Alice prepares and signs a transaction **A**, but doesn't broadcast it by setting the broadcast parameter to false. She sends to Bob the *unsignedTransactionBytes*, the *fullHash* of the transaction, and the *signatureHash*. All of those are included in the JSON returned by the API request.

Warning: Make sure not to send the *signed transactionBytes*, or the signature itself, as then Bob can just broadcast transaction **A** himself.

- Bob prepares, signs and broadcasts transaction **B**, setting the *referencedTransactionFullHash* parameter to the *fullHash* of **A** provided by Alice. He can verify that this hash indeed belongs to the transaction he expects from Alice, by using Calculate Full Hash, which takes *unsignedTransactionByte*s and *signatureHash* (both of which Alice has also sent to Bob). He can also use Parse Transaction to decode the unsigned bytes and inspect all transaction fields.
- Transaction **B** is accepted in the unconfirmed transaction pool, but as long as **A** is still missing, **B** will not be confirmed, i.e. will not be included in the blockchain. If **A** is never submitted, **B** will eventually expire -- so Bob should make sure to set a long enough deadline, such as the maximum of 32767 minutes(~23 days).
- Once in the unconfirmed transactions pool, Bob has no way of recalling **B** back. So now Alice can safely submit her transaction **A**, by just broadcasting the *signedTransactionBytes* she got in the first step. Transaction **A** will get included in the blockchain first, and in the next block Bob's transaction **B** will also be included.

Note that while the above scheme is good enough for a simple escrow, the blockchain does not enforce that if **A** is included, **B** will also be included. It may happen due to forks and blockchain reorganization, that **B** never gets a chance to be included and expires unconfirmed, while **A** still remains in the blockchain. However, it is not practically possible for Bob to intentionally cause such chain of events and to prevent **B** from being confirmed.

## Prunable Data

Prunable data can be removed from the blockchain without affecting the integrity of the blockchain. When a transaction containing prunable data is created, only the 32-byte sha256 hash of the prunable data is included in the transactionBytes, not the prunable data itself. The non-prunable signed transactionBytes are used to verify the signature and to generate the transaction's fullHash and ID; when the prunable part of the transaction is removed at a later time, none of these operations are affected.

Prunable data has a predetermined minimum lifetime of two weeks (24 hours on the Testnet) from the timestamp of the transaction. Transactions and blocks received from peer nodes are not accepted if prunable data is missing before this time has elapsed. After this time has elapsed, prunable data is no longer included with transactions and blocks transmitted to peer nodes, and is no longer included in the transaction JSON returned by general-purpose API calls such as Get Transaction; the only way to retrieve it, if still available, is through special-purpose API calls such as Get Prunable Message.

Expired prunable data remains stored in the blockchain until removed at the same time derived tables are trimmed, which occurs automatically every 1000 blocks by default. Use Trim Derived Tables to remove expired prunable data immediately.

Prunable data can be preserved on a node beyond the predetermined minimum lifetime by setting the *nxt.maxPrunableLifetime* property to a larger value than two weeks or to -1 to preserve it indefinitely. To force the node to include such preserved prunable data when transactions and blocks are transmitted to peer nodes, set the *nxt.includeExpiredPrunables* property to true, thus making it an archival node.

Currently, there are two varieties of prunable data in the Ardor system: prunable Arbitrary Messages and Tagged Data. Both varities have a maximum prunable data length of 42 kilobytes

## Properties Files

The behavior of some API calls is affected by property settings loaded from files in the `<WorkingDirectory>/ardor/conf` directory during Ardor server intialization. This directory contains the `nxt-default.properties` and `logging-default.properties` files, both of which contain default property settings along with documentation. A few of the property settings can be obtained while the server is running through the Get Blockchain Status and Get State calls.

It is recommended not to modify default properties files because they can be overwritten during software updates. Instead, properties in the default files can be overridden by including them in optional `nxt.properties` and `logging.properties` files in the same directory. For example, a `nxt.properties` file can be created with the contents:

`
nxt.isTestnet=true
`

This causes the Nxt server to connect to the Testnet instead of the Mainnet.

## Admin Password

Some API functions take an *adminPassword* parameter, which must match the `nxt.adminPassword` property unless the `nxt.disableAdminPassword` property is set to true or the API server only listens on the localhost interface (when the `nxt.apiServerHost` property is set to 127.0.0.1).

All Debug Operations require *adminPassword* since they require some kind of privilege. On some functions *adminPassword* is used so you can override maximum allowed value for *lastIndex* parameter, which is set to 100 by default by the `nxt.maxAPIRecords` property. Giving you the option to retrieve more than 100 objects per request.

## Roaming and Light Client Modes

The remote node to use when in roaming and light client modes is selected randomly, but can be changed manually in the UI, or using the new set API Proxy Peer API, or forced to a specific peer using the `nxt.forceAPIProxyServerURL` property.

Remote nodes can be blacklisted from the UI, or using the Blacklist API Proxy Peer API. This blacklisting is independent from peer blacklisting. The API proxy blacklisting period can be set using the `nxt.apiProxyBlacklistingPeriod` property (default 1800000 milliseconds).

API requests that require sending the secret phrase, shared key, or admin password to the server, for features like forging, shuffling, or running a funding monitor, are disabled when in roaming or light client mode.