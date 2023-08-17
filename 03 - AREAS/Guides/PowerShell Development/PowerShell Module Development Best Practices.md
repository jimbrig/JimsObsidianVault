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

- [Overview](#overview)
- [Module Scaffolding](#module-scaffolding)
	- [Project Root Files](#project-root-files)
	- [Source Code](#source-code)
		- [Module Manifest](#module-manifest)
		- [Module File](#module-file)
		- [Functions](#functions)
		- [Other Resources](#other-resources)
			- [Classes and Enumerations](#classes-and-enumerations)
			- [Exceptions](#exceptions)
			- [Desired State Configuration Resources](#desired-state-configuration-resources)
			- [Types and Format Definitions](#types-and-format-definitions)
			- [Other (Templates, Data, Scripts, etc.)](#other-templates-data-scripts-etc)
	- [Documentation](#documentation)
		- [Website](#website)
		- [Module Help](#module-help)
	- [Tests](#tests)
		- [Unit Tests](#unit-tests)
			- [Module Tests](#module-tests)
			- [Function Tests](#function-tests)
		- [Integration Tests](#integration-tests)
			- [Meta Tests](#meta-tests)
			- [Build Task Tests](#build-task-tests)
			- [CI/CD Tests](#cicd-tests)
		- [Test Results](#test-results)
	- [Build](#build)
		- [Build Script](#build-script)
		- [Build Configuration](#build-configuration)
			- [Build Settings](#build-settings)
			- [PSake](#psake)
			- [Dependencies](#dependencies)
		- [Build Tasks](#build-tasks)
	- [Continuous Integration / Continuous Deployment (CI/CD)](#continuous-integration--continuous-deployment-cicd)
		- [GitHub Actions](#github-actions)
		- [Azure Pipelines](#azure-pipelines)
		- [GitVersion](#gitversion)
		- [Git-Cliff (Changelog)](#git-cliff-changelog)
		- [Releases and Versioning](#releases-and-versioning)
		- [Publishing](#publishing)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)




## Overview

> [!NOTE] About
> *Description of note contents.*

## Module Scaffolding

```text

```

### Project Root Files 

- README.md
- CHANGELOG.md
- LICENSE.md
- `.gitattributes`
- `.gitignore`
- `.editorconfig`
- `{{ModuleName}}.build.ps1`
- `{{ModuleName}}.depend.psd1` or `requirements.psd1`
- `psakeFile.ps1`

### Source Code

Source Code belongs in the root-level `Source/*` (or `Source/{{ModuleName}}/*`) folder. 

The `Source/*` folder contains at a minimum the following:
	- `{{ModuleName}}.psm1`: Primary Module `.psm1` File
	- `{{ModuleName}}.psd1`: Module Manifest `psd1` File
	- `Public/*`: Public, Exported Functions
		- `{{FunctionName}}.ps1`
		- `...`
		
and additional, optional files and folders include:
	- `{{ModuleName}}.Configuration.psd1` (Optional) Module Configuration File
	- `Private/*`: (Optional) Private, Un-Exported, Internal Functions
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

#### Module Manifest

```powershell

```

#### Module File

```powershell

```

#### Functions

- Private
- Public

```powershell

```

#### Other Resources

- Custom **Classes** and/or **Enumerations**
- **Exceptions**: Resource `.ps1` Scripts for Manually Defined, Custom Exceptions (i.e. `New-MethodInvocationException.ps1` which defined a new `System.Management.Automation.ErrorRecord` with a `System.Management.Automation.MethodInvocationException` Exception using an `[ErrorCategory]::InvalidOperation`, etc.
- **DSCResources**: 
- Custom **Types** and **Formats** Definition `*.ps1xml` [[XML]] files.


##### Classes and Enumerations


##### Exceptions


##### Desired State Configuration Resources


##### Types and Format Definitions


##### Other (Templates, Data, Scripts, etc.)

### Documentation

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

#### Website

#### Module Help


### Tests

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

#### Unit Tests

##### Module Tests

##### Function Tests

#### Integration Tests

##### Meta Tests

##### Build Task Tests

##### CI/CD Tests

#### Test Results


### Build

#### Build Script

- `{{ModuleName}}.Build.ps1`:

```powershell

```

#### Build Configuration

Define custom build configurations through the use of the following files:

- `{{ModuleName}}.Build.Settings.psd1`: Custom Build Settings
- `{{ModuleName}}.Build.Depend.psd1`: Custom Build Requirements/Dependencies
	- *Note: Can also use `Requirements.psd1` instead.*
- `psakeFile.ps1`: Custom Build Tasks defined using the [[psake module]]

##### Build Settings

- `{{ModuleName}}.Build.Settings.psd1`:

```powershell

```

##### PSake

- `psakeFile.ps1`: 


##### Dependencies

- `{{ModuleName}}.Build.Depend.psd1` or `Requirements.psd1`:

```powershell

```

#### Build Tasks


### Continuous Integration / Continuous Deployment (CI/CD)

#### GitHub Actions


#### Azure Pipelines


#### GitVersion


#### Git-Cliff (Changelog)

#### Releases and Versioning

#### Publishing



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

