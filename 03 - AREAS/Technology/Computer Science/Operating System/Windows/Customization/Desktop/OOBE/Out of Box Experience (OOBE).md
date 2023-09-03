---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Out of Box Experience (OOBE)

> [!SOURCE] Sources
> - *[Customize the Out of Box experience (OOBE) | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-oobe-in-windows-11)*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

When customers turn on their Windows 11 PCs for the first time, they'll see the Windows Out of Box Experience (OOBE). OOBE is a series of screens that require customers to accept license agreements, connect to the internet, log in with, or sign up for a Microsoft Account (MSA), and share information with the OEM. The choices you make in your hardware and software determine how much work customers must do to complete OOBE before they can enjoy their new devices.

The OOBE flow is also designed to reduce cognitive load significantly by breaking up tasks into discrete chunks. Although there are several pages in the OOBE flow, each one requests a specific action or input from the user. This is helpful for our average customer (and even many power users) and has shown to reduce fatigue significantly.

## OOBE Flow

The following is a non-exhaustive list of screens the user may see during OOBE. The order below is the generally expected order of pages, however, some pages may not appear or may appear in a different order than the flow below.

1. **Language selection**
2. **Region selection**
3. **Keyboard selection**
4. **Connect to a network**. Note that connecting to a network is required to complete OOBE on Home SKUs.
5. **Download of critical patches and driver updates**. See [Windows updates during OOBE](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/windows-updates-during-oobe-in-windows-11) for more details.
6. **End User License Agreement (EULA)**
7. **Sign in to, or create, a local account or Microsoft account (MSA)**.
8. **Welcome back**. This screen displays if a user logs in with a Microsoft account and has previously backed up a Windows device.
9. **Windows Hello setup**
10. **Privacy settings**. Users will see up to seven privacy settings on this screen. Not all users will see the same settings.
11. **Customize your device**. See [Device usage intent](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/oobe-screen-details-in-windows-11#device-usage-intent) for more details
12. **Save files to OneDrive**
13. **Microsoft 365 trial**
14. **OEM Registration pages**. See [Design guidance for OEM registration pages](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/registration-pages-oobexml-in-windows-11) for design guidance.
15. **Get the latest from Windows**.


## Re-Boot Scenarios

A device will reboot during OOBE if one or more of the following occurs:

- A customer chooses a language that isn't the default language.
- A device downloads a ZDP update during OOBE.
- If an updated version of Windows is installed.

After a reboot, a device will repeat one or more pages during OOBE if any of the following occurs:

- A device didn't previously connect to a network
- A device loses its network connection during the reboot.

## Reaching the Desktop and the Quiet Period

When a user completes OOBE and get to the desktop, they'll see a calm experience. Windows has a post-OOBE quiet period during which no apps automatically launch to show any UI. Background services can run, but can't show on the screen.

Instead of automatically launching apps, Windows automatically opens the Start menu to encourage customers to familiarize themselves with Windows and see the apps that Microsoft and OEMs have pinned to the Start menu.

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Out of Box Experience (OOBE)]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Customization/Desktop/Out of Box Experience (OOBE)"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

