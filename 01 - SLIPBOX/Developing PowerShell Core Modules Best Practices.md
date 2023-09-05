---
Date: 2023-09-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Guide", "#Topic/Dev/PowerShell"]
Alias: [ "PowerShell Module Development" ]
---

# Developing PowerShell Core Modules Best Practices

> [!SOURCE] Sources
> - *[Writing Portable Modules - PowerShell | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/scripting/dev-cross-plat/writing-portable-modules?view=powershell-7.2)*
>- *[Powershell Module: A Best Practice Guide - the Sysadmin Channel](https://thesysadminchannel.com/powershell-module/)*

## Overview

> [!NOTE] About: *Description of note contents.*

In order to get acquainted with the concepts, workflows, and best practices for developing robust, reusable, and useful [[PowerShell Modules]], one first must understand the concept of [[PowerShell Functions, CmdLets, and Scripts]].

- In [[PowerShell]], a [[function]] (which is what a [[module]] is typically comprised of), can be best described as *"a block of code that will run a specific task"*.
- Functions are especially useful for running repetitive blocks of code without having to necessarily write the same code multiple times.
- Furthermore, functions are not specific to [[PowerShell]] so we can think of it as something universal to any [[programming language]]. 
- Functions are one of the most basic, fundamental concepts one learns when getting into the programming world.

> [!NOTE] See Also: *[Powershell Template For Creating The Perfect Function (thesysadminchannel.com)](https://thesysadminchannel.com/powershell-template/)*

## Importing Functions

To import a function (or any [[PowerShell]] source file) into the current session, utilize what is called *dot sourcing*:

```powershell
# import the function from file: test.ps1
. .\test.ps1

# run the function
test
```

> [!NOTE] Note: *Be weary of [[Relative vs Absolute Paths]] when dot-sourcing functions into the session.*

Once the function is dot sourced (loaded into memory) you can now call the function with the intended parameters.

## From Functions to Modules

- [[Microsoft]] describes a module as a package that contains PowerShell members, such as CmdLets, Providers, Functions, Workflows, Variables, Aliases, Classes, Enums, Data, Custom Objects, DSC Resources, Types, Custom Formats, etc.. 

- The members of this package can be implemented in a [[PowerShell Script]], a compiled [[Dynamic Link Library]] (`DLL`), or a combination of both. These files are usually grouped together in a single directory.

- In simple terms, it's a way to group existing code into a consolidated, portable package for easier use.

## Creating PowerShell Modules

- Creating a [[PowerShell]] module can be very simple, one simply needs to convert their `.ps1` file into a `.psm1` module file by changing its extension.

- However, proper modules should do more than simply define functions, they should:
	1. Declare and document function parameters and parameter types
	2. Bind `cmdlet`s to functions
	3. Declare dependencies or required versions and utilize a [[Module Manifest]] file

## Regarding PowerShell Versions

Note the difference between [[Windows PowerShell]] and [[PowerShell Core]]:

- **[[Windows PowerShell]]** is written for the [[DotNet Framework|.NET Framework]] and is included on all base [[Windows Operating Systems]].
- [[PowerShell Core]], however, is cross-platform and open-source, and is written for [[DotNet Core|.NET Core]].

Portable PowerShell Modules are modules that work in both [[Windows PowerShell]] and [[PowerShell Core]].

One can install/utilize the *PowerShell Standard Module Template* via [.NET CLI](https://docs.microsoft.com/en-us/dotnet/core/tools/?tabs=netcore2x):

```powershell
dotnet new -i Microsoft.PowerShell.Standard.Module.Template
```

Output:

```powershell
Restoring packages for C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\restore.csproj...
  Installing Microsoft.PowerShell.Standard.Module.Template 0.1.3.
  Generating MSBuild file C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\obj\restore.csproj.nuget.g.props.
  Generating MSBuild file C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\obj\restore.csproj.nuget.g.targets.
  Restore completed in 1.66 sec for C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\restore.csproj.

Usage: new [options]

Options:
  -h, --help          Displays help for this command.
  -l, --list          Lists templates containing the specified name. If no name is specified, lists all templates.
  -n, --name          The name for the output being created. If no name is specified, the name of the current directory is used.
  -o, --output        Location to place the generated output.
  -i, --install       Installs a source or a template pack.
  -u, --uninstall     Uninstalls a source or a template pack.
  --nuget-source      Specifies a NuGet source to use during install.
  --type              Filters templates based on available types. Predefined values are "project", "item" or "other".
  --force             Forces content to be generated even if it would change existing files.
  -lang, --language   Filters templates based on language and specifies the language of the template to create.


Templates                        Short Name         Language          Tags
-----------------------------------------------------------------------------------------------
Console Application              console            [C#], F#, VB      Common/Console
Class library                    classlib           [C#], F#, VB      Common/Library
PowerShell Standard Module       psmodule           [C#]              Library/PowerShell/Module
...
```

***

## Appendix: Links and References

*Note created on [[2023-09-05]] and last modified on [[2023-09-05]].*

### Internal Linked Notes

- [[03 - AREAS/Tools/Tools - CLI/PowerShell CLI Tools/PowerShell|PowerShell]]
- [[PowerShell Core]]
- [[Windows PowerShell]]
- [[03 - AREAS/Technology/Computer Science/Operating System/Windows/_README|Windows]]
- [[MOC - Microsoft Windows|Microsoft Windows]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOC - Development|Development]]
- [[MOC - Technology|Technology]]

### External References

- *[Writing Portable Modules - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/writing-portable-modules?view=powershell-7.3)*
- *[Powershell Module: A Best Practice Guide - the Sysadmin Channel](https://thesysadminchannel.com/powershell-module/)*
- *[.NET CLI | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/core/tools/?tabs=netcore2x)*
- *[Discovering objects, properties, and methods - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/03-discovering-objects?view=powershell-7.3)*
- *[Functions - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.3)*
- *[Script modules - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/10-script-modules?view=powershell-7.3)*
- *[Displaying progress while multi-threading - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/write-progress-across-multiple-threads?view=powershell-7.3)*
- *[PowerShell learning resources - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/learn/more-powershell-learning?view=powershell-7.3)*
- *[PowerShell module authoring considerations - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/performance/module-authoring-considerations?view=powershell-7.3)*
- *[How to create a Standard Library Binary Module - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/create-standard-library-binary-module?view=powershell-7.3)*
- *[Resolving PowerShell module assembly dependency conflicts - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/resolving-dependency-conflicts?view=powershell-7.3)*

#### Backlinks

```dataview
list from [[Developing PowerShell Core Modules Best Practices]] AND -"CHANGELOG" AND -"01 - SLIPBOX/Developing PowerShell Core Modules Best Practices"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

