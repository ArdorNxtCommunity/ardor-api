# Accounts

This chapter focuses on all API calls that can help you interact identify an account and many other actions including: sending Ardor to an account, getting his balances, or more advanced interactions like properties and control features.


## Account Information

The set of API calls bellow allow you to request many informations about an account.

### GetAccountId

> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "publicKey=f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a" "http://localhost:27876/nxt?requestType=getAccountId"
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

`POST http://localhost:27876/nxt?requestType=getAccountId&publicKey=<PublicKEY>`

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
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-8MVA-XCVR-3JC9-2C7C3" "http://localhost:27876/nxt?requestType=getAccountPublicKey"
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

`POST http://localhost:27876/nxt?requestType=getAccountPublicKey&account=<AccountID>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountLedger

> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-XK2L-Z7NK-VNKM-AZYVT" "http://localhost:27876/nxt?requestType=getAccountLedger"
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

`POST http://localhost:27876/nxt?requestType=getAccountLedger&account=<Account>...`

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
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "ledgerId=119533" "http://localhost:27876/nxt?requestType=getAccountLedgerEntry"
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

`POST http://localhost:27876/nxt?requestType=getAccountLedgerEntry&account=<LedgerId>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('ledgerId', 'required') %>
<%= getParameter('includeTransaction', 'optional') %>
<%= getParameter('includeHoldingInfo', 'optional') %>

### GetAccountAssetCount
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-APM5-TLV8-J3KY-6T3JG" "http://localhost:27876/nxt?requestType=getAccountAssetCount"
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

`POST http://localhost:27876/nxt?requestType=getAccountAssetCount&account=<Account>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountAssets
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-APM5-TLV8-J3KY-6T3JG&includeAssetInfo=true" "http://localhost:27876/nxt?requestType=getAccountAssets"
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

`POST http://localhost:27876/nxt?requestType=getAccountAssets&account=<Account>`

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
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-58JH-YGLD-DG25-CRVXC" "http://localhost:27876/nxt?requestType=getAccountBlockCount"
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

`POST http://localhost:27876/nxt?requestType=getAccountBlockCount&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>


### GetAccountBlockIds
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-58JH-YGLD-DG25-CRVXC" "http://localhost:27876/nxt?requestType=getAccountBlockIds"
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

`POST http://localhost:27876/nxt?requestType=getAccountBlockIds&account<Account>`

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
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-58JH-YGLD-DG25-CRVXC" "http://localhost:27876/nxt?requestType=getAccountBlocks"
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

`POST http://localhost:27876/nxt?requestType=getAccountBlocks&account=<Account>`

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
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-VS8T-QYQS-SK9H-5BYBB" "http://localhost:27876/nxt?requestType=getAccountCurrencyCount"
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

`POST http://localhost:27876/nxt?requestType=getAccountCurrencyCount&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountCurrencies
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-VS8T-QYQS-SK9H-5BYBB&includeCurrencyInfo=true" "http://localhost:27876/nxt?requestType=getAccountCurrencies"
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

`POST http://localhost:27876/nxt?requestType=getAccountCurrencies&account=<Account>`

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
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-VS8T-QYQS-SK9H-5BYBB" "http://localhost:27876/nxt?requestType=getAccountLessors"
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

`POST http://localhost:27876/nxt?requestType=getAccountLessors&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required') %>
<%= getParameter('height', 'optional') %>
<%= getParameter('requireBlock', 'optional') %>
<%= getParameter('requireLastBlock', 'optional') %>

### GetAccountPhasedTransactionCount
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "chain=2&account=ARDOR-VS8T-QYQS-SK9H-5BYBB" "http://localhost:27876/nxt?requestType=getAccountPhasedTransactionCount"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain : "2",
    account : "ARDOR-VS8T-QYQS-SK9H-5BYBB"
};
ardor.sendRequest("getAccountPhasedTransactionCount", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "requestProcessingTime": 0,
    "numberOfPhasedTransactions": 0
}
```

Get the number of pending phased transactions associated with an account given the account ID.

`POST http://localhost:27876/nxt?requestType=getAccountPhasedTransactionCount&chain=<ChainId>&account=<Account>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('chain', 'required', '') %>
<%= getParameter('account', 'required', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>

### GetAccountPhasedTransactions
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "chain=2&account=ARDOR-VS8T-QYQS-SK9H-5BYBB" "http://localhost:27876/nxt?requestType=getAccountPhasedTransactions"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain : "2",
    account : "ARDOR-VS8T-QYQS-SK9H-5BYBB"
};
ardor.sendRequest("getAccountPhasedTransactions", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "requestProcessingTime": 0,
    "transactions": []
}
```

Get pending phased transactions associated with an account given the account ID in reverse chronological creation order.

`POST http://localhost:27876/nxt?requestType=getAccountPhasedTransactions&chain=<ChainId>&account=<Account>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('chain', 'required', '') %>
<%= getParameter('account', 'required', '') %>
<%= getParameter('firstIndex', 'optional', '') %>
<%= getParameter('lastIndex', 'optional', '') %>
<%= getParameter('adminPassword', 'optional', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>

### GetUnconfirmedTransactionIds
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "chain=2&account=ARDOR-HWZW-5TT6-U68F-H26L8&account=ARDOR-492G-A5YD-FUGZ-C6N2B" "http://localhost:27876/nxt?requestType=getUnconfirmedTransactionIds"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain : "2",
    account : "ARDOR-HWZW-5TT6-U68F-H26L8",
    account : "ARDOR-492G-A5YD-FUGZ-C6N2B"
};
ardor.sendRequest("getUnconfirmedTransactionIds", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "requestProcessingTime": 1,
    "unconfirmedTransactionIds": [
        "7939835860691128054"
    ]
}
```

Get a list of unconfirmed transaction IDs associated with an account.

`POST http://localhost:27876/nxt?requestType=getUnconfirmedTransactionIds&chain=2&account=<Account1>&account=<Account2>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('chain', 'required', '') %>
<%= getParameter('account', 'optional', 'First account to monitor.') %>
<%= getParameter('account', 'optional', 'Second account to monitor.') %>
<%= getParameter('account', 'optional', 'Third account to monitor, you can add as many accounts as you want.') %>
<%= getParameter('firstIndex', 'optional', '') %>
<%= getParameter('lastIndex', 'optional', '') %>
<%= getParameter('adminPassword', 'optional', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>

### GetUnconfirmedTransactions
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "chain=2&account=ARDOR-HWZW-5TT6-U68F-H26L8&account=ARDOR-492G-A5YD-FUGZ-C6N2B" "http://localhost:27876/nxt?requestType=getUnconfirmedTransactions"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain : "2",
    account : "ARDOR-HWZW-5TT6-U68F-H26L8",
    account : "ARDOR-492G-A5YD-FUGZ-C6N2B"
};
ardor.sendRequest("getUnconfirmedTransactions", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "unconfirmedTransactions": [
        {
            "senderPublicKey": "5b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c27",
            "isBundled": true,
            "chain": 2,
            "signature": "c8edc854fe2fba9d1b95fc81b006dffa4b1ab041eeb1d26ef217bbdd14002406d8a4851d15ebc6893de25b1fcee3cca88a400c898153202a6251eb80c3acea5f",
            "feeNQT": "10000",
            "type": 0,
            "fullHash": "1f007e0ee4675228e4b1ff50def20403f46a1d7fb2ec7dc8271b38b8a12bae3d",
            "version": 1,
            "fxtTransaction": "0",
            "phased": false,
            "ecBlockId": "2329106975025976796",
            "signatureHash": "025c171e9d1d80b4ad5cabc836cb48aed050ed8764dcdec4f0e32f8d2ca050de",
            "attachment": {
                "version.OrdinaryPayment": 0
            },
            "senderRS": "ARDOR-HWZW-5TT6-U68F-H26L8",
            "subtype": 0,
            "amountNQT": "500000000",
            "sender": "17530402417794348028",
            "recipientRS": "ARDOR-492G-A5YD-FUGZ-C6N2B",
            "recipient": "11854182583844805646",
            "ecBlockHeight": 230000,
            "deadline": 15,
            "timestamp": 19115098,
            "height": 2147483647
        }
    ],
    "requestProcessingTime": 0
}
```

Get a list of unconfirmed transactions associated with an account.

`POST http://localhost:27876/nxt?requestType=getUnconfirmedTransactions&chain=2&account=<Account1>&account=<Account2>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('chain', 'required', '') %>
<%= getParameter('account', 'optional', 'First account to monitor.') %>
<%= getParameter('account', 'optional', 'Second account to monitor.') %>
<%= getParameter('account', 'optional', 'Third account to monitor, you can add as many accounts as you want.') %>
<%= getParameter('firstIndex', 'optional', '') %>
<%= getParameter('lastIndex', 'optional', '') %>
<%= getParameter('adminPassword', 'optional', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>



### SetAccountInfo
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "chain=2&name=ArdorCommunity&description=Test+SetAccountInfo&publicKey=5b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c27&passPhrase=xxxxxxxxxx" "http://localhost:27876/nxt?requestType=setAccountInfo"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain : "2",
    name : "ArdorCommunity",
    description : "Test SetAccountInfo",
    secretPhrase : "xxxxxxxxxx",
    publicKey : "5b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c27"

};
ardor.sendRequest("setAccountInfo", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "minimumFeeFQT": "200000000",
    "signatureHash": "5ece8129f69c513c9117a1217358fedd5ff3834028e9cf8582cd5a7b9759c38c",
    "transactionJSON": {
        "senderPublicKey": "5b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c27",
        "chain": 2,
        "signature": "3db02a823ead11afa82b20cd2c97451967808d05037cb32b4b0914866f9daa00854691662776178cbe79abf2d05ed27af3553e6911393a22d24e657a8c5c4006",
        "feeNQT": "200000000",
        "type": 10,
        "fullHash": "764e5f9da83f24742a664465465762726b979c351d9ee4d2fba93f9d00748876",
        "version": 1,
        "fxtTransaction": "0",
        "phased": false,
        "ecBlockId": "9132963265459034843",
        "signatureHash": "5ece8129f69c513c9117a1217358fedd5ff3834028e9cf8582cd5a7b9759c38c",
        "attachment": {
            "name": "ArdorCommunity",
            "description": "Test SetAccountInfo",
            "version.AccountInfo": 1
        },
        "senderRS": "ARDOR-HWZW-5TT6-U68F-H26L8",
        "subtype": 0,
        "amountNQT": "0",
        "sender": "17530402417794348028",
        "ecBlockHeight": 321182,
        "deadline": 15,
        "timestamp": 19116494,
        "height": 2147483647
    },
    "unsignedTransactionBytes": "020000000a0001ceb123010f005b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c270000000000000000000000000000000000c2eb0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009ee60400db9a6090b3cdbe7e00000000010e4172646f72436f6d6d756e697479130054657374205365744163636f756e74496e666f000000000000000000000000000000000000000000000000000000000000000000000000",
    "broadcasted": true,
    "requestProcessingTime": 6,
    "transactionBytes": "020000000a0001ceb123010f005b3bd8d211c2c792b75e1840ca4af4ba3aa8e5c5dc5ee5487af29766789b5c270000000000000000000000000000000000c2eb0b000000003db02a823ead11afa82b20cd2c97451967808d05037cb32b4b0914866f9daa00854691662776178cbe79abf2d05ed27af3553e6911393a22d24e657a8c5c40069ee60400db9a6090b3cdbe7e00000000010e4172646f72436f6d6d756e697479130054657374205365744163636f756e74496e666f000000000000000000000000000000000000000000000000000000000000000000000000",
    "fullHash": "764e5f9da83f24742a664465465762726b979c351d9ee4d2fba93f9d00748876"
}
```

Set account information. POST only.
This call inherit from Create Transaction Request, thus it also inherit all its parameters but they are optional.

`POST http://localhost:27876/nxt?requestType=setAccountInfo&chain=<Chain>&name=<Name>&description=<Description>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('chain', 'required', '') %>
<%= getParameter('name', 'optional', '') %>
<%= getParameter('description', 'optional', '') %>
<%= getParameter('secretPhrase', 'optional', 'It\'s optional, but needed for broadcasting') %>
<%= getParameter('publicKey', 'optional', 'If secretPhrase is not set than it\'s required') %>
<%= getParameter('feeNQT', 'optional', 'If not specified, the response will provide the minimal fee that should be included.') %>

Additional common parameters are given in the Create Transaction Call.

## Account Balances

### GetBalance
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "chain=2&account=ARDOR-HWZW-5TT6-U68F-H26L8" "http://localhost:27876/nxt?requestType=getBalance"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain :  "2",
    account : "ARDOR-HWZW-5TT6-U68F-H26L8"
};
ardor.sendRequest("getBalance", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "unconfirmedBalanceNQT": "3496611077300",
    "balanceNQT": "3496611077300",
    "requestProcessingTime": 0
}
```

Get the balance of an account.

`POST http://localhost:27876/nxt?requestType=getBalance&chain=<Chain>&account=<Account>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('chain', 'required', '') %>
<%= getParameter('account', 'required', '') %>
<%= getParameter('height', 'optional', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>

### GetBalances
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-HWZW-5TT6-U68F-H26L8&chain=1&chain=2&chain=3" "http://localhost:27876/nxt?requestType=getBalances"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain :  ["1", "2", "3"],
    account : "ARDOR-HWZW-5TT6-U68F-H26L8"
};
ardor.sendRequest("getBalances", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "balances": {
        "1": {
            "unconfirmedBalanceNQT": "975883500000",
            "balanceNQT": "975883500000"
        },
        "2": {
            "unconfirmedBalanceNQT": "3496611077300",
            "balanceNQT": "3496611077300"
        },
        "3": {
            "unconfirmedBalanceNQT": "0",
            "balanceNQT": "0"
        }
    },
    "requestProcessingTime": 1
}
```

Get the balance of an account on different childchain. You need to specify at least one chain id.

`POST http://localhost:27876/nxt?requestType=getBalances&account<Account>&chain=<Chain>&chain=<Chain>&chain=<Chain>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required', '') %>
<%= getParameter('chain', 'required', '') %>
<%= getParameter('chain', 'optional', '') %>
<%= getParameter('chain', 'optional', '') %>
<%= getParameter('chain', 'optional', '') %>
<%= getParameter('height', 'optional', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>

### GetGuaranteedBalance
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-HWZW-5TT6-U68F-H26L8&numberOfConfirmations=10" "http://localhost:27876/nxt?requestType=getGuaranteedBalance"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-HWZW-5TT6-U68F-H26L8",
    numberOfConfirmations : "10"
};
ardor.sendRequest("getGuaranteedBalance", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "guaranteedBalanceNQT": "975883500000",
    "requestProcessingTime": 1
}
```

Get the balance of an account that is confirmed at least a specified number of blocks in the past.

`POST http://localhost:27876/nxt?requestType=getGuaranteedBalance&account=<Account>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required', '') %>
<%= getParameter('numberOfConfirmations', 'optional', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>

### GetEffectiveBalance
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "account=ARDOR-HWZW-5TT6-U68F-H26L8" "http://localhost:27876/nxt?requestType=getEffectiveBalance"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    account : "ARDOR-HWZW-5TT6-U68F-H26L8"
};
ardor.sendRequest("", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "forgedBalanceFQT": "0",
    "guaranteedBalanceFQT": "975883500000",
    "effectiveBalanceFXT": 9758,
    "requestProcessingTime": 1
}
```

Get the Effective balance of an account.
The effective balance is used to compute the forging probability of an account, and it refers to the stable balance of an account during the last 24h or 1440 blocks.

`POST http://localhost:27876/nxt?requestType=getEffectiveBalance&account=<Account>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('account', 'required', '') %>
<%= getParameter('height', 'optional', '') %>
<%= getParameter('requireBlock', 'optional', '') %>
<%= getParameter('requireLastBlock', 'optional', '') %>


### SendMoney
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "chain=2&recipient=ARDOR-HWZW-5TT6-U68F-H26L8&amountNQT=1000000000&publicKey=f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a" "http://localhost:27876/nxt?requestType=sendMoney"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    chain : "2",//Ignis
    recipient : "ARDOR-HWZW-5TT6-U68F-H26L8",
    amountNQT : "1000000000",// 1 Ignis = 10^8 NQT, here 10 Ignis
    publicKey : "f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a"//publicKey of the sender
};
ardor.sendRequest("sendMoney", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
{
    "minimumFeeFQT": "1000000",
    "transactionJSON": {
        "senderPublicKey": "f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0a",
        "chain": 2,
        "feeNQT": "10000",
        "type": 0,
        "version": 1,
        "fxtTransaction": "0",
        "phased": false,
        "ecBlockId": "4227293255025921221",
        "attachment": {
            "version.OrdinaryPayment": 0
        },
        "senderRS": "ARDOR-8MVA-XCVR-3JC9-2C7C3",
        "subtype": 0,
        "amountNQT": "1000000000",
        "sender": "47475721164246888",
        "recipientRS": "ARDOR-HWZW-5TT6-U68F-H26L8",
        "recipient": "17530402417794348028",
        "ecBlockHeight": 324627,
        "deadline": 15,
        "timestamp": 19323665,
        "height": 2147483647
    },
    "unsignedTransactionBytes": "0200000000000111db26010f00f3831afb0cfbaca8e9fca6523d0b23d14aa2e6f9ac1726f12c30acd4d622bb0afcf347721e8048f300ca9a3b0000000010270000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013f40400c58c397bd15caa3a00000000000000000000000000000000000000000000000000000000000000000000000000000000",
    "broadcasted": false,
    "requestProcessingTime": 2,
    "bundlerRateNQTPerFXT": "1000000"
}
```

Send a coin (ARDR, Ignis, Bitswift, AEUR, ...) to an account. POST only.
The coin to be sent is determined by its chain Id:
Coin Name | Chain Id
--------- | --------
ARDR | 1
Ignis | 2
Bitswift | 3
AEUR | 4
... | ...

`POST http://localhost:27876/nxt?requestType=sendMoney&chain=<Chain>&recipient=<Recipient>&amountNQT=<Amount>&...`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('chain', 'required', '') %>
<%= getParameter('recipient', 'required', '') %>
<%= getParameter('amountNQT', 'required', '') %>
<%= getParameter('secretPhrase', 'optional', 'If not specified, publicKey has to be, then the response will be an unsigned transaction and will not be broadcasted.') %>
<%= getParameter('publicKey', 'optional', 'required if secretPhrase is not provided.') %>
<%= getParameter('feeNQT', 'optional', 'If not specified, the response will provide the minimal fee that should be included.') %>

Additional common parameters are given in the Create Transaction Call.

<aside class="notice">
In the example given, we do not provide secretPhrase of the sender, thus a unisgned transaction will created and should be signed later by the sender. This opens usage to Offline signing, Voucher claiming, Escrow services... etc.
</aside>

## Account Trades

### GetAccountCurrentAskOrderIds
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getAccountCurrentAskOrderIds"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getAccountCurrentAskOrderIds", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Get current asset order IDs given an account ID in reverse block height order.

`POST http://localhost:27876/nxt?requestType=getAccountCurrentAskOrderIds`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrentAskOrders
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getAccountCurrentAskOrders"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getAccountCurrentAskOrders", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getAccountCurrentAskOrders`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrentBidOrderIds
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getAccountCurrentBidOrderIds"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getAccountCurrentBidOrderIds", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getAccountCurrentBidOrderIds`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountCurrentBidOrders
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getAccountCurrentBidOrders"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getAccountCurrentBidOrders", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getAccountCurrentBidOrders`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAccountExchangeRequests
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getAccountExchangeRequests"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getAccountExchangeRequests", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getAccountExchangeRequests`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Activity

### GetCurrenciesByIssuer

> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType= getCurrenciesByIssuer"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest(" getCurrenciesByIssuer", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType= getCurrenciesByIssuer`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetAssetsByIssuer
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getAssetsByIssuer"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getAssetsByIssuer", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getAssetsByIssuer`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetBlockchainTransactions
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType="
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

`POST http://localhost:27876/nxt?requestType=`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>

   
## Account Votes

### GetPolls
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getPolls"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getPolls", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getPolls`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### GetVoterPhasedTransactions  
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getVoterPhasedTransactions"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getVoterPhasedTransactions", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getVoterPhasedTransactions`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Funding

### GetFundingMonitor
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getFundingMonitor"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getFundingMonitor", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getFundingMonitor`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### StartFundingMonitor   
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=startFundingMonitor"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("startFundingMonitor", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=startFundingMonitor`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### StopFundingMonitor  
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=stopFundingMonitor"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("stopFundingMonitor", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=stopFundingMonitor`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Properties

### GetAccountProperties
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=getAccountProperties"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("getAccountProperties", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=getAccountProperties`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### SetAccountProperty
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=setAccountProperty"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("setAccountProperty", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=setAccountProperty`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### DeleteAccountProperty
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=deleteAccountProperty"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("deleteAccountProperty", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```


Call Description

`POST http://localhost:27876/nxt?requestType=deleteAccountProperty`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


## Account Util functions

### RsConvert
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "" "http://localhost:27876/nxt?requestType=rsConvert"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("rsConvert", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=rsConvert`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>


### SearchAccounts
> The request:

```shell
curl -X POST -d "" "http://localhost:27876/nxt?requestType=searchAccounts" -k -H "Content-Type: application/x-www-form-urlencoded"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    
};
ardor.sendRequest("searchAccounts", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
```

Call Description

`POST http://localhost:27876/nxt?requestType=searchAccounts`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>
<%= getParameter('', '', '') %>