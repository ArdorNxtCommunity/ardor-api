# Coin Exchange

The Coin Exchange feature is specific to Ardor architecture. 
Indeed, Ardor is based on the Parent-ChildChain architecture, thus the parent chain have its own coin ARDR, and each childchain have its own coin too, like IGNIS, BITSWIFT, AEUR ...etc. The coin exchange allow users to exchange chilchain coins against the ARDR parent chain coin without going throw an   exeternal exchange.

The API calls below help you achieve this.

## Orders Setting
### exchangeCoins    
### cancelCoinExchange

## Orders Discovery
### getCoinExchangeOrders
### getCoinExchangeOrderIds    
### getCoinExchangeOrder    
### getCoinExchangeTrades    
### getCoinExchangeTrade    
### getExpectedCoinExchangeOrders    
### getExpectedCoinExchangeOrderCancellations    
### simulateCoinExchange