---
Date: 2023-05-20
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code", "#Topic/Dev" ]
Alias: [ ]
---

# Terraform - locals.tf

> [!SOURCE] Source:
> *<>*

## Contents

- [Rules for `local`](#rules-for-local)
	- [`locals.tf` should contain only one `locals` block](#localstf-should-contain-only-one-locals-block)
	- [`local` should be arranged alphabetically](#local-should-be-arranged-alphabetically)
	- [`local` should use types as precise as possible](#local-should-use-types-as-precise-as-possible)
	- [No blank lines should exist between two `local`s](#no-blank-lines-should-exist-between-two-locals)
	- [For complicated `local` expressions, [unit tests](../test_code/unit_test.md) should be composed to cover all use cases.](#for-complicated-local-expressions-unit-teststest_codeunit_testmd-should-be-composed-to-cover-all-use-cases)


## Rules for `local`

To increase the readability of code, some complicated or duplicated expressions can be extracted and defined as `local`. All `local` independent from `resource` or `data` should be defined in `locals.tf` file.

### `locals.tf` should contain only one `locals` block

All `local` should be defined in the only `locals` block in `locals.tf` file.

### `local` should be arranged alphabetically

### `local` should use types as precise as possible

Eg. Type of `object({ name = string, age = number})`:

```terraform
{
  name = "John"
  age  = 52
}
```

is better than `map(string)`:

```terraform
{
  name = "John"
  age  = "52"
}
```

### No blank lines should exist between two `local`s

### For complicated `local` expressions, [unit tests](../test_code/unit_test.md) should be composed to cover all use cases.

