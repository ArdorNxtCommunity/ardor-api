# Decentralized Messaging

Messages is a way for Ardor accounts to exchange information or data over the blockchain without using a secondary channel. The messages can be encrypted and are prunable from the blockchain history.

The base implementation allows for the transmission of simple, unencrypted text messages between accounts, but since the messages are truly "arbitrary" the range of possible applications is vast. Secure messaging, torrent applications, voting systems, data storage systems and even simple distributed applications have been suggested.

## Send & Read
### sendMessage 
### readMessage 

## Encrypted Messages
### encryptTo 
### decryptFrom
### getSharedKey

## Prunable Messages
### getAllPrunableMessages 
### getPrunableMessages 
### getPrunableMessage 
### downloadPrunableMessage 
### verifyPrunableMessage