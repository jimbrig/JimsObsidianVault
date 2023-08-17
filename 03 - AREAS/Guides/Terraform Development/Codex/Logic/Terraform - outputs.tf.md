---
Date: 2023-05-20
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code", "#Topic/Dev" ]
Alias: [ ]
---

# Terraform - outputs.tf

## Contents

- [Rules for `output`](#rules-for-output)
	- [`output` should be arranged alphabetically](#output-should-be-arranged-alphabetically)
	- [Name and `description` of an `output` should be consistent with related `description` of `resource` parameters in the official documents](#name-and-description-of-an-output-should-be-consistent-with-related-description-of-resource-parameters-in-the-official-documents)
	- [`output` contains confidential data should declare `sensitive = true`](#output-contains-confidential-data-should-declare-sensitive--true)
	- [A blank line should exist between 2 `output`s](#a-blank-line-should-exist-between-2-outputs)
	- [Dealing with Deprecated `output`s](#dealing-with-deprecated-outputs)


> [!SOURCE] Source:
> *<>*

## Rules for `output`

### `output` should be arranged alphabetically

### Name and `description` of an `output` should be consistent with related `description` of `resource` parameters in the official documents

### `output` contains confidential data should declare `sensitive = true`

### A blank line should exist between 2 `output`s

### Dealing with Deprecated `output`s

Sometimes we notice that the name of certain `output` is not appropriate anymore, however, since we have to ensure forward compatibility in the same major version, it's not allowed to change the name directly. We need to move it to an independent `deprecated-outputs.tf` file, then redefine a new output in `output.tf` and make sure it's compatible everywhere else in the module.

A clean up can be performed to `deprecated-outputs.tf` and other logics related to compatibility during a major version upgrade.
