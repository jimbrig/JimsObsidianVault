---
Date: 2023-08-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Windows"]
Alias: [ "Windows Network Diagnostics" ]
---

# Windows Network Diagnostics

> [!SOURCE] Sources
> - *[Reset WinHTTP Proxy Settings in Windows 10 or 11 » Winhelponline](https://www.winhelponline.com/blog/reset-winhttp-proxy-settings/)*
> - *[WinINet vs. WinHTTP - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/wininet/wininet-vs-winhttp)*
> - 

## Overview

> [!NOTE] About
> Sometimes while using [[Windows]], you may need to diagnose or reset various [[Networking]] settings and configurations on the system such as: `WinHTTP` [[Proxy]], [[Firewall]], Network Settings, Windows Update, TCP, etc.

## How Tos

### Reset WinHTTP Proxy Settings

- `netsh`:
- `bitsadmin`:

```powershell
#Requires -RunAsAdministrator

# Use netsh to view current winhttp proxy setting
netsh.exe winhttp show proxy

# Use netsh to reset winhttp proxy
netsh.exe winhttp reset proxy

# Remove proxy settings for transferring files using BITS
bitsadmin /util /setieproxy localsystem NO_PROXY RESET
```

> [!INFO] Additional Information:
> - The [[Registry]] Keys for the `WinHTTP` settings are stored under the following keys as `REG_BINARY` values named `WinHttpSettings`:
> 	- `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections`
> 	- `HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\Connections`

### Internet Options

This method and the registry method below are for applications (e.g., Internet Explorer) that use the WinINET library instead of WinHTTP. See [WinINet vs. WinHTTP – Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/wininet/wininet-vs-winhttp).

To disable the WinINET Proxy in Internet Explorer, one can use the `inetcpl.cpl` tool (note that changes will be effected in many other apps):

- Run `inetcpl.cpl`
- Navigate to `Connections` tab, `LAN Settings`
- Check "Automatically Detect Settings"
- Uncheck "Use a Proxy Server for your LAN"

<center>

![](https://i.imgur.com/Z3cLuAQ.png)

</center>

> [!NOTE] Additional Information:
> You can also configure the above by opening **Settings > Network & Internet > Proxy** on Windows 10 and 11.


## Registry Edits

- Run `Regedit.exe`
- Navigate to `HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings`
- Edit `ProxyEnable`'s value setting it to `0`.

```registry
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]
"ProxyEnable"=dword:00000000
```

## Firewall

You may want to occasionally reset [[Windows Firewall]] settings or rules to clear any unused entries there in the aftermath of [[malware]] attack and removal, or when some of the [[Networking]] features don’t work due to misconfiguration of the [[Windows Firewall]].

![](https://i.imgur.com/xOqyroT.png)


- [[Windows Firewall]] has predefined *Inbound and Outbound connection rules* for built-in programs and services. 
- In addition, *applications create additional custom firewall rules as necessary*. 
- Over time, some of those custom firewall exceptions (rules) may become obsolete, as the user may uninstall the corresponding programs from the system.
- One can *backup existing [[Windows Firewall]] rules*, and then restore the default rules or settings using *Windows Firewall (with Advanced Security) Console* or using the `Netsh.exe` command.

***

When you create firewall rules to allow or block traffic, you can separately apply them to the Domain, Private, and Public profiles. Let’s say you’re using a laptop. These three different profiles enable laptop computers to allow incoming connections while connected to a domain network, but block connection attempts on less secure networks (such as public wireless hotspots).

1. **Domain profile** applies when a computer is connected to its Active Directory domain. If the member computer’s domain controller is accessible, this profile will be applied.
2. **Private profile** applies when a computer is connected to a private network location. By default, no networks are considered private—users must specifically mark a network location, such as their home office network, as private.
3. **Public profile** is the default profile applied to all networks when a domain controller is not available. For example, the Public profile is applied when users connect to Wi-Fi hotspots at airports or coffee shops. By default, the Public profile allows outgoing connections but blocks all incoming traffic that is not part of an existing connection.

### Windows Firewall Advanced Security Console

- To launch the Windows Firewall Advanced Security Console Window, run: `wf.msc`
- Right click on the highest level "Windows Firewall with Advanced Security on Local Computer" from navigation pane and select "Export Policy". The exported file will be saved as a `.wfw` (Windows Firewall Policy File).
- Likewise, you can also import policies.
- From the same context menu you can also Restore the Default Policy.

![](https://i.imgur.com/WrSezuZ.png)

![](https://i.imgur.com/wLZoHmw.png)


### Windows Firewall with Netsh

To exports the current Windows Firewall settings to a file using command-line, open Command Prompt as administrator, and type:

```powershell
#Requires -RunAsAdministrator
netsh advfirewall export "advfirewallpolicy.wfw"
```

The above command saves the current firewall settings to a file named `advfirewallpolicy.wfw`.

Similarly, to import the firewall rules from an existing `.wfw` firewall policy file, use the "import" parameter of `Netsh.exe`:

```powershell
#Requires -RunAsAdministrator
netsh advfirewall import "advfirewallpolicy.wfw"
```

To restore defaults:

```powershell
#Requires -RunAsAdministrator
netsh advfirewall reset

# backup and reset using single command
netsh advfirewall reset export "advfirewallpolicy.wfw"
```

To completely enable/disable:

```powershell
# Disable
netsh advfirewall set allprofiles state off

# Enable
netsh advfirewall set allprofiles state on
```

To turn **off** Windows Firewall for a particular profile, use the following command-line examples:

```powershell
netsh advfirewall set privateprofile state off
netsh advfirewall set publicprofile state off
netsh advfirewall set domainprofile state off
netsh advfirewall set currentprofile state off
```

_You can also use the **currentprofile** parameter. When you use **currentprofile**, the command effects changes for the currently active firewall profile (Public, Private or Domain). For example, your laptop may use the domain profile when at your office room, public profile when at the cafeteria etc._

To know the state of Windows Firewall for every profile, run this command:

```powershell
netsh advfirewall show allprofiles
```

You may create desktop two shortcuts to enable and disable the Windows Firewall. To run the commands as administrator, right-click on the shortcut and choose **Run as administrator**. Or right-click the shortcut properties, click **Advanced** and tick the **Run as administrator** checkbox and click **OK**. Double-clicking the shortcut run the **Netsh…** command elevated, after you click the **Continue** button in the UAC confirmation dialog.

### Windows Firewall with PowerShell

```powershell
#Requires -RunAsAdministrator
(New-Object -ComObject HNetCfg.FwPolicy2).RestoreLocalFirewallDefaults()
```

```powershell
# Disable Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Enable Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```

### Firewall Defaults

[w10_firewall_default_rules.zip (winhelponline.com)](https://www.winhelponline.com/blog/wp-content/uploads/2016/11/w10_firewall_default_rules.zip)

This restores the required entries under the following registry key: 
- `HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Defaults\FirewallPolicy\FirewallRules`

## Windows Servicing Stack Diagnostics

The Servicing Stack is the component or set of modules that install Windows updates. Additionally, it contains the component-based servicing stack (`CBS`), which is a key underlying component for several elements of Windows deployment, such as:

- `DISM`: Disk Imaging
- `SFC`: System File Checker
- Changing Windows Features or Roles
- Repairing Components

_Microsoft releases Servicing Stack Updates (`SSU`) which provide fixes to the servicing stack. Servicing stack updates improve the reliability of the update process to mitigate potential issues while installing the latest quality updates and feature updates. If you don’t install the latest servicing stack update, there’s a risk that your device can’t be updated with the latest Microsoft security fixes._

If the servicing stack is corrupt, servicing the computer is not possible; `DISM`/`SFC` won’t work, and you’ll be unable to add or remove Windows Features. Also, a repair installation using the Media Creation Tool or the `ISO` may fail if the servicing stack is corrupt.

### Windows Servicing Stack Diagnostics Script

Here’s the Windows Servicing Stack Diagnostics script I wrote, which queries the servicing stack version installed on the computer and checks the [hash checksum](https://www.winhelponline.com/blog/how-to-get-file-hash-via-right-click-menu-windows/) (SHA256) of the servicing stack modules.

- Source: [Windows Servicing Stack Diagnostics Script (github.com)](https://gist.github.com/winhelponline/9d9480e5f913cdc8c71ae4fb32969e71)

```vb
'-------------------------------------------------------------------------------------
'SSUDiag.vbs
'Gathers information about the latest Servicing Stack files installed on the computer.
'The log is written to %temp%\ssudiag.txt
'Created: Jan 21, 2023
'Updated: Jan 26, 2023 - Uses PowerShell to calculate Hashes
'More info: https://www.winhelponline.com/blog/servicing-stack-diagnosis-dism-sfc/
'-------------------------------------------------------------------------------------

Option Explicit

If WScript.Arguments.length = 0 Then
   Dim objShell: Set objShell = CreateObject("Shell.Application")
   objShell.ShellExecute "wscript.exe", Chr(34) & _
   WScript.ScriptFullName & Chr(34) & " uac", "", "runas", 1
Else
   
   Const HKEY_LOCAL_MACHINE = &H80000002
   Const ForReading = 1
   Const ForWriting = 2
   Const ForAppending = 8
   
   Dim WshShell, objFSO, sLog, f, sWinDir, i, sStackVer, sStackFldr, c, t, sLine, sAll
   Dim oReg, strKeyPath, arrValueNames, arrValueTypes, sHashLog, sCmd, arrLines, strText
   Dim objFile, objFolder, colFiles, arrFolders, fol
   Dim arrFiles, fn, sVal, sLastErr, sRegInfo, sDFlags
   
   Set WshShell = CreateObject ("WScript.Shell")
   Set objFSO = CreateObject ("Scripting.FileSystemObject")
   
   sLog = WshShell.ExpandEnvironmentStrings("%TEMP%") & "\ssudiag.txt"
   sHashLog = WshShell.ExpandEnvironmentStrings("%TEMP%") & "\hash.txt"
   
   Set f = objFSO.CreateTextFile(sLog, 1)
   f.WriteLine "SERVICING STACK DIAGNOSTICS"
   f.WriteLine String(134,"-")
   
   sWinDir = wshshell.ExpandEnvironmentStrings("%SYSTEMROOT%") & "\"
   sStackVer = 0
   c = vbCrLf
   t = vbTab
   
   'Get current servicing stack version from the Registry.
   Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & _ 
   "." & "\root\default:StdRegProv")
   strKeyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Version"
   oReg.EnumValues HKEY_LOCAL_MACHINE, strKeyPath,_
   arrValueNames, arrValueTypes
   For i = 0 To UBound(arrValueNames)
      If Replace(arrValueNames(i), ".", "") > sStackVer Then sStackVer = arrValueNames(i)
   Next
   
   On Error Resume Next
   sStackFldr = WshShell.RegRead ("HKLM\" & strKeyPath & "\" & sStackVer)
   On Error GoTo 0
   
   sStackFldr = wshshell.ExpandEnvironmentStrings(sStackFldr)
   
   arrFolders = Array ( _
   sStackFldr, _
   sWinDir & "Servicing", _
   sWinDir & "System32\Dism" _
   )
   
   f.Writeline "Stack Version: " & sStackVer
   f.WriteLine "Stack Path: " & sStackFldr
   f.WriteLine String(134,"-")
   
   For Each fol In arrFolders
      Call GetFileInfo(fol)	
      f.WriteLine "Modules in [" & fol & "] (" & (colFiles.Count) & " Files)"
      f.WriteLine String(134,"-")
      '      f.WriteLine "Filename" & t & t & t & _
      '      "Modified" & t & t & t & "Version"
      
      f.WriteLine "Filename" & t & t & t & _
      "Modified" & t & t & "Version"& t & t & t & "Size (bytes)"
      
      f.WriteLine String(134,"-")
      f.Write sAll
      f.WriteLine String(134,"-")
      
      Call GetFileHash(fol)
      f.WriteLine String(134,"-")
      
   Next
   
   Sub GetFileInfo(sFldr)
      sAll=""
      Set objFolder = objFSO.GetFolder(sFldr)
      Set colFiles = objFolder.Files
      For Each objFile In colFiles
         sAll = sAll & objFile.Name & Space(30 - Len(objFile.Name)) & _
         t & objFile.DateLastModified & _
         t & objFSO.GetFileVersion(objFile) & Space(15 - Len(objFSO.GetFileVersion(objFile))) & _
         t & t & Space(11 - Len(FormatNumber(objFile.Size, 0))) & FormatNumber(objFile.Size, 0) & c
      Next
   End Sub
   
   Sub GetFileHash(sFldr)
      If objFSO.FileExists (sHashLog) Then objFSO.DeleteFile sHashLog, 1
      sCmd = "powershell -WindowStyle Minimized -command GCI -Path " & sFldr & _
      " | get-filehash -algorithm SHA256 | select hash, path | ft | " & _
      "out-file -Width 512 $env:TEMP\hash.txt  -Encoding UTF8"
      
      WshShell.Run sCmd, 0, 1
      
      Set f = objFSO.OpenTextFile(sHashLog, ForReading)
      strText = f.ReadAll
      f.Close
      arrLines = Split(strText, c)   
      
      'Write File Hashes to the log file
      Set f = objFSO.OpenTextFile(sLog, ForAppending)
      sAll = ""
      f.WriteLine "File Hash [SHA256]  - " & sFldr
      f.WriteLine String(134,"-")
      
      arrLines = Split(strText, c)
      Dim line, arrSplit
      For Each line In arrLines
         If InStr(line, ":") > 0 Then
            line = Replace(line, sFldr & "\", "")
            arrSplit = Split(line, " ")
            line = Trim(arrSplit(1)) & Space(30 - Len(arrSplit(1))) & t & Trim(arrSplit(0))
            sAll = sAll & line & c
         End If
      Next
      f.WriteLine sAll
   End Sub
   
   'Check for IFEO entries   
   arrFiles = Array ( _ 
   "dismhost.exe", _
   "trustedinstaller.exe", _
   "tiworker.exe", _
   "dism.exe", _
   "TiFileFetcher.exe" _
   )
   
   For Each fn In arrFiles
      
      On Error Resume Next
      sVal = WshShell.RegRead _
      ("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\" & _
      fn & "\Debugger")
      
      sLastErr = err.number
      err.Clear
      On Error GoTo 0
      
      If hex(sLastErr) <> "80070002" Then
         sDFlags = 1
         sRegInfo = sRegInfo & c & fn & " (IFEO points to) => " & sVal         
      End If
   Next 
   
   If sDFlags = 0 Then
      sRegInfo = "No IFEO Overrides present for core servicing files. Good!"
   Else
      sRegInfo = "REGISTRY ISSUES" & c & String(134,"-") & c & _
      "::IMPORTANT:: Some IFEO entries are present. Please remove them!!" & c & sRegInfo & c & _ 
      string(134,"-")
   End If
   
   f.WriteLine "REGISTRY: " & sRegInfo
   f.WriteLine string(134,"-")
   f.Close
   
   WshShell.Run "cmd.exe /c ver >> " & sLog, 0, 1
   WshShell.Run "cmd.exe /c wmic qfe get hotfixid,installedon | sort >> " & sLog, 0, 1
   
   If objFSO.FileExists (sHashLog) Then objFSO.DeleteFile sHashLog, 1
   Set f = objFSO.OpenTextFile(sLog, ForAppending)
   
   f.WriteLine string(134,"-")
   f.WriteLine "LOADED MODULES (Before starting DISM SCANHEALTH) at " & Now
   f.WriteLine string(134,"-")
   f.WriteLine t & "See [%TEMP%\modules1.txt]"
   WshShell.Run "cmd /c tasklist.exe /m /fo list >%temp%\modules1.txt", 0, 1
   WshShell.Run "dism.exe /online /cleanup-image /scanhealth", 1, 0
   WScript.Sleep 10000
   f.WriteLine string(134,"-")
   f.WriteLine "LOADED MODULES (During DISM SCANHEALTH) at " & Now
   f.WriteLine string(134,"-")
   f.WriteLine t & "See [%TEMP%\modules2.txt]"
   WshShell.Run "cmd /c tasklist.exe /m /fo list >%temp%\modules2.txt", 0, 1
   f.WriteLine string(62,"-") & "END OF LOG" & string(62,"-")
   f.Close
   WshShell.Run sLog
   
   Set WshShell = Nothing
   Set objFSO = Nothing
   Set oReg = Nothing
End If
```

The script produces the following log files in the `%TEMP%` folder:

- `ssudiag.txt` – Contains the list of servicing stack modules, their version, and hash.
- `modules1.txt` – Contains the list of loaded modules before starting `DISM .. /SCANHEALTH`
- `modules2.txt` – Contains the list of loaded modules after starting `DISM .. /SCANHEALTH`



***

## Appendix: Links and References

*Note created on [[2023-08-16]] and last modified on [[2023-08-16]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Windows Network Diagnostics]] AND -"CHANGELOG" AND -"Guides/Windows/Windows Network Diagnostics"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

