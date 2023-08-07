---
Date: 2023-08-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# PowerShell Module Development Best Practices

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

## Module Scaffolding

- README.md
- CHANGELOG.md
- LICENSE.md
- `.gitattributes`
- `.gitignore`
- `.editorconfig`
- `{{ModuleName}}.build.ps1`
- `{{ModuleName}}.depend.psd1` or `requirements.psd1`
- `psakeFile.ps1`
- `requirements.txt`
- `mkdocs.yml`

- `Source/*`:
	- `{{ModuleName}}.psm1`: Module File
	- `{{ModuleName}}.psd1`: Module Manifest File
	- `Private/*`: Private Functions
		- `{{FunctionName}}.ps1`
		- `...`
	- `Public/*`: Public, Exported Functions
		- `{{FunctionName}}.ps1`
		- `...`
	- `Classes/*`: (Optional) Exported *Classes*
	- `Enum/*`: (Optional) Exported *Enumerations*
	- `Types/*`: (Optional) Exported Custom *Types* - `{{TypeName}}.ps1xml` or a single `{{ModuleName}}.Types.ps1xml`
	- `Formats/*`: (Optional) Exported Custom *Formats* - `{{FormatName}}.ps1xml`
	- `Templates/*`: (Optional) Template files for the Module to utilize, including any *Plaster Template Manifests*.
	- ``

- `Tests/*`:
	- `Results/*`
		- `testResults.xml`
		- `coverageResults.xml`
	- `Files/*`
		- *(Optional) Helper Files to use in tests (i.e. mocks, etc.)*
	- `Unit/*`
		- `Public/*`:
			- `{{FunctionName}}.Tests.ps1`
			- `...`
		- `Private/*`:
			- `{{FunctionName}}.Tests.ps1`
			- `...`
	- `Integration/*`
		- `Help.Tests.ps1`
		- `Manifest.Tests.ps1`
		- `Meta.Tests.ps1`
		- `MetaFixers.psm1`
	- `ScriptAnalyzerSettings.psd1`
	- `{{ModuleName}}.Tests.ps1`

```text

```

***

## Appendix: Links and References

*Note created on [[2023-08-07]] and last modified on [[2023-08-07]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[PowerShell Module Development Best Practices]] AND -"CHANGELOG" AND -"Guides/PowerShell Development/PowerShell Module Development Best Practices"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

