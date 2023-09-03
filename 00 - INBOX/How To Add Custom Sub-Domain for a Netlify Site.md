---
Date: 2023-08-31
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# How To Add Custom Sub-Domain for a Netlify Site

> [!SOURCE] Sources
> - *[Configure external DNS for a custom domain | Netlify Docs](https://docs.netlify.com/domains-https/custom-domains/configure-external-dns/)*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

To configure a subdomain such as `blog.mydomain.com` or `www.blogmydomain.com` to a site hosted on [[Netlify]], first *add the domain to you Netlify site settings* on Netlify and then *create a `CNAME` record with your [[DNS Provider]].*

For example, if your site's domain is `blog.mydomain.com` and you [[Netlify]] [[subdomain]] is `blog-curie-12345.netlify.app`:

1. Follow the instructions to [add the domain](https://docs.netlify.com/domains-https/custom-domains/#assign-a-domain-to-a-production-site) `blog.mydomain.com` to the `blog-curie-12345.netlify.app` site on Netlify. 
	- At the end of the process, Netlify provides a `CNAME` record to add to your [[DNS Provider]].
2. Find your [[DNS Provider]]'s record settings for the [[APEX Domain]]: `blogmydomain.com`.
3. On the [[DNS Provider]]'s [[DNS Records]] settings add the `CNAME` record with the subdomain `blog` as the host.
4. Point the record to the Netlify subdomain
5. Save the settings and wait for propogation.
6. 

## Netlify Settings

1. For your site go to `Site Configuration > Domain Management > Domains`:

![](https://i.imgur.com/RVyjVTS.png)

2. Alter the *Netlify Subdomain* to whatever you want you subdomain/site name to be.
3. Add a new *Domain Alias* with the format: `sitename.<domain>` (i.e. `myblog.jimbrig.com`)
4. In your [[Domain Registrar]] (i.e. [[Google Domains]]), navigate to your [[DNS Resource Records]] and add a new record:
	 - Record Type: `CNAME`
	 - Host Name: `<sitename>` (will automatically change to `<sitename>.<domain>`)
	 - Data: `<sitename>.netlify.app`
5. Back in Netlify, check the Primary domain and scroll down to [[HTTPS]] / [[SSL TLS Certificates]]
	- Wait for Netlify to Provision the domain's [[Lets Encrypt]] [[Certificate]].

***

## Appendix: Links and References

*Note created on [[2023-08-31]] and last modified on [[2023-08-31]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[How To Add Custom Sub-Domain for a Netlify Site]] AND -"CHANGELOG" AND -"//How To Add Custom Sub-Domain for a Netlify Site"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

