# Forging

In Proof-of-Stake consensus algorithms, Forging is the process of building and validating transaction blocks, which equivalent to Mining in Proof-of-Work, with the exception that forgers are rewarded only from transaction fees and there is no new generation of forging coin (ARDR is this case).

The API calls below allow you to 

## Forge & Bundle
### leaseBalance
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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


### startForging
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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


### stopForging
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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


### startBundler
> The request:

```shell
curl "http://localhost:27876/nxt?requestType="
```

```javascript
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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
var ardor = require('ardor-blockchain');

ardor.init(config);

ardor.load(function(NRS) {
    var data = {
        
    };
    NRS.sendRequest("", data, function (response) {
        NRS.logConsole("Response is:" + JSON.stringify(response));
    });
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

