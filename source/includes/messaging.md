# Decentralized Messaging

Messages is a way for Ardor accounts to exchange information or data over the blockchain without using a secondary channel. The messages can be encrypted and are prunable from the blockchain history.

The base implementation allows for the transmission of simple, unencrypted text messages between accounts, but since the messages are truly "arbitrary" the range of possible applications is vast. Secure messaging, torrent applications, voting systems, data storage systems and even simple distributed applications have been suggested.

## Send & Read
### sendMessage 
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


### readMessage 
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



## Encrypted Messages
### encryptTo 
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


### decryptFrom
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


### getSharedKey
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



## Prunable Messages
### getAllPrunableMessages 
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


### getPrunableMessages 
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


### getPrunableMessage 
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


### downloadPrunableMessage 
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


### verifyPrunableMessage
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


