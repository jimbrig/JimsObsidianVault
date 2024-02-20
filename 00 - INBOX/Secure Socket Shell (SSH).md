---
Date: 2023-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Note"
  - "#Topic/Unknown"
Alias: []
---

# Secure Socket Shell (SSH)

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

*Secure Socket Shell*, or **SSH** (also called *Secure Shell*), is a special network protocol leveraging public-key cryptography to enable authorized users to remotely access a computer or other device via access credentials called SSH keys. Because they are used to access sensitive resources and perform critical, highly privileged activities, it’s vital to properly [manage SSH keys](https://www.beyondtrust.com/solutions/ssh-key-management/) as you would other sensitive credentials.

While SSH keys are standard, and more frequently used, in Unix and Linux environments, they are also used in Windows systems.

## SSH Key Security Authentication

The Secure Shell, and the public-key cryptography (an encryption schema using two keys: one public, one private) SSH keys use, is designed to provide strong, encrypted verification and communication between the user and a remote computer.

SSH technology is based on the client-server model and provides an ideal way to access remote devices over unsecured networks, like the Internet. The technology is typically used by administrators for several functions including:

- Logging into remote computers/servers for support and maintenance
- Transferring files from computer to computer
- Remote execution of commands
- Offering support and updates

Today, Telnet, one of the Internet’s first remote login protocols and in use since the 1960’s, has largely been supplanted by SSH, owing to the latter protocol’s enhanced security features.

Keys, passwords, and certificates may all be used for SSH authentication. Of these approaches, SSH keys are the most universally accepted and used.

Like many other modern authentication systems, the next generation of SSH authorization solutions seems to be evolving around the use of certificates. This alternative approach iterates on the SSH key workflows, adding centralized key generation and revocation. Some challenges with this approach are that it is not supported by all SSH endpoints and requires other internal infrastructure, like Certificate Authorities and automated workflows, for access.

## Types of SSH Keys

While many types of SSH keys (RSA, DSA, ECDSA, ed25519) exist, RSA remains the most common and provides the broadest system compatibility. The more modern elliptical curve variants of RSA keys are gaining in adoption.

## Benefits of SSH Key Authentication

IT teams routinely use SSH keys to automate secure access to servers, bypassing the need to manually enter log-in credentials. The SSH network protocol encrypts all traffic between the client and the server while it is in transit. This means anyone eavesdropping on the traffic, such as by packet sniffing, would not be able to improperly access and decrypt transmitted data.

SSH is also resistant to brute force attacks and protects against certain attack vectors used to gain access to remote machines. Public key encryption ensures passwords need not be sent over the network, providing an additional layer of security. SSH keys are an excellent way to stay secure and compliant with various regulations and mandates, if you use best practice to generate, store, manage, and remove them.

Due to the massive number of SSH keys existing across an enterprise at any time, [SSH key management software](https://www.beyondtrust.com/solutions/ssh-key-management/) can significantly lower the overhead and risk of manually managing and updating keys.

[[SSH Key Management Best Practices]]

[[SSH Code Snippets]]


***

## Appendix: Links and References

*Note created on [[2023-07-17]] and last modified on [[2023-07-17]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Secure Socket Shell (SSH)]] AND -"CHANGELOG" AND -"//Secure Socket Shell (SSH)"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

