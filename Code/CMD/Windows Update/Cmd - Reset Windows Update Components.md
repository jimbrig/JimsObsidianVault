---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Cmd", "#Topic/Dev/Cmd"]
Alias: [ "Reset Windows Update Components" ]
---

# Reset Windows Update Components

> [!SOURCE] Sources
> - *[Additional resources for Windows Update - Windows Client - Reset Windows Update Components | Microsoft Learn](https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/additional-resources-for-windows-update#how-do-i-reset-windows-update-components)*

See Also: [[Cmd - DISM#^3aa52d|DISM > Using DISM to Repair Windows Update]] for how to use *Deployment Image Servicing and Management (DISM)* to repair and service the current machine's OS image.

## Overview

Troubleshooting and attempting to fix issues relevant to the *Windows Server Update Services*, or `WSUS` can be annoying and sometimes its easier to simply reset all the components relevant to updating windows.

All commands must be ran from an *Administrative (Elevated) Command Prompt*.

## Code

### Reset Windows Update Components

Initially its easier to run the three lines of code below to reset the Windows Update Agent:

```powershell
net stop wuauserv
rd /s /q %systemroot%\SoftwareDistribution
net start wuauserv
```

the code performs the following:

1. Stops the `wuauserv` service.
2. Removes the `C:\WINDOWS\SoftwareDistribution` directory completely.
3. Restarts the `wuauserv` service.

### Reset All Windows Update Components Manually

The manual approach is more involved and has many steps:

#### Stop Services

The first task is to stop/kill the following services:

1. Stop Services:
	- Background Intelligent Transfer Service (`BITS`)
	- Windows Update Service (`wuauserv`)
	- Cryptographic Service (`cryptsvc`)

```cmd
net stop bits
net stop wuauserv
net stop cryptsvc
```

#### Remove Network Data Files

2. Delete any `qmgr*.dat` files:

```cmd
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
```

#### Backup Folders and Reset BITS/WSUS Service's Default Security Descriptor

3a. Rename/Backup Software Distribution and `catroot2` folders:

Rename the following folders to `*.BAK`:

- `%Systemroot%\SoftwareDistribution\DataStore`
- `%Systemroot%\SoftwareDistribution\Download`
- `%Systemroot%\System32\catroot2`

> [!WARNING] NOTE
> If it is your first attempt at resolving your Windows Update issues by using the steps above, go to step 4 without carrying out the steps in step 3 below. The steps in step 3 should only be performed at this point in the troubleshooting if you can't resolve your Windows Update issues after following all steps but step 3. The steps in step 3 are also performed by the "Aggressive" mode of the Fix it Solution above.

```cmd
Ren %Systemroot%\SoftwareDistribution\DataStore DataStore.bak
Ren %Systemroot%\SoftwareDistribution\Download Download.bak
Ren %Systemroot%\System32\catroot2 catroot2.bak
```

> [!IMPORTANT] Note
> The reset step below using `sc.exe` will overwrite your existing security ACLs on the BITS and Windows Update service and set them to default. Skip this step unless the other steps to reset Windows Update components have not resolved the issue.

3b. Reset the `BITS` service and the Windows Update service to the default security descriptor.

```cmd
sc.exe sdset bits D:(A;CI;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)
```

#### Re-Register BITS and Windows Update Files

Reregister the `BITS` files and the Windows Update files. To do this, navigate to `%WINDIR%\system32` and run the following commands:

```cmd
cd /d %windir%\system32

regsvr32.exe atl.dll
regsvr32.exe urlmon.dll
regsvr32.exe mshtml.dll
regsvr32.exe shdocvw.dll
regsvr32.exe browseui.dll
regsvr32.exe jscript.dll
regsvr32.exe vbscript.dll
regsvr32.exe scrrun.dll
regsvr32.exe msxml.dll
regsvr32.exe msxml3.dll
regsvr32.exe msxml6.dll
regsvr32.exe actxprxy.dll
regsvr32.exe softpub.dll
regsvr32.exe wintrust.dll
regsvr32.exe dssenh.dll
regsvr32.exe rsaenh.dll
regsvr32.exe gpkcsp.dll
regsvr32.exe sccbase.dll
regsvr32.exe slbcsp.dll
regsvr32.exe cryptdlg.dll
regsvr32.exe oleaut32.dll
regsvr32.exe ole32.dll
regsvr32.exe shell32.dll
regsvr32.exe initpki.dll
regsvr32.exe wuapi.dll
regsvr32.exe wuaueng.dll
regsvr32.exe wuaueng1.dll
regsvr32.exe wucltui.dll
regsvr32.exe wups.dll
regsvr32.exe wups2.dll
regsvr32.exe wuweb.dll
regsvr32.exe qmgr.dll
regsvr32.exe qmgrprxy.dll
regsvr32.exe wucltux.dll
regsvr32.exe muweb.dll
regsvr32.exe wuwebv.dll
```

#### Reset WinSock

```cmd
netsh winsock reset
```

if necessary, you can set proxy settings also:

```cmd
proxycfg.exe -d
```

#### Restart Services

```cmd
net start bits
net start wuauserv   
net start cryptsvc
```

If you're running Windows Vista or Windows Server 2008, clear the BITS queue:

```cmd
bitsadmin.exe /reset /allusers
```


## Full Script

```powershell
net stop wuauserv
rd /s /q %systemroot%\SoftwareDistribution
net start wuauserv

net stop bits
net stop wuauserv
net stop cryptsvc

Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"

Ren %Systemroot%\SoftwareDistribution\DataStore DataStore.bak
Ren %Systemroot%\SoftwareDistribution\Download Download.bak
Ren %Systemroot%\System32\catroot2 catroot2.bak

sc.exe sdset bits D:(A;CI;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)

cd /d %windir%\system32

regsvr32.exe atl.dll
regsvr32.exe urlmon.dll
regsvr32.exe mshtml.dll
regsvr32.exe shdocvw.dll
regsvr32.exe browseui.dll
regsvr32.exe jscript.dll
regsvr32.exe vbscript.dll
regsvr32.exe scrrun.dll
regsvr32.exe msxml.dll
regsvr32.exe msxml3.dll
regsvr32.exe msxml6.dll
regsvr32.exe actxprxy.dll
regsvr32.exe softpub.dll
regsvr32.exe wintrust.dll
regsvr32.exe dssenh.dll
regsvr32.exe rsaenh.dll
regsvr32.exe gpkcsp.dll
regsvr32.exe sccbase.dll
regsvr32.exe slbcsp.dll
regsvr32.exe cryptdlg.dll
regsvr32.exe oleaut32.dll
regsvr32.exe ole32.dll
regsvr32.exe shell32.dll
regsvr32.exe initpki.dll
regsvr32.exe wuapi.dll
regsvr32.exe wuaueng.dll
regsvr32.exe wuaueng1.dll
regsvr32.exe wucltui.dll
regsvr32.exe wups.dll
regsvr32.exe wups2.dll
regsvr32.exe wuweb.dll
regsvr32.exe qmgr.dll
regsvr32.exe qmgrprxy.dll
regsvr32.exe wucltux.dll
regsvr32.exe muweb.dll
regsvr32.exe wuwebv.dll

netsh winsock reset

net start bits
net start wuauserv   
net start cryptsvc
```





***

## Appendix: Links and References

*Note created on [[2023-06-01 1]] and last modified on [[2023-06-01 1]].*

### Internal Linked Notes

- [[Cmd - DISM]]
- [[Cmd - wureset Script]]
- [[Cmd - Windows Update Reference]]
- [[Cmd - Reset Windows Update Components]]

- [[Code/CMD/_README|Command Line]]
- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]
- [[MOC - Microsoft|Microsoft Windows]]
- [[Windows Command Line]]

### External References



#### Backlinks

```dataview
list from [[Cmd - Reset Windows Update Components]] AND -"CHANGELOG" AND -"Code/CMD/Cmd - Reset Windows Update Components"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

