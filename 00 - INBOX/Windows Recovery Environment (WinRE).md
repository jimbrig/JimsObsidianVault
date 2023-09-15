---
Date: 2023-08-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Guide", "#Topic/Windows"]
Aliases: [ "Windows Recovery Environment", "WinRE" ]
---

# Windows Recovery Environment (WinRE)

> [!SOURCE] Sources
> - *[Getting Started with Windows Recovery Environment (WinRE) | Windows OS Hub (woshub.com)](https://woshub.com/restoring-windows-recovery-environment-winre-in-windows-10/)*

## Contents

- [Overview](#overview)
- [Details](#details)
- [Guides](#guides)
	- [How to Boot Into the Windows Recovery Environment](#how-to-boot-into-the-windows-recovery-environment)
	- [Windows Recovery Tools](#windows-recovery-tools)
	- [How to Enable or Disable WinRE](#how-to-enable-or-disable-winre)
	- [How to Repair WinRE](#how-to-repair-winre)
	- [How to Recreate WinRE](#how-to-recreate-winre)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

> [!NOTE] About
> *Description of note contents.*

The **Windows Recovery Environment (WinRE)** is a minimal operating system based on the **[[Windows Preinstallation Environment (WinPE)]]** image that includes a number of tools to repair, reset and diagnose Windows. 

If Windows fails to boot, the `BCD` boot loader will attempt to start the `WinRE` environment, which can automatically fix problems or provide access to recovery tools. 

In `WinRE`, you can fix the bootloader configuration, restore the [[Operating System]] from an image backup, roll back to a system restore point, run a [[command prompt]], etc.

## Details

Windows RE consists of three files on a hidden **Recovery Partition** (in older versions of Windows, this partition was known as the [System Reserved partition](https://woshub.com/fix-cant-boot-after-accidentally-deleted-system-reserved-partition/).)

- **[[Winre.wim]]** – [[WIM]] image with [[WinPE]] environment that includes additional [[Windows]] recovery tools
- **[[boot.sdi]]** – a [[System Deployment Image (SDI)]] file used to create an in-memory WinRE [RAM Disk](https://woshub.com/create-ram-disk-windows-server/)
- **[[ReAgent.xml]]** - Windows RE configuration file.

[![windows recovery environment files on system reserved partition (winre.wim, boot.sdi, ReAgent.xml) )](https://woshub.com/wp-content/uploads/2017/04/windows-recovery-environment-files-on-system-reserved-partition.jpg.webp)](https://woshub.com/wp-content/uploads/2017/04/windows-recovery-environment-files-on-system-reserved-partition.jpg)

## Guides

- [How to Boot Into the Windows Recovery Environment](#how-to-boot-into-the-windows-recovery-environment)
- [Windows Recovery Tools](#windows-recovery-tools)
- [How to Enable or Disable WinRE](#how-to-enable-or-disable-winre)
- [How to Repair WinRE](#how-to-repair-winre)
- [How to Recreate WinRE](#how-to-recreate-winre)

### How to Boot Into the Windows Recovery Environment

To boot your computer into the Windows Recovery, hold down `Shift` and click the `Restart` button on the [[Start Menu]].

[![force boot into winre from windows 10](https://woshub.com/wp-content/uploads/2017/04/boot-into-winre-from-windows.jpg.webp)](https://woshub.com/wp-content/uploads/2017/04/boot-into-winre-from-windows.jpg)

You can also restart the computer in WinRE mode from the [[command prompt]] using the `/o` option of the [shutdown command](https://woshub.com/shutdown-restart-windows-cmd/):

```powershell
shutdown /f /r /o /t 0
```

[![shutdown -o (parameter to boot into winre)](https://woshub.com/wp-content/uploads/2017/04/shutdown-o.jpg.webp)](https://woshub.com/wp-content/uploads/2017/04/shutdown-o.jpg)

There is another command to force the system to boot into the Recovery Environment the next time the computer boots: `reagentc /boottore`.

- The recovery environment should start automatically if there are problems with the normal Windows Boot Process. 
- For example, if three previous attempts to start Windows normally have failed, the computer will automatically boot into the Windows Recovery environment. 
- This means that to boot your computer into WinRE, all you have to do is interrupt Windows boot by pressing the **power button 3 times in a row**.

### Windows Recovery Tools

There are a number of tools available in the WinRE recovery environment that will allow you to fix a variety of problems with Windows:

- **Reset this PC** – allows you to reset your Windows to factory settings (personal data and files will be deleted);
- **System Restore** – allows you to restore Windows from a previously created restore point;
- **System Image Recovery** – full Windows recovery from a [system image backup](https://woshub.com/how-to-create-full-system-image-backup-in-windows-10/) on external media;
- **Automatic Repair/Start-up Repair** – Windows tries to find and fix problems automatically: the wizard can repair the [Windows bootloader](https://woshub.com/how-to-repair-uefi-bootloader-in-windows-8/), [BCD configuration, and MBR (Master Boot Record)](https://woshub.com/how-to-rebuild-bcd-file-in-windows-10/)
- **Uninstall Updates** – allows to remove the recently installed updates (useful if [Windows won’t boot after installing updates](https://woshub.com/windows-wont-boot-after-updates/));
- **Startup Settings** – allows you to select different Windows boot scenarios: boot the computer in Safe Mode, disable driver digital signature enforcement, [disable the automatic Windows restart on system failure](https://woshub.com/disable-autorestart-system-failure-windows/) (this is the only way to see the BSOD error code on the Windows boot screen);
- **Go back to the previous version** – allows you to roll back to the previous Windows version (after you have [upgraded your Windows build](https://woshub.com/upgrade-windows-10-build-setup-exe-cmd/));
- **Command Prompt** – open a command prompt to manually run diagnostic and repair commands;
- **UEFI Firmware Settings** – automatically open the computer’s UEFI settings the next time it boots;

[![winre tools](https://woshub.com/wp-content/uploads/2017/04/winre-tools.jpg.webp)](https://woshub.com/wp-content/uploads/2017/04/winre-tools.jpg)

If you want to run a command prompt or any other troubleshooting tool, WinRE will ask you to enter the password for a local administrator account (the credentials are checked against the local SAM database.). However, it is possible to [reset the local administrator password on Windows](https://woshub.com/reset-local-administrator-password-windows/).

> [!NOTE]
> In [[Windows 11]], most of the tools in the Recovery environment are available to you without having to enter an administrator password.

You should see a command prompt **X:\Windows\System32>.**

From the WinRE command prompt, you can check the disk with the [chkdsk](https://woshub.com/view-check-disk-chkdsk-results-in-windows-10/), [check the Windows image with DISM and sfc.exe](https://woshub.com/dism-cleanup-image-restorehealth/), run `regedit`, `bootrec`, `startrep` (this tool allows you to find and fix problems with the registry, drivers, and partitions), run memory diagnostics with the `mdsched` command, etc.

To close the WinRE command prompt and return to the boot mode selection, run the command: `exit`.

### How to Enable or Disable WinRE

You can check whether Windows Recovery Environment is enabled on your computer: `reagentc /info`.

The command displays the current configuration of the Windows Recovery Environment. In this example, WinRE is enabled:

```powershell
reagentc /info
```

![](https://i.imgur.com/87NZOni.png)

This command also returns the WinRE entry identifier in the [[Boot Configuration Data (BCD)]] and the path to the Windows RE image:

- Location: `\\?\GLOBALROOT\device\harddisk0\partition4\Recovery\WindowsRE`

In order to activate/disable the recovery environment in Windows, use the following commands:

```powershell
# Enable
reagentc /enable

# Disable
reagentc /disable
```

> [!TIP] 
> Windows Recovery Environment Logs are stored in a file located at `%WINDIR%\System32\LogFiles\Srt\SrtTrail.txt`.

To move WinRE from the recovery partition to the system drive, check the post [Cannot extend volume in Windows](https://woshub.com/extend-volume-blocked-by-windows-recovery-partition/).

### How to Repair WinRE

The simplest way to repair the Windows recovery environment configuration is to disable and enable WinRE (see above).

The `reagentc` should update the BCD boot loader configuration and add entries for the WinRE environment.

If you have [converted a hard disk partition table from MBR to GPT using the MBR2GPT tool](https://woshub.com/converting-mbr-to-gpt-with-mbr2gpt-in-windows-10/), you may encounter the error:

```text
MBR2GPT: Failed to update ReAgent.xml, please try to manually disable and enable WinRE.
```

To fix this, you need to reboot and manually disable and enable WinRE.

If you receive the error `REAGENTC.EXE: Unable to update Boot Configuration Data`, first fix the problem with the Windows bootloader (instructions for [UEFI](https://woshub.com/how-to-repair-uefi-bootloader-in-windows-8/) and [BIOS](https://woshub.com/how-to-rebuild-bcd-file-in-windows-10/) computers).

The reagent command may return an error:

```text
REAGENTC.EXE: The Windows RE image was not found.
```

This usually means that the [[Winre.wim]] file is missing or the System Restore partition has been deleted. If this is the case, you will need to try to repair the WinRE environment.

Check that the Boot Configuration Data (BCD) configuration has the correct entries to boot the WinRE environment:

```powershell
bcdedit /enum all
```

In the list of boot options, find the **Windows Boot Loader** section, with **identifier={current}**. This entry looks like this in our example:

```text
Windows Boot Loader
-------------------
identifier              {current}
device                  partition=C:
path                    \Windows\system32\winload.exe
description             Windows 10
locale                  en-US
inherit                 {bootloadersettings}
recoverysequence        {7c817935-e52f-11e6-9c2c-0050569efccb}
recoveryenabled         Yes
allowedinmemorysettings 0x15000075
osdevice                partition=C:
systemroot              \Windows
resumeobject            {1c7df7a0-4560-11e5-9675-8451eaa913bb}
nx                      OptIn
bootmenupolicy          Standard
```

Find and remember the GUID value of the `recoverysequence` attribute. For example, it is `{7c817935-e52f-11e6-9c2c-0050569efccb}`.

Then you need to find the boot configuration section with the **identifier** value equal to the GUID value obtained earlier and with the **Windows Recovery Environment** in the **description** field. This entry can look like this:

```text
Windows Boot Loader
-------------------
identifier              {7c817935-e52f-11e6-9c2c-0050569efccb}
device                  ramdisk=\Device\HarddiskVolume4\WindowsRE\Winre.wim,{7c817936-e52f-11e6-9c2c-0050569efccb}
path                    \windows\system32\winload.exe
description             Windows Recovery Environment
locale                  en-US
inherit                 {bootloadersettings}
displaymessage          Recovery
osdevice                ramdisk=\Device\HarddiskVolume4\Recovery\WindowsRE\Winre.wim,{7c817936-e52f-11e6-9c2c-0050569efccb}
systemroot              \windows
nx                      OptIn
bootmenupolicy          Standard
winpe                   Yes
```

The full path to the recovery environment WIM image is given in the Device line. 

In this example, it is located on hard disk partition 4 (HarddiskVolume4) at the path: `\Recovery\WindowsRE\Winre.wim`.

To forcefully set the path to the WIM image on this partition in the WinRE configuration, run the command:

```powershell
REAGENTC.EXE /setreimage /path \\?\GLOBALROOT\device\harddisk\partition4\Recovery\WindowsRE`
```

If this partition exists, you can bind this boot loader entry to boot `WinRE` as the recovery environment for the current OS image.

Copy the GUID of the found entry and use it in the following command:

```powershell
bcdedit /set {current} recoverysequence {FoundGUID}
```

> [!NOTE] 
> If you are using a multi-boot configuration, remember that each operating system adds its own Windows Recovery Environment entry to the Microsoft Boot Manager. It is important not to get confused here.

Make sure that the **Winre.wim** file is located in the specified path. It is usually stored in one of the following locations (folders are hidden)

- `C:\Windows\System32\Recovery`
- On a separate, hidden Recovery Partition (or Reserved Partition)
- On the manufacturer’s OEM recovery partition (make sure you haven’t [deleted the OEM recovery partition](https://woshub.com/how-to-delete-oem-recovery-partition-using-diskpart/)).

Then check the path to the `wim` file that is specified in the **[[ReAgent.xml]]** file (which is located in the `C:\Windows\System32\Recovery` directory or in the Recovery directory on the recovery partition).

Run `notepad c:\Windows\System32\Recovery\ReAgent.xml`.

Open the configuration file with any editor and check the value of the `<WinreLocation path =` attribute. 

If the specified path is not available (the original partition has been deleted), you can change the path to `<ImageLocation path= "\Recovery\WindowsRE"`), create the `C:\Recovery\WindowsRE` directory, and copy the `Winre.wim` file into it.

Finally, disable and re-enable WinRE: `reagentc /disable; reagentc /enable`.

### How to Recreate WinRE


If you cannot find `winre.wim` in any of the default directories, try searching for it using a file manager or with the following command:

```powershell
DIR /a /s C:\winre.wim
```

> [!TIP] Tip
> Remember to look for this file on the hidden partitions, which you must first assign a drive letter.

If you find the file, copy it to the default location using the commands:

```powershell
ATTRIB -h -s C:\Recovery\<path>\winre.wim
XCOPY /h C:\Recovery\<path>\winre.wim C:\Windows\System32\Recovery
```

If you do not have a WinRE WIM image on the disc, you can copy the file from a computer with a similar version of Windows (OS version and bitness must match),  or from a Windows installation media (for example, [bootable USB flash drive with Windows](https://woshub.com/how-to-create-uefi-bootable-usb-drive-to-install-windows-7/) or ISO image).

In this example, the Windows installation ISO image is used as the source of the WinRE files.

Open the ISO image using [[7-Zip]], select the `\sources\install.wim` (or [install.esd](https://woshub.com/how-to-convert-install-esd-in-to-iso-image/)) file and extract the `\Windows\System32\Recovery\Winre.wim` and `ReAgent.xml` files to `C:\Windows\System32\Recovery` folder. Then copy the original `boot.sdi` file from the `\Windows\Boot\DVD` folder.

> [!NOTE] Note
> You can replace the default winre.wim image with an advanced [DaRT 10 recovery image](https://woshub.com/create-dart-10-recovery-image/) which contains additional tools that can help you diagnose and fix Windows problems

- Delete the [[ReAgent.xml]] file that contains the old WinRE configurations:

```powershell
REN "C:\Windows\System32\Recovery\ReAgent.xml" "ReAgent.xml.bak"
```

- Replace the path to the `winre.wim` file in the Recovery Agent configuration:

```
reagentc /setreimage /path "C:\windows\system32\recovery"

REAGENTC.EXE: Operation Successful.
```

The command will return an error if the `winre.wim` file does not exist in the destination directory:

```text
REAGENTC.EXE: No valid image found in the specified path.
```

- It remains to enable the Windows Recovery Agent with the command:

```powershell
reagentc /enable
```
  
In this case, the Windows recovery environment files are stored on the system drive `C:\`.


***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

- [[ReAgent.xml]]
- [[Winre.wim]]
- [[Windows CMD - BCDEdit|BCDEdit]]
- [[Windows CMD - REAGENTC|REAGENTC]]
- [[MOC - Microsoft Windows|Microsoft Windows]]
- [[Windows Command Line]]
- [[03 - AREAS/Technology/Programming/Programming Languages/PowerShell/PowerShell|PowerShell]]
- [[03 - AREAS/Code/Cmd/_README|Command Line]]

### External References

- [Getting Started with Windows Recovery Environment (WinRE) | Windows OS Hub (woshub.com)](https://woshub.com/restoring-windows-recovery-environment-winre-in-windows-10/)

#### Backlinks

```dataview
list from [[Windows Recovery Environment (WinRE)]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Tools/Windows Recovery Environment (WinRE)"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

