# Account Control

Account control API calls allow you to apply different controls over your account like phasing, multiSig approvals or max spending limits.

## Set Controls
### leaseBalance 
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


### setPhasingOnlyControl 
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



## View Controls
### getAllPhasingOnlyControls   
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


### getPhasingOnlyControl   
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
