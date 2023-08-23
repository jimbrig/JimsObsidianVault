---
Date: 2023-08-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "Windows Security" ]
---

# Windows Security

> [!NOTE] About
> This note showcases various [[Reference/Technology/Programming/Programming Languages/PowerShell/PowerShell|PowerShell]] scripts, functions, and cmdlets for automating [[Windows Defender Firewall]] Management. The code is designed for use by IT professionals, System Administrators, IT Managers, and others who use and need to automate [[Windows Defender Firewall]] management on a [[Reference/Technology/Computer Science/Operating System/Windows]] Operating System.

## Contents

- [Code](#code)
- [Details](#details)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Overview

You can use [[Windows PowerShell]] to manage your [[firewall]] and [[IPsec]] deployments. This [[object-oriented]] scripting environment will make it easier for you to manage policies and monitor network conditions than was possible in `netsh`. 

[[Windows PowerShell]] allows network settings to be self-discoverable through the syntax and parameters in each of the `cmdlets`. This guide demonstrates how common tasks were performed in `netsh` and how you can use [[Windows PowerShell]] to accomplish them.

In future versions of Windows, Microsoft might remove the `netsh` functionality for [[Windows Defender Firewall]]. Microsoft recommends that you transition to Windows PowerShell if you currently use `netsh` to configure and manage Windows Defender Firewall.

> [!INFO] See Also
> Windows PowerShell and `netsh` command references are at the following locations:
> - *[Netsh Commands for Windows Defender Firewall](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc771920(v=ws.10))*


## Set Profile Global Defaults

Global defaults set the device behavior in a per-profile basis. Windows Defender Firewall supports `Domain`, `Private`, and `Public` profiles.

### Enable Windows Defender Firewall with Advanced Security

[[Windows Defender Firewall]] drops traffic that doesn't correspond to allowed unsolicited traffic, or traffic that is sent in response to a request by the device. 

If you find that the rules you create aren't being enforced, you may need to enable [[Windows Defender Firewall]]. Here's how to enable Windows Defender Firewall on a local domain device:

- Using `netsh`:

```cmd
netsh advfirewall set allprofiles state on
```

- Using [[PowerShell]]:

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```


### Control Defender Firewall with Advanced Security Behavior

The global default settings can be defined through the command-line interface. These modifications are also available through the Windows Defender Firewall with Advanced Security console.

The following scriptlets set the default inbound and outbound actions, specifies protected network connections, and allows notifications to be displayed to the user when a program is blocked from receiving inbound connections. It allows unicast response to multicast or broadcast network traffic, and it specifies logging settings for troubleshooting.

- Using `netsh`:

```cmd
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound
netsh advfirewall set allprofiles settings inboundusernotification enable
netsh advfirewall set allprofiles settings unicastresponsetomulticast enable
netsh advfirewall set allprofiles logging filename %SystemRoot%\System32\LogFiles\Firewall\pfirewall.log
```

- Using [[PowerShell]]:

```powershell
Set-NetFirewallProfile `
	-DefaultInboundAction Block ` 
	-DefaultOutboundAction Allow `
	–NotifyOnListen True `
	-AllowUnicastResponseToMulticast True `
	–LogFileName "$Env:SystemRoot\System32\LogFiles\Firewall\pfirewall.log"
```

### Disable Defender Firewall with Advanced Security

Microsoft recommends that you don't disable Windows Defender Firewall because you lose other benefits provided by the service, such as the ability to use Internet Protocol security (IPsec) connection security rules, network protection from attacks that employ network fingerprinting, [Windows Service Hardening](https://go.microsoft.com/fwlink/?linkid=104976), and [boot time filters](https://blogs.technet.microsoft.com/networking/2009/03/24/stopping-the-windows-authenticating-firewall-service-and-the-boot-time-policy/).

Disabling Windows Defender Firewall with Advanced Security can also cause problems, including:

- Start menu can stop working
- Modern applications can fail to install or update
- Activation of Windows via phone fails
- Application or OS incompatibilities that depend on Windows Defender Firewall

Microsoft recommends disabling Windows Defender Firewall only when installing a third-party firewall, and resetting Windows Defender Firewall back to defaults when the third-party software is disabled or removed.

If disabling Windows Defender Firewall is required, don't disable it by stopping the Windows Defender Firewall service (in the **Services** snap-in, the display name is Windows Defender Firewall and the service name is MpsSvc). Stopping the Windows Defender Firewall service isn't supported by Microsoft.

Non-Microsoft firewall software can programmatically disable only the parts of Windows Defender Firewall that need to be disabled for compatibility. You shouldn't disable the firewall yourself for this purpose.

The proper method to disable the Windows Defender Firewall is to disable the Windows Defender Firewall Profiles and leave the service running.

Use the following procedure to turn off the firewall, or disable the Group Policy setting **Computer Configuration|Administrative Templates|Network|Network Connections|Windows Defender Firewall|Domain Prolfile|Windows Defender Firewall:Protect all network connections**. For more information, see [Windows Defender Firewall with Advanced Security deployment guide](https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/windows-firewall-with-advanced-security-deployment-guide).

The following example disables Windows Defender Firewall for all profiles.

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
```

## Deploy Basic Firewall Rules

This section provides scriptlet examples for creating, modifying, and deleting firewall rules.

### Create Firewall Rules

Adding a firewall rule in Windows PowerShell looks a lot like it did in Netsh, but the parameters and values are specified differently.

Here's an example of how to allow the Telnet application to listen on the network. This firewall rule is scoped to the local subnet by using a keyword instead of an IP address. Just like in Netsh, the rule is created on the local device, and it becomes effective immediately.

- Using `netsh`:

```powershell
netsh advfirewall firewall add rule name="Allow Inbound Telnet" dir=in program= %SystemRoot%\System32\tlntsvr.exe remoteip=localsubnet action=allow
```

- Using [[PowerShell]]:

```powershell
New-NetFirewallRule `
	-DisplayName "Allow Inbound Telnet" `
	-Direction Inbound `
	-Program "$Env:SystemRoot\System32\tlntsvr.exe" `
	-RemoteAddress LocalSubnet `
	-Action Allow
```

The following scriptlet shows how to add a basic firewall rule that blocks outbound traffic from a specific application and local port to a Group Policy Object (GPO) in Active Directory. In Windows PowerShell, the policy store is specified as a parameter within the **New-NetFirewall** cmdlet. In Netsh, you must first specify the GPO that the commands in a Netsh session should modify. The commands you enter are run against the contents of the GPO, and the execution remains in effect until the Netsh session is ended or until another set store command is executed.

Here, **domain.contoso.com** is the name of your Active Directory Domain Services (AD DS), and **gpo_name** is the name of the GPO that you want to modify. Quotation marks are required if there are any spaces in the GPO name.

```powershell
netsh advfirewall set store gpo=domain.contoso.com\gpo_name
netsh advfirewall firewall add rule name="Block Outbound Telnet" dir=out program=%SystemRoot%\System32\telnet.exe protocol=tcp localport=23 action=block
```

```powershell
New-NetFirewallRule `
	-DisplayName "Block Outbound Telnet" `
	-Direction Outbound `
	-Program "$Env:SystemRoot\System32\tlntsvr.exe" `
	–Protocol TCP `
	–LocalPort 23 `
	-Action Block `
	–PolicyStore 'domain.contoso.com\gpo_name'
```



## Code

*Link: <<% tp.file.cursor(2) %>>*

```powershell

```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-08-12]] and last modified on [[2023-08-12]].*

### Internal Linked Notes

- [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[PowerShell - Windows Security]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - Windows Security"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

