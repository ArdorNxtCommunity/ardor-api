---
title: Ardor API Reference
favicon: images/ardor-favicon.png
logo: images/logo.png

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL
  - javascript: JavaScript

toc_footers:
  - <a href='#'>Ardor API Documentation</a>
  - <a href='https://www.ardornxt.group'>Powered by ArdorNxt Group</a>
  
includes:
  - accounts.md
  - account-control.md
  - transactions.md
  - coin-exchange.md
  - asset-exchange.md
  - digital-goods.md
  - monetary-system.md
  - messaging.md
  - voting.md
  - data-storage.md
  - alias.md
  - privacy-shuffling.md
  - blocks.md
  - forging.md
  - node-network.md
  - phasing.md
  - search.md
  - utils.md

search: true
---

# Introduction
Welcome to the Ardor Blockchain-as-a-Service platform API documentation.
This documentation is intended for developers from all horizons who want to explore with Ardor platform, build Decentrealized Applications (Dapps), leverage and integrate their own solutions to a public blockchain with huge flexibility like Ardor.

All the interactions with Ardor blockchain are done using HTTP requests and the responses are delivered as JSON objects. Thus, Ardor API can be used universally with any langage of your choice. In the what follows, `shell` and `Javascript` langages will be used to demonstrate the usage of the API, but other sdks are in development.

If you want to interactivally test the API with more recent blockchain data, we recommend you to:

1. Download the Ardor wallet [here](https://www.ardorplatform.org/)
2. Follow the installation instructions
3. Launch the Ardor wallet (can bee found as Ardor Server too on Windows) and wait for the wallet to sync
4. Go to http://localhost:27876/test
5. Scroll to the call you want to test, set the call parameters and explore the results on the side
