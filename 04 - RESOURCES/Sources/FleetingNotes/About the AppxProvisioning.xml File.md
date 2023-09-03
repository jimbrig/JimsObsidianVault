---
ID: f5d86339-668e-4102-99aa-cab3fa0c7cd4
Date Created: 2023-03-22
Date Modified: 2023-03-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "About the AppxProvisioning.xml File"
Sources: ["https://www.exefiles.com/en/xml/appxprovisioning-xml/", "https://learn.microsoft.com/en-us/powershell/module/dism/add-appxprovisionedpackage?view=windowsserver2022-ps" ]
ImageURL: "https://www.addictivetips.com/app/uploads/2018/02/download-appx-file.jpg"
Tags:
  - "#Topic/Windows"
  - "#Type/Note"
  - "#Status/Fleeting"
Aliases:
  - "AppxProvisioning.xml"
---

# About the `AppxProvisioning.xml File` on Windows

> [!SOURCE] Sources
> - *[Repair AppxProvisioning.xml Issues (How to Download and Fix) (exefiles.com)](https://www.exefiles.com/en/xml/appxprovisioning-xml/)*
> - *[Add-AppxProvisionedPackage (DISM) | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/dism/add-appxprovisionedpackage?view=windowsserver2022-ps)*
> - *[DISM Module | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/dism/?view=windowsserver2022-ps)*

## Overview

- `AppxProvisioning.xml` uses the [XML](https://www.exefiles.com/en/software/microsoft/microsoft-office-access-2010/extensions/xml/all-files/) file format, which is more specifically known as *[[Extensible Markup Language]]*. 
- It is classified as an [[XML]] [(Extensible Markup Language)](https://www.exefiles.com/en/extensions/file-types/data/) file, created for [[Microsoft Office Access]] by [Microsoft](https://www.exefiles.com/en/developers/microsoft/).

## Example

An example `AppxProvisioning.xml` File:

```xml
<?xml version="1.0" encoding="utf-8"?>
<AppxProvisionList xmlns="http://schemas.microsoft.com/appx/2013/appxprovisionpackage">
  <EndOfLife>
    <Package FamilyName="Microsoft.Camera_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Bing_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Alarms_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Calculate_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Windows.InsiderHub_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.Windows.FeatureOnDemand.InsiderHub_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.SoundRecorder_8wekyb3d8bbwe" />
    <Package FamilyName="microsoft.windowsphotos_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.PPISkype_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.BingMaps_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Maps3DPreview_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.BioEnrollment_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Windows.ShellExperienceHost_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.ContentDeliveryManager_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Spartan_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Windows.Spartan_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.AnswerDesk_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.AccountsControl_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.HelpAndTips_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.CloudExperienceHost_8wekyb3d8bbwe" />
    <Package FamilyName="microsoft.windowsdefaultlockscreen_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.AAD.BrokerPlugin_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.MicrosoftFeedback_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.WindowsFeedback_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.PPIWelcome_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.PPIProjection_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Office.OneNote_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.Music.Preview_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Video.Preview_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.WelcomeScreen_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.XboxLIVEGames_8wekyb3d8bbwe" />
    <Package FamilyName="AssignedAccessLockApp_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.XboxIdentityProvider_cw5n1h2txyewy" />
    <Package FamilyName="14C78905.TrendMicroMalwareMap_y1xsffnhj35f6" />
    <Package FamilyName="14C78905.TrendMicroConnect_y1xsffnhj35f6" />
    <Package FamilyName="Windows.PurchaseDialog_cw5n1h2txyewy" />
    <Package FamilyName="RaraMediaGroupLtd.raramusicwithLenovo_974r2wkty6q6y" />
    <Package FamilyName="NeonRabbit.Laszlo_en4prcah77pjg" />
    <Package FamilyName="Windows.MiracastView_cw5n1h2txyewy" />
    <Package FamilyName="Holograms_cw5n1h2txyewy" />
    <Package FamilyName="HolographicViewer_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.WindowsPhone_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Windows.Cortana_cw5n1h2txyewy" />
    <Package FamilyName="MicrosoftWindows.UX.Client.ST_cw5n1h2txyewy" />
    <Package FamilyName="Microsoft.Wallet_8wekyb3d8bbwe" />
    <Package FamilyName="Microsoft.Windows.SecHealthUI_cw5n1h2txyewy" />
    <Package FamilyName="MicrosoftWindows.UX.Inbox_cw5n1h2txyewy" />
  </EndOfLife>
  <Provisioned>
    <Package FullName="Microsoft.WindowsCalculator_2023.603.202.0_neutral_~_8wekyb3d8bbwe" PackageType="bundle" />
    <Package FullName="Microsoft.WindowsCalculator_11.2210.0.0_x64__8wekyb3d8bbwe" ProvisionSourceIsBundle="true" />
    <Package FullName="Microsoft.WindowsCalculator_11.2210.0.0_neutral_split.scale-100_8wekyb3d8bbwe" ProvisionSourceIsBundle="true" PackageType="resource" />
    <Package FullName="Microsoft.WindowsCalculator_11.2210.0.0_neutral_split.scale-125_8wekyb3d8bbwe" ProvisionSourceIsBundle="true" PackageType="resource" />
    <Package FullName="Microsoft.549981C3F5F10_2023.603.203.0_neutral_~_8wekyb3d8bbwe" PackageType="bundle" />
    <Package FullName="Microsoft.549981C3F5F10_3.2204.14815.0_x64__8wekyb3d8bbwe" ProvisionSourceIsBundle="true" />
  </Provisioned>
</AppxProvisionList>
```

## File Locations

-   **Windows 10:** `C:\Windows\System32\`
-   **Windows 10:** `C:\Windows\System32\`
-   **Windows 8.1:** `C:\ProgramData\Microsoft\Windows\`
-   **Windows 8.1:** `C:\ProgramData\Microsoft\Windows\`

## Related Files

- [[appxblockmap.xml]]: 
- [[AllowMicrosoft.xml]]:
- [[Appraiser_TelemetryRunList.xml]]
- [[appxmanifest.xml]]
- [[Solstice.xml]]

***

## Appendix: Links and References

*Note created on [[2023-08-28]] and last modified on [[2023-08-28]].*

### Internal Linked Notes

- [[Managing Modern AppX Packages]]

### External References

#### Backlinks

```dataview
list from [[About the AppxProvisioning.xml File]] AND -"CHANGELOG" AND -"04 - RESOURCES/Sources/FleetingNotes/About the AppxProvisioning.xml File"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023