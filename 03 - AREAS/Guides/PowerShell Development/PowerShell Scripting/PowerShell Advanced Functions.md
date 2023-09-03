---
Date: 2023-08-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# PowerShell Advanced Functions

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

## Stream Control

The [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] engine provides a number of *streams* which can be used to send different messages based on the context:

1. Output / Success
2. Error
3. Warning
4. Verbose
5. Debug

Depending on the context we can leverage inbuilt cmdlets to write to a specific stream, for example if we want to write to the verbose stream, we can use the _Write-Verbose_ cmdlet and so on.

Using the `CmdletBinding` attribute exposes a number of features provided by [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]. It makes the function an advanced function, and allows stream parameters to be applied like `-Verbose`, etc.

## Parameter Validation

Functions are not very useful unless they can accept parameters. Helped functions are a different story though however our focus is on regular functions.

As such, parameter validation is a very important process before we start using the supplied parameters into our programming logic. PowerShell engine provides a number of built-in mechanisms to validate parameters. Advanced functions can help us leverage this functionality to validate our parameters rather than writing our own parameter validation logic.

In this section we will discuss some parameter validation techniques however this list is by no means exhaustive.

### Mandatory Parameters

### ValidateScript

### ValidatePattern

### ValidateSet

## Pipeline Binding

## Safeguards

`-WhatIf` and `-Confirm` flags (`[Switch]` parameters).
- `$WhatIfPreference` global variable
- `$ConfirmPreference` global variable

- `SupportsShouldProcess` argument to `CmdletBinding`
- `ConfirmImpact` argument to `CmdletBinding` (i.e. `[CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]`)



***

## Appendix: Links and References

*Note created on [[2023-08-13]] and last modified on [[2023-08-13]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[PowerShell Advanced Functions]] AND -"CHANGELOG" AND -"Guides/PowerShell Development/PowerShell Scripting/PowerShell Advanced Functions"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

