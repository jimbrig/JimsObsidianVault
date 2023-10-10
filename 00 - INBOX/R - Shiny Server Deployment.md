---
Date: 2023-10-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# R - Shiny Server Deployment

> [!SOURCE] Sources
> - *[Shiny Server Deployment (r-project.org)](https://cran.r-project.org/web/packages/ReviewR/vignettes/deploy_server.html#obtain-a-domain)*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*


[[R Shiny]] applications should support multiple concurrent users when deployed on a centralized server, where the application is serverd to each connecting user in distinct R sessions, allowing multiple users to simultaneousl connect. 

## Getting Started

Before deploying a shiny app, first one must configure the nevironment to securely host shiny apps. The process consists of five main components:

1. Obtain a Domain
2. Shiny Server Setup
3. Configure NGINX to Reverse Proxy Shiny Server
4. Secure Shiny Server URL with [[Lets Encrypt]]
5. Deploy the app

## Obtain Domain

Using a [[domain registrar]] of your choice, obtain a domain name for your server. There are a wide variety of registrars that will provide a domain name either for free of charge or for a small annual fee. 

Once you have obtained a domain name for your server, register your server’s external IP address with your domain registrar of choice. 

Ideally, this external IP address is static, though services exist to update DNS records for servers with ephemeral IP addresses.

Once you have registered for a domain name and linked your domain with your server’s IP you will be able to access your server with a plain text URL, rather than by a IP address. 

Additionally, a domain is required to encrypt connections to/from your server. 

This is because certificate authorities, like [[Lets Encrypt]], are required to verify ownership of domains before security certificates can be issued. 

These certificates are what allows traffic to be [[SSL]] encrypted between clients and your server via the [[HTTPS]] standard. 

By registering your server’s IP address with a domain registrar and associating it with a domain name, you are verifying that you own the site and take all responsibility for its functions.

## Setup Shiny Server




***

## Appendix: Links and References

*Note created on [[2023-10-09]] and last modified on [[2023-10-09]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[R - Shiny Server Deployment]] AND -"CHANGELOG" AND -"//R - Shiny Server Deployment"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

