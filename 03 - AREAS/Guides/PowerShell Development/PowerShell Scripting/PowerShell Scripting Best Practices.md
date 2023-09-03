---
Date: 2023-08-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# PowerShell Scripting Best Practices

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

## Style and Format Code

> [!TIP] Tip: Use the [[PowerShell Module - PSScriptAnalyzer|PSScriptAnalyzer]] module to run linting, style, and coding best practice tests against your [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] scripts and source code.

The [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] interpreter does not care about pretty formatting – all code is rigidly processed one after the other. You could write your whole code in one line, as long as you separate single statements with a “;”. But this definitely does not benefit readability and at the latest when you want to work on your code again at a later time, you will regret this decision.

Some common styling areas of concern are:

- Ensure the correct file [[Encoding]] and line-endings: On [[Reference/Technology/Computer Science/Operating System/Windows]] should use [[UTF-8]] and [[CLRF Line Endings]].
	- [[EditorConfig]] can help here.
	- Adjustments to your [[Git Config]] and [[Git Attributes]] may be necessary.
- Use Brackets correctly (i.e. `if-else`, `function`, etc.): 
	- [Indentation style - Wikipedia](https://en.wikipedia.org/wiki/Indentation_style)
	- I prefer using the "one true brace style" where the opening bracket / brace is at the end of the introductory statement, and the closing bracket / brace is on a separate line below the first character of the introductory statement.
	- VSCode or various code-beautifiers can simplify your job here through auto-format features.

```powershell

# Bad Style
$array+="MyString"
foreach($one in $array)
{
$n=$one+"Something"
$n
}

# Good Style
$array = @()
$array += 'MyString'
ForEach ($item -in $array) {
	$obj = $item + "Something"
	$obj
}
```

## Commenting

- Comments:
	- Open with `<#` and close with `#>`
	- For functions and scripts comment blocks should typically include:
		- `SYNOPSIS`
		- `DESCRIPTION`
		- `PARAMETER`s
		- `EXAMPLE`s
		- `NOTES`
		- `LINK`s
		- `INPUT`s
		- `OUTPUT`s
	- Avoid *over commenting*


```powershell
Function Invoke-MyFunction {
	<#
	.SYNOPSIS
		<Brief synopsis of what the function does>
	.DESCRIPTION
		<Longer detailed description of the functions usage and purpose>
	.PARAMETER <ParamName>
		<Parameter Description, Context, Default Values, Restrictions, Validation, etc.
	.EXAMPLE
		<Example Scenario Code>

		# <Example Scenario Output Text>
	.NOTES
		<Notes about the function to further enhance information from above.>
	.LINK
		<Link to another function or online help>
	.INPUTS
		<Input Objects>
	.OUTPUTS
		<Output Objects>
	#>
	[CmdletBinding()]
	Param(
		[<ParameterType>]$<ParameterName>
	)

	BEGIN {}

	PROCESS {}

	END {}

}
```

## Variable Names and Conventions

- Variable names should be meaningful and reveal their content
- Lists should be named in plural, single elements as singular
- Note that [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] is **not case-sensitive**

**Avoid Hard-Coding.**

## Parameter Splatting

In many cases you need many parameters behind a cmdlet. This not only looks messy, it also often leads to very long lines of code and thus awkward horizontal scrolling.

Hashtables can help simplify your code immensely. The technique I’m referring to is called _PowerShell splatting_. Its goal is to group parameters together within a hashtable.

For example:

```powershell
# Original Method
New-ModuleManifest -Path '<path/to/directory>' `
	-Author '<Author Name>' `
	-CompanyName '<Company Name' `
	-CompatiblePSEditions 'Core' `
	-Copyright '<Author or Company Name> | <Year>' `
	-Description '<Module Description>'

# Using Splatting
$Params = @{
	Path		         = '<path/to/directory>'
	Author               = '<Author Name>'
	CompanyName          = '<Company Name'
	CompatiblePSEditions = 'Core'
	Copyright            = '<Author or Company Name> | <Year>'
	Description          = '<Module Description>'
}

New-ModuleManifest @Params
```

*Note: I typically like to align my equals in hashtables for clarity also.*

This method is possible for all cmdlet parameters and makes your code more maintainable due to the overview gained.

## Notes



***

## Appendix: Links and References

*Note created on [[2023-08-13]] and last modified on [[2023-08-13]].*

### Internal Linked Notes

- [[PowerShell Scripting]]
- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[PowerShell Advanced Functions]]
- [[PowerShell Comment Blocks]]
- [[PowerShell Function Template]]
- [[PowerShell Cmdlet Binding]]
- [[PowerShell Parameter Binding]]

### External References

- [Indentation style - Wikipedia](https://en.wikipedia.org/wiki/Indentation_style)
- [5 PowerShell Scripting Best Practices | ScriptRunner](https://www.scriptrunner.com/en/blog/5-powershell-scripting-best-practices/)
- [PowerShell Advanced Functions | ScriptRunner](https://www.scriptrunner.com/en/blog/powershell-advanced-functions/)
- 

#### Backlinks

```dataview
list from [[PowerShell Scripting Best Practices]] AND -"CHANGELOG" AND -"Guides/PowerShell Development/PowerShell Scripting/PowerShell Scripting Best Practices"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023


> [!failure]- Failure 
>   Error: There is another generation process
>   
>   - plugin:obsidian-textgenerator-plugin:56986 TextGenerator.eval
>     plugin:obsidian-textgenerator-plugin:56986:31
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:56972 TextGenerator.generate
>     plugin:obsidian-textgenerator-plugin:56972:12
>   
>   - plugin:obsidian-textgenerator-plugin:58477 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58477:52
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58460 AutoSuggest.getGPTSuggestions
>     plugin:obsidian-textgenerator-plugin:58460:12
>   
>   - plugin:obsidian-textgenerator-plugin:58374 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58374:42
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58371 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58371:60
>   
>   - plugin:obsidian-textgenerator-plugin:58351 eval
>     plugin:obsidian-textgenerator-plugin:58351:14
>   
>  

> [!failure]- Failure 
>   Error: There is another generation process
>   
>   - plugin:obsidian-textgenerator-plugin:56986 TextGenerator.eval
>     plugin:obsidian-textgenerator-plugin:56986:31
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:56972 TextGenerator.generate
>     plugin:obsidian-textgenerator-plugin:56972:12
>   
>   - plugin:obsidian-textgenerator-plugin:58477 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58477:52
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58460 AutoSuggest.getGPTSuggestions
>     plugin:obsidian-textgenerator-plugin:58460:12
>   
>   - plugin:obsidian-textgenerator-plugin:58374 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58374:42
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58371 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58371:60
>   
>   - plugin:obsidian-textgenerator-plugin:58351 eval
>     plugin:obsidian-textgenerator-plugin:58351:14
>   
>  

> [!failure]- Failure 
>   Error: There is another generation process
>   
>   - plugin:obsidian-textgenerator-plugin:56986 TextGenerator.eval
>     plugin:obsidian-textgenerator-plugin:56986:31
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:56972 TextGenerator.generate
>     plugin:obsidian-textgenerator-plugin:56972:12
>   
>   - plugin:obsidian-textgenerator-plugin:58477 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58477:52
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58460 AutoSuggest.getGPTSuggestions
>     plugin:obsidian-textgenerator-plugin:58460:12
>   
>   - plugin:obsidian-textgenerator-plugin:58374 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58374:42
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58371 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58371:60
>   
>   - plugin:obsidian-textgenerator-plugin:58351 eval
>     plugin:obsidian-textgenerator-plugin:58351:14
>   
>  
