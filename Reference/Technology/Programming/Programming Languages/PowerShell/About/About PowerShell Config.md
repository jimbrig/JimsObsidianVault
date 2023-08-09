---
Date: 2023-08-08
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# About PowerShell Config

> [!SOURCE] Sources
> - *[about PowerShell Config - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_config?view=powershell-7.3)*

## Contents

- [Summary of Settings](#summary-of-settings)
- [Configuration Scope](#configuration-scope)
	- [All Users (Shared) Configuration](#all-users-shared-configuration)
	- [Current User (Per-User) Configuration](#current-user-per-user-configuration)
- [Scope Precedence](#scope-precedence)
- [Windows Specific Settings](#windows-specific-settings)
	- [DisableImplicitWinCompat](#disableimplicitwincompat)
	- [WindowsPowerShellCompatibilityModuleDenyList](#windowspowershellcompatibilitymoduledenylist)
	- [ExecutionPolicy](#executionpolicy)
	- [PowerShellPolicies](#powershellpolicies)
- [Settings for Non-Windows Platforms](#settings-for-non-windows-platforms)
- [Common Configuration Settings](#common-configuration-settings)
	- [ConsoleSessionConfiguration](#consolesessionconfiguration)
	- [ExperimentalFeatures](#experimentalfeatures)
	- [ModuleLogging](#modulelogging)
	- [ProtectedEventLogging](#protectedeventlogging)
	- [PSModulePath](#psmodulepath)
	- [ScriptBlockLogging](#scriptblocklogging)
	- [Transcription](#transcription)
	- [UpdatableHelp](#updatablehelp)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

> [!NOTE] About
> *[[Configuration]] files for [[PowerShell]], replacing [[Registry]] configuration.*

- The `powershell.config.json` file contains [[configuration]] settings for [[PowerShell]]. 
- [[PowerShell]] loads this configuration at startup. 
- The settings can also be modified at runtime. 
- Previously, these settings were stored in the [[Windows Registry]] for [[PowerShell]], but are now contained in a file to enable cross-platform configuration on [[macOS]] and [[Linux]].

## Summary of Settings

The `powershell.config.json` file can contain the following keys:

- `DisableImplicitWinCompat`
- `WindowsPowerShellCompatibilityModuleDenyList`
- `WindowsPowerShellCompatibilityNoClobberModuleList`
- `ExperimentalFeatures` ⭐
- `LogChannels`
- `LogIdentity`
- `LogKeywords`
- `LogLevel` ⭐
- `Microsoft.PowerShell:ExecutionPolicy` ⭐
- `PSModulePath` ⭐
- `PowerShellPolicies`
    - `ExecutionPolicy` ⭐
    - `ConsoleSessionConfiguration`
    - `ModuleLogging` ⭐
    - `ProtectedEventLogging`
    - `ScriptBlockLogging`
    - `ScriptExecution` ⭐
    - `Transcription`
    - `UpdatableHelp` ⭐

⭐ = Useful

> [!Note] Note 
> Not all keys apply to all platforms. The `PowerShellPolicies` key contains subkeys that mirror the settings managed by [[Windows Group Policy]]. Those subkeys also apply to all platforms when defined at the *root level* of the [[JSON]] file.

> [!warning] Warning
> Unrecognized keys or invalid values in the configuration file are ignored. If the `powershell.config.json` file contains invalid [[JSON]], [[PowerShell]] can't start an interactive session. If this occurs, you must fix the configuration file.


## Configuration Scope

Configuration settings can be defined for **all users** or at the **individual user** level.

- Scopes:
	- `CurrentUser`
	- `AllUsers`


### All Users (Shared) Configuration

A `powershell.config.json` file in the `$PSHOME` directory defines the configuration for all PowerShell sessions running from that PowerShell installation.

> [!note] Note
> The `$PSHOME` location is defined as the same directory as the executing `System.Management.Automation.dll` assembly. This applies to hosted [[PowerShell SDK]] instances as well.

### Current User (Per-User) Configuration

- You can also configure [[PowerShell]] on a per-user basis by placing the file in the user-scoped configuration directory. 

- The user configuration directory can be found across platforms with the command `Split-Path $PROFILE.CurrentUserCurrentHost`.

## Scope Precedence

On [[Windows]], settings managed by [[Windows Group Policy]] take precedence over settings in the configuration file. Group Policy doesn't exist on non-Windows platforms.

After Group Policy, settings defined at the **AllUsers** level take precedence over settings defined for the **CurrentUser** level.

## Windows Specific Settings

The following settings only apply to [[Windows]] platforms.

- `DisableImplicitWinCompat`
- `WindowsPowerShellCompatibilityModuleDenyList`
- `WindowsPowerShellCompatibilityNoClobberModuleList`
- `ExecutionPolicy`
- `PowerShellPolicies`


### DisableImplicitWinCompat

When set to `true`, this setting disables the Windows PowerShell Compatibility feature. Windows PowerShell Compatibility allows PowerShell 7 to load Windows PowerShell 5.1 modules in compatibility mode.

For more information, see [about_Windows_PowerShell_Compatibility](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_windows_powershell_compatibility?view=powershell-7.3).

### WindowsPowerShellCompatibilityModuleDenyList

This setting is an array of module names that you want to exclude from participation in the [[Windows PowerShell]] Compatibility feature.

For more information, see [about_Windows_PowerShell_Compatibility](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_windows_powershell_compatibility?view=powershell-7.3).

### ExecutionPolicy

> [!info] Important
> This configuration only applies on [[Windows]] platforms.

Configures the execution policy for PowerShell sessions, determining what scripts can be run. By default, PowerShell uses the existing execution policy.

For **AllUsers** configurations, this sets the **LocalMachine** execution policy. For **CurrentUser** configurations, this sets the **CurrentUser** execution policy.

The following example sets the execution policy of PowerShell to `RemoteSigned`:

```json
{
  "Microsoft.PowerShell:ExecutionPolicy": "RemoteSigned"
}
```

For more information, see [about_Execution_Policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.3).

### PowerShellPolicies

Windows has several settings that can be managed by Group Policy. Usually, those setting are stored in the Windows registry. Those setting can also be defined in the `powershell.config.json` file.

The `PowerShellPolicies` is a JSON object that contains key-value pairs for the various policy settings. Those policy settings can also be listed at the root level of the JSON file, outside of the `PowerShellPolicies` object. This setting can contain the following subkeys:

- `ConsoleSessionConfiguration`
- `ModuleLogging`
- `ProtectedEventLogging`
- `ScriptBlockLogging`
- `ScriptExecution`
- `Transcription`
- `UpdatableHelp`

The `ScriptExecution` setting is used to set the PowerShell Execution Policy. This takes precedence over the `ExecutionPolicy` setting described above.

Example: 

```json
{
    "PowerShellPolicies": {
        "ScriptExecution": {
            "ExecutionPolicy": "RemoteSigned"
        }
    }
}
```

For descriptions of the other policy settings, see the descriptions in the [Common configuration settings](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_config?view=powershell-7.3#common-configuration-settings) section.

On Windows, PowerShell looks for the settings in the registry. Any settings found in the registry have precedence. Next PowerShell reads the JSON configuration. Any settings found under `PowerShellPolicies`, and not defined in the registry, take precedence over settings found at the root level of the JSON configuration.

For more information, see [about_Group_Policy_Settings](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_group_policy_settings?view=powershell-7.3).

## Settings for Non-Windows Platforms

The following settings only apply to Linux and macOS platforms.

The following keys are used to configure PowerShell's logging for Linux and macOS.

- `LogChannels`
- `LogIdentity`
- `LogKeywords`
- `LogLevel`

For a full description of PowerShell logging for non-Windows systems, see [about_Logging_Non-Windows](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logging_non-windows?view=powershell-7.3).

## Common Configuration Settings

The following settings are available on all supported platforms.

- `ConsoleSessionConfiguration`
- `ExperimentalFeatures`
- `ModuleLogging`
- `ProtectedEventLogging`
- `PSModulePath`
- `ScriptBlockLogging`
- `ScriptExecution`
- `Transcription`
- `UpdatableHelp`

### ConsoleSessionConfiguration

This setting specifies the session configuration to be used for all PowerShell sessions. This can be any endpoint registered on the local machine including the default PowerShell remoting endpoints or a custom endpoint having specific user role capabilities.

This key contains two subkeys:

- `EnableConsoleSessionConfiguration` - to enable session configurations, set the value to `true`. By default, this value is `false`.
    
- `ConsoleSessionConfigurationName` - Specifies the name of configuration endpoint in which PowerShell is run. By default, there is no session defined.
    
```json
{
  "ConsoleSessionConfiguration": {
    "EnableConsoleSessionConfiguration": false,
    "ConsoleSessionConfigurationName" : []
  }
}
```

For more information, see [about_Session_Configurations](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_session_configurations?view=powershell-7.3).

### ExperimentalFeatures

The names of the experimental features to enable in PowerShell. The default value is an empty array.

The following example enables the **PSCommandNotFoundSuggestion** and **PSSubsystemPluginModel** experimental features when PowerShell starts up.

Example:

```json
{
  "ExperimentalFeatures": [
    "PSCommandNotFoundSuggestion",
    "PSSubsystemPluginModel"
  ]
}
```

For more information on experimental features, see [Using experimental features](https://learn.microsoft.com/en-us/powershell/scripting/learn/experimental-features).

[](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_config?view=powershell-7.3#modulelogging)

### ModuleLogging

This setting controls the behavior of logging for PowerShell modules. The setting contains two subkeys:

- `EnableModuleLogging` - to enable session configurations, set the value to `true`. When enabled, pipeline execution events for members of the specified modules are recorded in the PowerShell log files.
- `ModuleNames` - Specifies the name of the modules that should be logged.

Example:

```json
{
  "ModuleLogging": {
    "EnableModuleLogging": true,
    "ModuleNames" : [
        "PSReadLine",
        "PowerShellGet"
    ]
  }
}
```

### ProtectedEventLogging

This setting lets you configure Protected Event Logging. The setting contains two subkeys:

- `EnableProtectedEventLogging` - If you enable this policy setting, components that support it use the certificate you supply to encrypt log data before writing it to the log. Data is encrypted using the Cryptographic Message Syntax (CMS) standard. You can use `Unprotect-CmsMessage` to decrypt these encrypted messages, if you have access to the private key of the certificate.
- `EncryptionCertificate` - Provides a list of name of certificates to be used for encryption.

Example:

```json
{
  "ProtectedEventLogging": {
    "EnableProtectedEventLogging": false,
    "EncryptionCertificate": [
      "Joe"
    ]
  }
}
```

### PSModulePath

Overrides the `PSModulePath` settings for this PowerShell session. If the configuration is for the current user, sets the **CurrentUser** module path. If the configuration is for all users, sets the **AllUsers** module path.

 > [!Warning] Warning
 > Configuring an **AllUsers** or **CurrentUser** module path here doesn't change the scoped installation location for PowerShellGet cmdlets like [Install-Module](https://learn.microsoft.com/en-us/powershell/module/powershellget/install-module). These cmdlets always use the _default_ module paths.

If no value is set, PowerShell uses the default value for the respective module path setting. For more information about these defaults, see [about_Modules](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-7.3#module-and-dsc-resource-locations-and-psmodulepath).

This setting allows environment variables to be used by embedding them between `%` characters, like `"%HOME%\Documents\PowerShell\Modules"`, in the same way that the Windows Command Shell allows. This syntax also applies on Linux and macOS. See below for examples.

This example shows a `PSModulePath` configuration for a Windows environment:

```json
{
  "PSModulePath": "C:\\Program Files\\PowerShell\\6\\Modules"
}
```

This example shows a `PSModulePath` configuration for a macOS or Linux environment:

```json
{
  "PSModulePath": "/opt/powershell/6/Modules"
}
```

This example shows embedding an environment variable in a `PSModulePath` configuration. Note that using the `HOME` environment variable and the `/` directory separator, this syntax works on Windows, macOS, and Linux.

```json
{
  "PSModulePath": "%HOME%/Documents/PowerShell/Modules"
}
```

This example uses an environment variable that only works on macOS and Linux:

```json
{
  "PSModulePath": "%XDG_CONFIG_HOME%/powershell/Modules"
}
```

> [!Note] Note
> PowerShell variables can't be embedded in `PSModulePath` configurations. `PSModulePath` configurations on Linux and macOS are case-sensitive. A `PSModulePath` configuration must use valid directory separators for the platform. On macOS and Linux, this means `/`. On Windows, both `/` and `\` work.

### ScriptBlockLogging

This setting controls logging of all PowerShell script input. This setting contains two subkeys:

- `EnableScriptBlockLogging` - If you enable this policy setting, PowerShell logs the processing of commands, script blocks, functions, and scripts whether invoked interactively, or through automation.
- `EnableScriptBlockInvocationLogging` - enables logging of script block start and stop events.

Example:

```json
"ScriptBlockLogging": {
  "EnableScriptBlockInvocationLogging": true,
  "EnableScriptBlockLogging": false
}
```

### Transcription

This policy setting lets you capture the input and output of PowerShell commands in text-based transcripts. If you enable this policy setting, PowerShell enables transcription for all PowerShell sessions.

This setting controls how transcription works in PowerShell. This setting contains three subkeys:

- `EnableTranscripting` - When this setting is enabled, PowerShell creates transcription log files in the configured location.
- `EnableInvocationHeader` - By default, PowerShell includes a header at the top of the transcription log file. You can disable the header using this setting.
- `OutputDirectory` - This setting allows you to collect transcription log files in a central location instead of the default location.

Example:

```json
{
    "Transcription": {
        "EnableTranscripting": true,
        "EnableInvocationHeader": true,
        "OutputDirectory": "c:\\tmp"
      }
}
```

For more information, see [Start-Transcript](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.host/start-transcript?view=powershell-7.3).

### UpdatableHelp

This policy setting allows you to set the default value of the **SourcePath** parameter on the `Update-Help` cmdlet. This default value can be overridden by specifying a different value using the **SourcePath** parameter.

Example:

```json
{
    "UpdatableHelp": {
      "DefaultSourcePath": "f:\\temp"
    }
}
```


***

## Appendix: Links and References

*Note created on [[2023-08-08]] and last modified on [[2023-08-08]].*

### Internal Linked Notes

- [[PowerShell]]
- [[Windows]]
- [[Microsoft]]
- [[PowerShell Profile Setup and Best Practices]]
- [[Configuration Management]]
- [[Shells]]
- [[Windows Group Policy]]
- [[Windows Registry]]
- [[Computer Science]]

### External References

- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_config

#### Backlinks

```dataview
list from [[About PowerShell Config]] AND -"CHANGELOG" AND -"Reference/Technology/Programming/Programming Languages/PowerShell/About/About PowerShell Config"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

