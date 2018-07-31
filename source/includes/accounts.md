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
{
    "accountRS": "ARDOR-8MVA-XCVR-3JC9-2C7C3",
    "publicKey": "f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a",
    "requestProcessingTime": 1,
    "account": "47475721164246888"
}
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
{
    "publicKey": "f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a",
    "requestProcessingTime": 0
}
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
{
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
}
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
{
    "requestProcessingTime": 0,
    "numberOfAssets": 1
}
```

Get the number of assets owned by an account given the account ID.

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
curl "http://localhost:27876/nxt?requestType=getAccountAssets&account=ARDOR-APM5-TLV8-J3KY-6T3JG&includeAssetInfo=true"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-APM5-TLV8-J3KY-6T3JG",
    includeAssetInfo : "true"
};
ardor.sendRequest("getAccountAssets", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "accountAssets": [
        {
            "quantityQNT": "50000000",
            "unconfirmedQuantityQNT": "45000000",
            "decimals": 2,
            "name": "PeterTest",
            "asset": "10260918643336798387"
        }
    ],
    "requestProcessingTime": 0
}
```

Get the assets owned by a given account in reverse quantity order.

`GET http://localhost:27876/nxt?requestType=getAccountAssets&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('asset', 'optional') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('includeAssetInfo', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountBlockCount
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountBlockCount&account=ARDOR-58JH-YGLD-DG25-CRVXC"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-58JH-YGLD-DG25-CRVXC"
};
ardor.sendRequest("getAccountBlockCount", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "numberOfBlocks": 39820,
    "requestProcessingTime": 19
}
```

Get the number of blocks forged by an account.

`GET http://localhost:27876/nxt?requestType=getAccountBlockCount&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>


### GetAccountBlockIds
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountBlockIds&account=ARDOR-58JH-YGLD-DG25-CRVXC"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-58JH-YGLD-DG25-CRVXC"
};
ardor.sendRequest("getAccountBlockIds", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "blockIds": [
        "7409020034992101127",
        "13666155946130133077",
        "4975664708626217006",
        "2199995861210647044",
        "6521768284282833921",
        "5504690544075001287",
        "8762183737529636830",
        "15988735212005877218",
        "17493377939700851941",
        "12852214148045438169",
        "10731698312306022748",
        "15713302678722688366",
        ...
    ]
}
```

Get the block IDs of all blocks forged (generated) by an account in reverse block height order,

`GET http://localhost:27876/nxt?requestType=getAccountBlockIds&account<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('timestamp', 'optional') %>
<%= getParameter('firstIndex', 'optional') %>
<%= getParameter('lastIndex', 'optional') %>
<%= getParameter('adminPassword', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountBlocks
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountBlocks&account=ARDOR-58JH-YGLD-DG25-CRVXC"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-58JH-YGLD-DG25-CRVXC"
};
ardor.sendRequest("getAccountBlocks", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "blocks": [
        {
            "previousBlockHash": "442815b217f5968e9aff697124306d0c46d3f54a16e6202790673f7f0e4d3397",
            "generationSignature": "093adf3623af440118ce29a06412e731418538fae717366a1cc9591967cb13f8",
            "generator": "11923130426810538511",
            "generatorPublicKey": "bfbce25fe31e375c1784ef932cdd9daf8f4635e25092ea4cb60d15e220d06a1d",
            "baseTarget": "875595407",
            "payloadHash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
            "generatorRS": "ARDOR-58JH-YGLD-DG25-CRVXC",
            "nextBlock": "3484461649184375611",
            "numberOfTransactions": 0,
            "blockSignature": "1e472bfbd0431ea3537a574ad82a77bed533fff5890e09af14b03c8bd182fd0158a8a6702b0c6bf642a08f970b6ee7fb4caa5694d8ebb83f625dd703e5fd4fc6",
            "transactions": [],
            "version": 3,
            "previousBlock": "10274669082013149252",
            "cumulativeDifficulty": "32260533261737103",
            "totalFeeFQT": "0",
            "block": "7409020034992101127",
            "height": 315152,
            "timestamp": 18717512
        },
        ...
    ]
}
```

Get all blocks forged (generated) by an account in reverse block height order.

`GET http://localhost:27876/nxt?requestType=getAccountBlocks&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('timestamp', 'optional') %>
<%= getParameter('firstIndex', 'optional') %>
<%= getParameter('lastIndex', 'optional') %>
<%= getParameter('includeTransactions', 'optional') %>
<%= getParameter('adminPassword', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountCurrencyCount
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountCurrencyCount&account=ARDOR-VS8T-QYQS-SK9H-5BYBB"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-VS8T-QYQS-SK9H-5BYBB"
};
ardor.sendRequest("getAccountCurrencyCount", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "numberOfCurrencies": 1,
    "requestProcessingTime": 0
}
```

Get the number of currencies issued by a given account.

`GET http://localhost:27876/nxt?requestType=getAccountCurrencyCount&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountCurrencies
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountCurrencies&account=ARDOR-VS8T-QYQS-SK9H-5BYBB&includeCurrencyInfo=true"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-VS8T-QYQS-SK9H-5BYBB",
    includeCurrencyInfo : "true"
};
ardor.sendRequest("getAccountCurrencies", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "accountCurrencies": [
        {
            "chain": 2,
            "issuerAccountRS": "ARDOR-VS8T-QYQS-SK9H-5BYBB",
            "unitsQNT": "700000000",
            "code": "TPET",
            "unconfirmedUnitsQNT": "700000000",
            "decimals": 3,
            "name": "TestPet",
            "currency": "8973592331691074726",
            "issuanceHeight": 0,
            "type": 35,
            "issuerAccount": "3794223001810886873"
        }
    ],
    "requestProcessingTime": 0
}
```

Get the currencies issued by a given account.

`GET http://localhost:27876/nxt?requestType=getAccountCurrencies&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('currency', 'optional') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('includeCurrencyInfo', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>



### GetAccountLessors
> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountLessors&account=ARDOR-VS8T-QYQS-SK9H-5BYBB"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-VS8T-QYQS-SK9H-5BYBB"
};
ardor.sendRequest("getAccountLessors", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "lessors": [],
    "accountRS": "ARDOR-VS8T-QYQS-SK9H-5BYBB",
    "requestProcessingTime": 0,
    "account": "3794223001810886873",
    "height": 315183
}
```

Get the lessors (accounts leasing their forging balance) to an account.

`GET http://localhost:27876/nxt?requestType=getAccountLessors&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

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
```

Call Description

`GET http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>