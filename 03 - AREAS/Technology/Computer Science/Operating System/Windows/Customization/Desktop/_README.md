---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Readme", "#Topic/Meta"  ]
Alias: [ "Desktop" ]
---

# Desktop

> [!NOTE] About
> This folder houses documentation and reference for customizing [[Reference/Technology/Computer Science/Operating System/Windows]] Desktop Devices.

## Overview

There are the following options to customize the [[Reference/Technology/Computer Science/Operating System/Windows]] image with regard to customizing the Desktop Experience.

Depending on which options are used, one must employ the associated method or choice of methods to apply the customization:

| Feature | Unattend | Modification File|
|:---:|:---:|:---:|
| [[Taskbar]] | Subset | `TaskbarLayoutModification.xml` |
| [[Start Menu Layout\|Start Layout]] | Subset | `LayoutModification.xml` |
| [[Out of Box Experience (OOBE)]] | Subset | `OOBE.xml` |
| [[Dark Mode]] | Yes | `Unattend.xml` |
| [[Get Help App]] | Yes | `Unattend.xml` |
| [[03 - AREAS/Technology/Computer Science/Operating System/Windows/Customization/Desktop/Themes/Colors]] | Yes | `Unattend.xml` |

> [!NOTE] 
> All desktop customization options listed above are supported in Windows 10 in S mode. 
> To learn more, see [Windows 10 in S mode manufacturing overview](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-10-s-overview).

## Contents

- Customize the [[Taskbar]]: You can pin *up to three additional apps to the taskbar by adding a taskbar layout modification file*, for example, `TaskbarLayoutModification.xml`. 
	- You can specify different taskbar configurations based on SKU, device locale, or region.
- Customize the [[Start Layout]]: Learn how to customize the Start menu with a group of your own tiles.
- Customize the [[Out of Box Experience (OOBE)]]: When customers turn on their Windows PCs for the first time, they will see the Windows Out of Box Experience (OOBE). Customize OOBE to determine how much work customers must do to complete the OOBE screens before they can enjoy their PCs running Windows 10.
- [Customize the Retail Demo Experience (RDX)](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/retail-demo-experience): Showcase your new devices on the retail sales floor with a rich, engaging videos and experiences.
- [Customize the Windows Power Slider](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-power-slider): The [[Windows Performance Power Slider]] enables end customers to quickly and intelligently trade performance of their system for longer battery life. 
	- You can set the default slider mode for both AC and DC, and configure the power settings and PPM options that are engaged in each power slider mode.
- Set [[Dark Mode]] (See Also: [Set Dark Mode (microsoft-learn)](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/set-dark-mode)) 
	- This personalization setting for end users allows them to express preference whether to see applications which support the setting in a dark or light mode.
	- You can set the dark mode as the default for apps using `Unattend`.
- [Customize the Get Help app](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-get-help-app): 
	- The Get Help App empowers customers to self-help with [[troubleshooters]], instant answers, Microsoft support articles, and more, before contacting assisted support. 
	- You can customize the Get Help app to surface your support app or support website.
- [Customize SIM card slot names](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-sim-card-slot-names):
	- You can customize the names of SIM card slots on the device to more easily differentiate between them. 
	- For example, if the device has both an embedded SIM slot and an external SIM slot, customizing the names will help your customers understand which is which.
- [Customize a Specific Absorption Rate mapping table](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-sar-mapping-table):
	- You can configure and store a Specific Absorption Rate (SAR) table for mobile broadband modems in the registry.
	- When a mobile broadband modem is connected to the Windows device, Windows automatically uses the table to map the mobile country code (MCC) of the modem's registered mobile operator (MO) to its appropriate SAR back-off index, and configures the modem with it.
- [Pen and Windows Ink](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/pen-and-ink):
	- You can create an advanced Pen settings app, or link to your own apps, in the Pen and Windows Ink settings.
- [Windows SIM Technical Reference](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/wsim/windows-system-image-manager-technical-reference):
	- Settings reference for [[Windows System Image Manager]].
- [Unattended Windows Setup Reference](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/):
	- Settings reference for [[Unattend]].

```ccard
type: folder_brief_live
```
 

## Contents

```dataview
LIST FROM "03 - AREAS/Technology/Windows/Customization/Desktop" AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Customization/Desktop/_README"
```

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[_README]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Customization/Desktop/_README"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023
