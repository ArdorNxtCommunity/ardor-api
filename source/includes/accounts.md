# Accounts

This chapter focuses on all API calls that can help you interact identify an account and many other actions including: sending Ardor to an account, getting his balances, or more advanced interactions like properties and control features.


## Account Information

The set of API calls bellow allow you to request many informations about an account.

### GetAccountId

> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountId&publicKey=f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    publicKey: "f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a"
};
ardor.sendRequest("getAccountId", data, function (response) {
    ardor.logConsole("Account id is:" + JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
    {
        "accountRS": "ARDOR-8MVA-XCVR-3JC9-2C7C3",
        "publicKey": "f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a",
        "requestProcessingTime": 1,
        "account": "47475721164246888"
    }
]
```

Get an account ID given a secret passphrase or public key.

`GET http://localhost:27876/nxt?requestType=getAccountId&publicKey=<PublicKEY>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('secretPhrase', 'required', 'Optional') %>
<%= getParameter('publicKey', 'required', 'Mandatory if **secretPhrase** is not set.') %>

<aside class="warning">
The secret phrase in this call is Optional. Thus, do never communicate it to an unknown or untrusted node.
</aside>

### GetAccountPublicKey

> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountPublicKey&account=ARDOR-8MVA-XCVR-3JC9-2C7C3"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-8MVA-XCVR-3JC9-2C7C3"
};
ardor.sendRequest("getAccountPublicKey", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
    {
        "publicKey": "f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a",
        "requestProcessingTime": 0
    }
]
```

Get the public key associated with an account ID

`GET http://localhost:27876/nxt?requestType=getAccountPublicKey&account=<AccountID>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountLedger

> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountLedger&account=ARDOR-XK2L-Z7NK-VNKM-AZYVT"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-XK2L-Z7NK-VNKM-AZYVT"
};
ardor.sendRequest("getAccountLedger", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
    "entries": [
        {
            "holdingTypeIsUnconfirmed": true,
            "chain": 2,
            "change": "150000000000",
            "holdingTypeCode": 1,
            "eventType": "ORDINARY_PAYMENT",
            "ledgerId": "119534",
            "eventHash": "f49a6b4b8450b0cd4c9454be9c4540318acccf5927895bdf5b5eaa8622e5d435",
            "holding": "2",
            "isTransactionEvent": true,
            "balance": "1399418754307",
            "holdingType": "UNCONFIRMED_COIN_BALANCE",
            "accountRS": "ARDOR-XK2L-Z7NK-VNKM-AZYVT",
            "block": "7794716992135705008",
            "event": "14821434902807550708",
            "account": "10155581947047232530",
            "height": 291612,
            "timestamp": 17312462
        }
    ],
    "requestProcessingTime": 1
]
```

The GetAccountLedger API will return entries from the account ledger. The account ledger tracks all account changes as determined by the nxt.ledgerAccounts, nxt.ledgerLogUnconfirmed and nxt.ledgerTrimKeep properties.

`GET http://localhost:27876/nxt?requestType=getAccountLedger&account=<Account>...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('firstIndex', 'optional') %>
<%= getParameter('lastIndex', 'optional') %>
<%= getParameter('event', 'optional') %>
<%= getParameter('eventType', 'optional') %>
<%= getParameter('holdingType', 'optional') %>
<%= getParameter('holding', 'optional') %>
<%= getParameter('includeTransactions', 'optional') %>
<%= getParameter('includeHoldingInfo', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>


### GetAccountLedgerEntry
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountLedgerEntry&ledgerId=119533"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    ledgerId : "119533"
};
ardor.sendRequest("getAccountLedgerEntry", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
    {
        "holdingTypeIsUnconfirmed": true,
        "chain": 1,
        "change": "250000",
        "holdingTypeCode": 1,
        "eventType": "BLOCK_GENERATED",
        "requestProcessingTime": 0,
        "ledgerId": "119533",
        "holding": "1",
        "isTransactionEvent": false,
        "balance": "4000397523847250",
        "holdingType": "UNCONFIRMED_COIN_BALANCE",
        "accountRS": "ARDOR-8ZW9-BEW7-8QHM-2F67L",
        "block": "7794716992135705008",
        "event": "7794716992135705008",
        "account": "654303200082624391",
        "height": 291612,
        "timestamp": 17312462
    }
]
```

The GetAccountLedgerEntry API will return an entry from the account ledger. The account ledger tracks all account changes as determined by the nxt.ledgerAccounts, nxt.ledgerLogUnconfirmed and nxt.ledgerTrimKeep properties.

`GET http://localhost:27876/nxt?requestType=getAccountLedgerEntry&account=<LedgerId>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('ledgerId', 'required') %>
<%= getParameter('includeTransaction', 'optional') %>
<%= getParameter('includeHoldingInfo', 'optional') %>

### GetAccountAssetCount
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountAssetCount&account=ARDOR-APM5-TLV8-J3KY-6T3JG"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-APM5-TLV8-J3KY-6T3JG"
};
ardor.sendRequest("getAccountAssetCount", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
    {
        "requestProcessingTime": 0,
        "numberOfAssets": 1
    }
]
```

Get the number of assets owned by an account given the account ID

`GET http://localhost:27876/nxt?requestType=getAccountAssetCount&account=<Account>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountAssets
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```


Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>

### GetAccountBlockCount
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountBlockIds
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountBlocks
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrencyCount
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrencies
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountLessors
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountPhasedTransactionCount
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountPhasedTransactions
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetUnconfirmedTransactionIds
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetUnconfirmedTransactions
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### SetAccountInfo
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```


Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Balances

### GetBalance
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetBalances
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetGuaranteedBalance
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetEffectiveBalance
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### sendMoney
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```


Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Trades

### GetAccountCurrentAskOrderIds
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrentAskOrders
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrentBidOrderIds
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrentBidOrders
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountExchangeRequests
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Activity


### getCurrenciesByIssuer
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAssetsByIssuer
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetBlockchainTransactions
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>

   
## Account Votes

### GetPolls
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetVoterPhasedTransactions  
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Funding

### GetFundingMonitor
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### startFundingMonitor   
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### stopFundingMonitor  
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Properties

### GetAccountProperties
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### SetAccountProperty
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### deleteAccountProperty
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```


Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Util functions

### rsConvert
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### searchAccounts
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>