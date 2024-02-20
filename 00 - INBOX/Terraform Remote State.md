---
Date: 2023-06-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Note"
  - "#Topic/Unknown"
Alias: []
---

# Terraform Remote State

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

It’s ok to use the local state when experimenting, but use a remote shared state location for anything above that point. Having a single remote backend for your state is considered one of the first best practices you should adopt when working in a team. Pick one that supports **state locking** to avoid multiple people changing the state simultaneously. Treat your state as immutable and avoid manual state changes at all costs. Make sure you have backups of your state that you can use in case of a disaster. For some backends, like AWS S3, you can enable _versioning_ to allow for quick and easy state recovery.

***

## Appendix: Links and References

*Note created on [[2023-06-07]] and last modified on [[2023-06-07]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Terraform Remote State]] AND -"CHANGELOG" AND -"//Terraform Remote State"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

