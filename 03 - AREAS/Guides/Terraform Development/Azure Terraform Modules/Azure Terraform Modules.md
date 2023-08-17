---
Date: 2023-05-20
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code", "#Topic/Dev" ]
Alias: [ ]
---

# Azure Terraform Modules

> [!SOURCE] Source:
> *<>*

## Overview

Provide essential information related to [[Azure]] [[Inbox/Terraform]] module development, including brief introduction on [[Terraform Modules]], documentation for modules and pointers to the module repositories, and how [[Inbox/Terraform]] practitioners utilize the modules.

Please note that all the verified modules meet the quality pipeline established by the Microsoft Azure team.

## What is a Terraform Module

Terraform modules encapsulate groups of resources dedicated to one task, reducing the code you have to develop for similar infrastructure components. A typical module will contain a set of configuration files in one single directory, and integrate the following items: main.tf, variables.tf, output.tf, test folder, and README.md.

## Notes

- [[General Guidelines]]
- [[Example Code]]

- **Logic Code**:
	- [[Breaking Changes]]
	- [[Terraform Locals - locals.tf]]
	- [[Terraform Outputs - outputs.tf]]
	- [[Terraform Resources - main.tf]]
	- [[Versioning]]


- ** Testing**:
	- [[End-to-End (e2e) Tests]]
	- [[Testing Terraform Code]]
	- [[03 - AREAS/Guides/Terraform Development/Codex/Tests/Unit Tests]]
	- [[Version Upgrade Tests]]





