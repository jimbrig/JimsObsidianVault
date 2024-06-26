---
author: "jimmy Briggs <jimmy.briggs@jimbrig.com>"
date: 2023-05-23
tags: [
	"#Topic/Dev"
]
alias: [
	"PowerShell Desired State Configuration",
	"Desired State Configuration",
	"DSC"
]
---

# PowerShell Desired State Configuration (DSC)

## Contents



## Overview



> [!source] See Also
> - [What is Desired State Configuration (dsccommunity.org)](https://dsccommunity.org/help/what-is-dsc/)
> - [PowerShell Desired State Configuration (DSC) - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/dsc/overview?view=powershell-7.3)
> - [Desired State Configuration 2.0 - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/dsc/overview?view=dsc-2.0)

[[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] *Desired State Configuration*, or `DSC` is a management platform in [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]].

## Components

`DSC` is built around various *components*:

- **DSC DSL**: - The **Domain Specific Language** of DSC with the `Configuration` keyword.
- **DSC LCM**: The **Local Configuration Manager (LCM)**, that can be seen as the agent enacting the configurations on the managed nodes.
- **DSC Resources**: A rich ecosystem of modules exposing a declarative and idempotent interface to imperative code configuring resources.
- **DSC Pull Server**: External component implementing the [MS-DSCPM protocol](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-dscpm/ea744c01-51a2-4000-9ef2-312711dcc8c9)to register nodes, offer configuration, gather reporting from the LCM

The **DSL** is what allows us to use the Declarative Syntax within PowerShell to define the configuration policy of your systems, and compiles (or serialize) into MOF Documents. The **LCM** is the agent what enacts those MOF documents, whether on demand or periodically when using the Pull model.

The **pull server** is a glorified File server that implements the MS-DSCPM protocol to talk to the LCM. The **Report server** is a data collector aggregating the results of each DSC runs in its database.

The **DSC resources** are some sorts of interfaces enabling idempotent characteristics to scripts configuring atomic resources, or a composition of different resources. The most populars are written for the Windows LCM supporting PowerShell 5.1, but some exists for Linux and can be written in Python or pretty much any language.

## Usage

DSC is a platform enabling **idempotent** and **declarative** configuration, that helps managing complexity of an infrastructure when used within a [**Release Pipeline**](https://aka.ms/TRPM).

It is best used for **Policy-Driven infrastructure**, where version-controlled **documents** describing the unique source of human intent, drive and deliver the configuration of the infrastructure components, automatically.

In essence, it’s [Infrastructure _from_ code](https://devopscollective.org/maybe-infrastructure-as-code-isnt-the-right-way/), whatever the code is, including YAML, and whatever the automation is in the pipeline, including Chef, Puppet, a DIY DSC solution or other Configuration Management solutions.

It is those concepts—and many more—that the industry often refer to when talking about **Infrastructure As Code** (and [the book from Kief Morris is a great read](https://info.thoughtworks.com/Infrastructure-as-Code-Kief-Morris.html)).

## Platform not Solution

Since its apparition with Windows 2012 R2, DSC has been announced as a platform not a solution, but what does that mean?

DSC was created to provide the bricks you need to help create Infrastructure as Code solutions for Windows, based on PowerShell (and later, cross platform, and with other languages). It’s aimed at you, individuals and organizations building a Do-it-yourself solution, or other solutions to integrate and tap into the PowerShell and DSC community and ecosystem.

The solutions, such as Microsoft’s Azure Automation DSC now Azure State Configuration, can leverage any and all of those components, and enhance them. Others, like Puppet or Chef, might only integrate the resources and execute them from their agent.

So when you look solely at DSC and documentation, you’ll see many missing bits and pieces you would expect if you think about turn-key solutions: Visualization, Reporting, certificate management, Configuration Data management… Some of those have been solved by the community, or are available in those solutions.

## The Future for DSC

Despite the few “[DSC Planning Updates](https://devblogs.microsoft.com/powershell/?s=DSC+Planning&submit=%EE%9C%A1)” written by Michael Greene (Program Manager for DSC, and DSC Community Committee member), there are still misunderstandings by the community with regards to the directions Microsoft is taking for DSC and its ecosystem.

The future is bright, and will see **changes happening on different time frames**.

Investment has been, and is still being made, and we’re just starting to see the results.

Azure Guest Configuration supports custom content, using the DSC DSL to create custom audits (now `Public Preview`). It’s a clear sign that leveraging the DSC ecosystem is still a reality for new services.

The DSC Team is investing in this DSC Community, supporting its growth, and help with its evolution. They’re actively supporting more openness, transparency, and community involvement in the DSC Resource Kit to find a more sustainable path that helps the users (`released now`).

The [PowerShell and DSC team are planning](https://github.com/PowerShell/PowerShell-RFC/pull/214) to release a cross platform `Invoke-DscResource` command that would allow to leverage PowerShell DSC Resources within scripts, running in current context, without the burden and limitations of running through the LCM as found in WMF5.1 (`in the next few months`).

And in the slightly longer term, the DSC team aims to implemented the `Set` for their new LCM, and start using it in some Azure services (`~6 months+`).

## Elements

