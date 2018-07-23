# Accounts

This chapter focuses on all API calls that can help you interact identify an account and many other actions including: sending Ardor to an account, getting his balances, or more advanced interactions like properties and control features.


## Account Information

The set of API calls bellow allow you to request many informations about an account.

### getAccountId

> The request:

```shell
curl "http://localhost:27876/nxt?requestType=getAccountId&publicKey=7cca421cdb6b6210ce47e058734b364c5f6e13173c16a6bcccd01bab549b0f3e"
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    publicKey: "7cca421cdb6b6210ce47e058734b364c5f6e13173c16a6bcccd01bab549b0f3e"
};
ardor.sendRequest("getAccountId", data, function (response) {
    ardor.logConsole("Account id is:" + JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
    {
        "accountRS": "ARDOR-XK2L-Z7NK-VNKM-AZYVT",
        "publicKey": "7cca421cdb6b6210ce47e058734b364c5f6e13173c16a6bcccd01bab549b0f3e",
        "requestProcessingTime": 0,
        "account": "10155581947047232530"
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


### getAccountPublicKey 
dsfqsdqdsfqdsfvqsdfqcvsdgcrtvghsc

### getAccountLedger   
dsfqsdqdsfqdsfvqsdfqcvsdgcrtvghsc

### getAccountLedgerEntry
dsfqsdqdsfqdsfvqsdfqcvsdgcrtvghsc

### getAccountAssetCount    
### getAccountAssets   
### getAccountBlockCount   
### getAccountBlockIds   
### getAccountBlocks 
### getAccountCurrencyCount  
### getAccountCurrencies   
### getAccountLessors   
### getAccountPhasedTransactionCount   
### getAccountPhasedTransactions
### getUnconfirmedTransactionIds   
### getUnconfirmedTransactions  
### setAccountInfo

## Account Balances

### getBalance   
### getBalances
### getGuaranteedBalance
### getEffectiveBalance  
### sendMoney

## Account Trades

### getAccountCurrentAskOrderIds   
### getAccountCurrentAskOrders   
### getAccountCurrentBidOrderIds   
### getAccountCurrentBidOrders   
### getAccountExchangeRequests   


## Account Activity


### getCurrenciesByIssuer   
### getAssetsByIssuer   
### getBlockchainTransactions   
   
## Account Votes

### getPolls
### getVoterPhasedTransactions  

## Account Funding

### getFundingMonitor
### startFundingMonitor   
### stopFundingMonitor  

## Account Properties

### getAccountProperties
### setAccountProperty
### deleteAccountProperty

## Account Util functions

### rsConvert   
### searchAccounts