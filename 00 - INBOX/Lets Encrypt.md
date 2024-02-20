---
Date: 2023-10-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Note"
  - "#Topic/Unknown"
Alias: []
---

# Lets Encrypt

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

**Let's Encrypt** is a [[Certificate Authority (CA)]] that provides an accessible way to obtain and install free [TLS/SSL certificates](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs), thereby enabling encrypted [[HTTPS]] on web servers. 

It simplifies the process by providing a software client, [[Certbot]], that attempts to automate most (if not all) of the required steps. 

Currently, the entire process of obtaining and installing a certificate is fully automated on both [[Apache]] and [[Nginx]].

## Pre-Requisites

- Ubuntu/Linux Server set up including a sudo-enabled, non-root user and firewall.
- Registered domain name using registrar of choice
- DNS Records:
	- `A` record with `<subdomain>.com` pointing to the server's public [[IP Address]]
	- `A` record with `www.<subdomain>.com` pointing to the server's public [[IP Address]]
- [[Nginx]] installed and configured

## Install Certbot

> See Also: [[Certbot]]

```bash
sudo apt remove cerbot

sudo snap install core
sudo snap refresh core

sudo snap install --classic certbot

sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

***

## Appendix: Links and References

*Note created on [[2023-10-09]] and last modified on [[2023-10-09]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Lets Encrypt]] AND -"CHANGELOG" AND -"//Lets Encrypt"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

