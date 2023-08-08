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

- `Source/{{ModuleName}}/*`:
	- `{{ModuleName}}.psm1`: Module File
	- `{{ModuleName}}.psd1`: Module Manifest File
	- `Private/*`: Private Functions
		- `{{FunctionName}}.ps1`
		- `...`
	- `Public/*`: Public, Exported Functions
		- `{{FunctionName}}.ps1`
		- `...`
	- `Resources/*`: (Optional) Place other folders besides `Public/` and `Private/` here.
		- `Classes/*`: (Optional) Exported *Classes*
		- `Enum/*`: (Optional) Exported *Enumerations*
		- `Types/*`: (Optional) Exported Custom *Types* - `{{TypeName}}.ps1xml` or a single `{{ModuleName}}.Types.ps1xml`
		- `Formats/*`: (Optional) Exported Custom *Formats* - `{{FormatName}}.ps1xml`
		- `DSCResources/*`: (Optional) [[Desired State Configuration]] Definitions, Modules, and `.mof` files.
		- `Templates/*`: (Optional) Template files for the Module to utilize, including any *Plaster Template Manifests*.
		- `Data/*`: (Optional) Data Files
		- `Scripts/*` (Optional) Scripts


	

- `Docs/*`: Documentation Directory
	- `web/*`: Website Documentation to be rendered via *GitHub Pages*
		- `requirements.txt`: [[Python]] Requirements File (for use with `mkdocs`)
		- `mkdocs.yml`: [[MkDocs]] [[YAML]] Configuration File
		- `docs/*`: 
			- `index.md`:
			- `about.md`:
			- `changelog.md`:
			- `FAQ.md`:
			- `Installation.md`:
			- `Reference/*`:
				- `about_{{ModuleName}}.md`:
				- `{{FunctionName}}.md`:
				- `...`
			- `Dev/*`:
				- *Markdown files for developers.*
			- `assets/*`:
				`themes/*`:
				`images/*`:
				`styles/*`:
				`scripts/*`: 
				`fonts/*`:
				`...`
	- `en-US/*`:
		- 	
		
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

