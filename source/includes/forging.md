# Forging

In Proof-of-Stake consensus algorithms, Forging is the process of building and validating transaction blocks, which equivalent to Mining in Proof-of-Work, with the exception that forgers are rewarded only from transaction fees and there is no new generation of forging coin (ARDR is this case).

The API calls below allow you to 

## Forge & Bundle
### leaseBalance
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d 'secretPhrase=INSERT PASSPHRASE HERE&period=1440&recipient=ARDOR-8MVA-XCVR-3JC9-2C7C3' http://localhost:27876/nxt?requestType=leaseBalance
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    secretPhrase=INSERT PASSPHRASE HERE,
    period: "1440",
    recipient: "ARDOR-8MVA-XCVR-3JC9-2C7C3",
};
ardor.sendRequest("leaseBalance", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`POST http://localhost:27876/nxt?requestType=leaseBalance&period=<Period>&recipient=<Recipient>`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('secretPhrase', 'required', 'The secret passphrase of the account') %>
<%= getParameter('feeNQT', 'optional', 'Fee (in NQT) for the transaction.  Auto calculated if left blank') %>
<%= getParameter('deadline', 'optional', 'Deadline (in minutes) for the transaction to be confirmed, 32767 minutes maximum and 1440 is the default of parent chain, 15 for child chains') %>
<%= getParameter('period', 'required', 'The lease period (in number of blocks, 1440 minimum)') %>
<%= getParameter('recipient', 'required', '') %>
<%= getParameter('recipientPublicKey', 'optional, enhances security of a new account', '') %>


### startForging
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d 'secretPhrase=INSERT PASSPHRASE HERE' http://localhost:27876/nxt?requestType=startForging
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    secretPhrase: "INSERT PASSPHRASE HERE",
};
ardor.sendRequest("startForging", data, function (response) {
    ardor.logConsole(JSON.stringify(response));
});
```

> The above request returns the following JSON structured response:

```json
[
]
```

Call Description

`POST http://localhost:27876/nxt?requestType=startForging`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('secretPhrase', 'required', 'The secret passphrase of the account') %>


### stopForging
> The request:

```shell
curl -k -H "Content-Type: application/x-www-form-urlencoded" -X POST -d 'secretPhrase=INSERT PASSPHRASE HERE' http://localhost:27876/nxt?requestType=stopForging
```

```javascript
// The ardor-blockchain npm package is still on deployement stage
var ardor = require('ardor-blockchain');

var data = {
    secretPhrase: "INSERT PASSPHRASE HERE",
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

`POST http://localhost:27876/nxt?requestType=stopForging`

Parameter | Type | Description
--------- | ---- | -----------
<%= getParameter('secretPhrase', 'required', 'The secret passphrase of the account') %>


### startBundler
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


### stopBundler
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



## Forgers 
### getBundlers
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


### getAllBundlerRates
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


### getBundlerRates
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


### getForging
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


### blacklistBundler
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


### bundleTransactions
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


### getGuaranteedBalance
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


### getNextBlockGenerators
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

