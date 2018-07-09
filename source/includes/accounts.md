# Accounts

In this chapter we focus on all the API calls that can help you interact with an account, this can include sending Ardor to this account, getting his balances, or more advanced interactions like properties and control features.


## Account Information

### getAccountId
### getAccountPublicKey 
### getAccountLedger   
### getAccountLedgerEntry
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