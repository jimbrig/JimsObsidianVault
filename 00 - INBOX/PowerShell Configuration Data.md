---
Date Created: 2023-11-30
Date Modified: 2023-11-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - Type/Guide
  - Topic/Dev/PowerShell
  - Status/WIP
Aliases:
  - PowerShell Configuration Files
---

# PowerShell Configuration Data

> [!SOURCE] Sources
> - *[PowerShell Configuration Data – Rambling Cookie Monster](https://ramblingcookiemonster.github.io/PowerShell-Configuration-Data/)*

## Overview

## Possible Types of Configuration File Formats

- [[Extensible Markup Language (XML)]]
- [[JavaScript Notation (JSON)]]
- [[Yet Another Markup Language (YAML)]]
- [[PowerShell Data File (PSD1)]]
- [[INI]]
- [[Registry]]
- [[Comma-Separated Values (CSV)]]
- [[Database]]

For each solution you design, consider your needs, priorities, and constraints, and pair them up with one of these formats. Bear in mind the the lessons of the [configuration complexity clock](http://mikehadlow.blogspot.com/2012/05/configuration-complexity-clock.html).

### XML

[[XML]] is a tried and true format and has been widely used historically by Microsoft. However, it is becoming somewhat outdated with the verge on [[JSON]], and is not the most human-readable/user-friendly of the possible options:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Note>
	<To>John</To>
	<From>Jane</From>
	<Heading>Reminder</Heading>
	<Body>Test</Body>
</Note>	
```

  In [[PowerShell]], [[XML]] is used a lot (i.e. [[Import-CliXml]], [[Export-CliXml]], and [[ConvertTo-Xml]]) and it is also built into the core [[.NET Framework]].

#### Pros and Cons

|                     Good                      |                Bad                |
|:---------------------------------------------:|:---------------------------------:|
|          Avoid External Dependencies          |        Not Human Readable         |
|                   Flexible                    | Syntax is inefficient and verbose |
|    Wide Cross-Platform Support and Tooling    |             Outdated              |
|      CliXml CmdLets and Function Support      |                                   |
|       Serialization and Deserialization       |                                   |
| Stores Data with more than one layer of depth |                                   |

#### Example

```xml
# Serialize some data to disk
Get-Item C:\Windows\explorer.exe | Export-Clixml -Depth 5 -Path C:\XML.xml

# Deserialize the data
$File = Import-Clixml -Path C:\XML.xml

# Drill down.
$File.VersionInfo.ProductVersion
```

#### Should I use XML?

There are two scenarios that I recommend using [[XML]]:
1. Quick and dirty serialization. Import and Export CliXml are simple to use
2. Technology lock-in (i.e. Excel)

### JSON

> [!NOTE] Note
> [[JSON]] is a lightweight data format common in modern [[Web APIs]]:

```json
{
  "group": "group1",
  "users": [
	  "user1",
	  "user2"
  ]
}
```

#### Common Tools and Usage

- Built in Cmdlets: ConvertFrom-Json, ConvertTo-Json (PowerShell 3 or later)


#### Pros and Cons

|                          Good                          |                               Bad                               |
|:------------------------------------------------------:|:---------------------------------------------------------------:|
| Avoid external dependencies (in PowerShell 3 or later) | Want to store MSFT paths? Have fun: `{ "Path": "C:\\W\\T\\F" }` |
|     Stores Data with more than one layer of depth      | Not as Widespread cross-platform support or tooling as [[XML]]  |
|                  Semi-human readable                   |                                                                 |
|  Syntax more efficient and less verbose than [[XML]]   |                                                                 |
|   Implemented in libraries across various languages    |                                                                 |

#### Example

```
# Convert some data to Json
$JSON = Get-Item C:\Windows\explorer.exe |
    ConvertTo-Json -Depth 2

# Read the Json back into an object
$File = $JSON | ConvertFrom-Json

# Drill down.
$File.VersionInfo.ProductVersion
```

#### Should I use JSON?

[[JSON]] is a popular and safe choice nowadays. Depending on your needs, this is often a good fit.

#### See Also

- [A JSON Primer for Administrators](http://www.powershellmagazine.com/2014/12/01/a-json-primer-for-administrators/)
- [JSON.NET](https://github.com/JamesNK/Newtonsoft.Json)
- [JSON Is the New XML](http://blogs.technet.com/b/heyscriptingguy/archive/2014/04/23/json-is-the-new-xml.aspx)

### YAML

[[YAML]] is a human friendly data format.

```yaml
Config:
	Author: John Doe
	Source:
	  - 'Modules\MyModule'
	Destination:
	  - '\\server\website.com'
	Options:
	  Force: True
```

#### Common Tools and Usage

- [PowerYaml](https://github.com/scottmuc/PowerYaml) and various [forks](https://github.com/cdhunt/PowerYaml)
- [Yaml.Net](https://github.com/aaubry/YamlDotNet)

#### Pros and Cons

|                        Good                        |                                  Bad                                  |
|:--------------------------------------------------:|:---------------------------------------------------------------------:|
|                Very human readable                 |               Dependencies on libraries like `YAML.NET`               |
|   Stores data with more than one layer of depth    | Haven’t seen a reliable serialize and deserialize module for YAML yet |
| Syntax is more efficient and less verbose than XML |                   Whitespace is part of the syntax                    |
| Implemented in libraries across several languages  |                                                                       |

#### Example

```yaml
# Define some Yaml
$Yaml = @"
Name: explorer.exe
Length: 4532304
DirectoryName: C:\Windows
VersionInfo:
  ProductVersion: 10.0.10240.16384
"@

#Read the Yaml, using PowerYaml
$File = Get-Yaml -FromString $Yaml

# Drill down.
$File.VersionInfo.ProductVersion
```

#### Should I Use YAML?

I would only recommend [[YAML]] where human readability is paramount, and your other needs and constraints don’t rule it out.

[[YAML]] a great option when you will simply be reading in a config file, and the end users will be manually manipulating this file.

### PowerShell Data File (PSD1)

PowerShell data files are used for PowerShell module manifests, but can be used to store arbitrary data.

```powershell
@{
    Name = 'explorer.exe'
    Length = 453204
    DirectoryName = 'C:\Windows'
    VersionInfo = @{
        ProductVersion = '10.0.10240.16384'
    }
    Wat = 1
}
```

#### Common Tools and Usage

- Built in Cmdlet: [Import-LocalizedData](https://technet.microsoft.com/en-us/library/hh849919.aspx)

#### Pros and Cons

|                     Good                      |                               Bad                                |
|:---------------------------------------------:|:----------------------------------------------------------------:|
|       Familiar to PowerShell Developers       |                         Single Platform                          |
|         Avoids External Dependencies          | Havn't seen a reliable serialize/deserialize module for PSD1 yet |
| Stores data with more than one layer of depth |                                                                  |
|              Semi-Human Readable              |                                                                  |

#### Example

```powershell
# Create a PSD1 file
@"
@{
    Name = 'explorer.exe'
    Length = 4532304
    DirectoryName = 'C:\Windows'
    VersionInfo = @{
      ProductVersion = '10.0.10240.16384'
    }
}
"@ | Out-File -FilePath C:\PSD1.psd1

# Read the file
$File = Import-LocalizedData -BaseDirectory C:\ -FileName PSD1.psd1

# Drill down.
$File.VersionInfo.ProductVersion
```

#### Should I use PSD1?

This seems like a reasonable choice for PowerShell configuration files that will be edited by hand, by folks familiar with PowerShell.

### Other Formats

There are a variety of other choices. Here are a few others you might consider:

- **CSV** has plenty of built in Cmdlets, but is quite limited and might produce [unexpected results](http://learn-powershell.net/2014/01/24/avoiding-system-object-or-similar-output-when-using-export-csv/).
- **Text** is an option, with a variety of tools including the new [ConvertFrom-String](http://www.powershellmagazine.com/2014/09/09/using-the-convertfrom-string-cmdlet-to-parse-structured-text/). Not sure why you would chose this over an existing data format.
- **The registry**. I wouldn’t pick it, but it’s used by many applications and is familiar to most Windows administrators. Tools like [PSRemoteRegistry](https://psremoteregistry.codeplex.com/releases/view/65928) make this simple to work with remotely, unlike the registry PSProvider.
- **[Ini files](http://lipkau.github.io/PsIni/)** are a bit dated, but are simple to read and use. Given their limitations and the wealth of other options, you should probably leave these in the attic.
- **Databases** are a great option for larger solutions, or where your data model requires a bit more sophistication. [SQLite](http://ramblingcookiemonster.github.io/SQLite-and-PowerShell/) is a handy, cross-platform solution, if SQL Server or other database engines are too heavy-weight.