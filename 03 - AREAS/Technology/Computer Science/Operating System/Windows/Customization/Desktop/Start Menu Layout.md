---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ "Start Layout", "Start Menu" ]
---

# Start Menu Layout

> [!SOURCE] Sources
> - *[Customize the Windows 11 Taskbar | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-the-windows-11-taskbar)*

## Contents

- [Overview](#overview)
- [Start Menu Sections](#start-menu-sections)
	- [Pinned Section](#pinned-section)
	- [All Apps Section](#all-apps-section)
	- [Recommended Section](#recommended-section)
- [Customizing Start Menu items](#customizing-start-menu-items)
	- [LayoutModification.json](#layoutmodificationjson)
		- [LayoutModification.json members](#layoutmodificationjson-members)
		- [LayoutModification.json keys](#layoutmodificationjson-keys)
	- [Sample LayoutModification.json file](#sample-layoutmodificationjson-file)
	- [Pin Conflicts](#pin-conflicts)
- [Pinning a Web Link](#pinning-a-web-link)
	- [Create a LayoutModification.xml](#create-a-layoutmodificationxml)
	- [Use your Exported Start Layout to Pin a Web Link](#use-your-exported-start-layout-to-pin-a-web-link)
	- [Example Web Pin](#example-web-pin)
- [Pre-Pinning Office](#pre-pinning-office)
- [Add a Layout to an Image](#add-a-layout-to-an-image)
- [Language Tags for Captions](#language-tags-for-captions)
	- [JSON Example](#json-example)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Overview

> [!NOTE] Notes:
> - *Looking for the IT pro version of this topic? See [Customize the Start menu layout on Windows 11](https://learn.microsoft.com/en-us/windows/configuration/customize-start-menu-layout-windows-11)*
> - *For the Windows 10 version of this topic, see [Customize the Windows 10 Start layout](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-start-layout)*

OEMs can customize the Windows 11 Start layout so that OEM-defined items (apps and/or websites) are pinned in certain areas of the Start menu.

Start layout customizations are configured with `LayoutModification.json` and, optionally, `LayoutModification.xml`:

- `LayoutModification.json` provides full support for app pins
- `LayoutModification.xml` enables adding website pins to `LayoutModification.json`

> [!NOTE] You cannot use [[Windows Configuration Designer]] or [[Unattend]] to configure the [[Windows 11]] Start Menu.

## Start Menu Sections

The Start Menu is comprised of three sections: 

- Pinned
- All Apps
- Recommended. 

Your `LayoutModification.json` can include customizations for the Pinned and/or Recommended sections.

### Pinned Section

The section at the top of the Start menu is called the Pinned section. This section consists of pins arranged in a grid. The items in this section are a subset of all the apps installed on the PC; not all installed apps are included in this section by default. The number of rows and items in this view are consistent across device panel sizes.

While the initial view of this section displays 18 items, a user can use the pagination control to move through pages of additional pins. The items in this section are a combination of Microsoft-defined apps, dynamically delivered apps, and OEM-configured items. After setting up their PC, users can add, move, or remove pins in this this section.

**Available customizations**:

- Up to four items on page 1 of this section. Configured with `primaryOEMPins` in LayoutModification.json.
- Up to four items at the bottom of the pinned app grid. Users need to scroll down in the Start menu to see these pins. Configured with `secondaryOEMPins` in LayoutModification.json.

If you pin fewer than four items in either of these sections, other Microsoft-defined apps will slide over to fill the space to maintain the same order. Any array elements beyond the first four will be ignored.

> [!Note] 
> An item can only appear in the Pinned section once. It's not possible to pin an app in more than one location in this section, whether on the same page or on different pages.

### All Apps Section

This appears when a user clicks on **All apps** in the upper-right corner of the Start menu. All Apps is a comprehensive list, in alphabetical order, of all installed apps.

**Available customizations**:

- No customizations for this section. All apps is a list that includes all installed apps and can't be customized by users or OEMs.

### Recommended Section

This is the section below the "Pinned" section. On first boot, the **Get Started app** from Microsoft will be pre-populated in this location. An OEM can also pre-populate the section with a welcome or first run experience app that will stay pinned for up to seven days unless a customer removes it.

**Available customizations**: One item in this section. Configured with `firstRunOEMPins` in `LayoutModification.json`.

- For the best and cleanest user experience, we recommend that the app chosen for the Recommended section is not pre-pinned to the taskbar or first page of Start pins.

## Customizing Start Menu items

> [!Important]
> Using [[WCD]] or [[Unattend]] to customize the Windows 11 Start menu is not supported, `LayoutModification.json` is required.

OEMs can customize the Start layout by creating a custom `LayoutModification.json` file and adding it to an image, in the `%localappdata%\Microsoft\Windows\Shell` folder. You only need one `LayoutModification.json` in your image, as these files can contain one or more of the top-level members in any combination.

If you're pinning web links, you'll also need to create a `LayoutModification.xml` file to use in combination with `LayoutModification.json`.

> [!Important]
> Make sure your `LayoutModification.json` uses UTF-8 encoding.

### LayoutModification.json

`LayoutModification.json` enables you to configure the pins within a Start layout's customizable sections.

#### LayoutModification.json members

|Member|Description|
|---|---|
|`primaryOEMPins`|Configures items that display on page 1 of the "Pinned" section. You can specify up to four items, in any combination of type.|
|`secondaryOEMPins`|Configures items that appear at the end of the "Pinned" section. You can specify up to four items, in any combination of type.|
|`firstRunOEMPins`|Configures the OEM-configurable item in the "Recommended" section. You can specify one item.|

#### LayoutModification.json keys

Each of the above members can use the following possible members to define pins for each section:

|Key|Description|
|---|---|
|`packagedAppID`|- Specifies a Universal Windows Platform App. To pin a UWP app, use the app's AUMID.<br>- Used in conjunction with the `tileID` subelement to specify a web link. see [Pinning a web link](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-the-windows-11-start-menu#pinning-a-web-link) To learn about pining a web link.|
|`tileID`|Used only with `packagedAppID`. Corresponds to a `TileID` in a LayoutModification.xml when pinning a web link.|
|`desktopAppID`|Specifies an unpackaged Win32 app. To pin a Win32 app, use the app's AUMID. If the app doesn't have an AUMID, specify it using desktopAppLink instead.|
|`desktopAppLink`|Specifies an unpackaged Win32 app that doesn't have an associated AUMID. To pin this type of app, use the path to the .lnk shortcut that points to the app.|
|`caption`|Applies only to the `firstRunOEMPins` item. The text string that displays when a user hovers over the tile.  <br><br>For images that contain multiple languages, you can specify different text for different languages (as shown in the example below), as well as a default caption that's used as a fallback when a user's language doesn't match any explicitly specified languages. See [Language tags for captions](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-the-windows-11-start-menu#language-tags-for-captions) for more infomation about how to specify languages for captions.|

### Sample LayoutModification.json file

Here is a sample `LayoutModification.json` file showing customizations for the three customizable Start menu sections:

- Three items in `primaryOEMPins`: one UWP app, one Win32 app, and one [web link](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-the-windows-11-start-menu#pinning-a-web-link)
- Two items in `secondaryOEMPins`: One web link, and one Win32 app
- One item in `firstRunOEMPins`: one Win32 app specified by a .lnk file

```json
{
    "primaryOEMPins": [
        {
            "packagedAppId": "OEM.App1_1abcde2f3ghjk!App"
        },
        {
            "desktopAppLink": "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\MyWin32App.lnk"
        },
        {
            "packagedAppId": "Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App",
            "tileId": "MSEdge.paomdnjincdkenhiicpl.UserData.Default"
        }
    ],
    "secondaryOEMPins": [
        {
            "packagedAppId": "Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App",
            "tileId": "MSEdge.anfoedbkjbcacemdbigf.UserData.Default"
        },
        {
            "desktopAppId": "Contoso.Desktop.Example.AUMID"
        }
    ],
    "firstRunOEMPins": [
        {
            "desktopAppLink": "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\PutMeInRecommended.lnk",
            "caption": {
                "en-US": "(localized caption text for US English)",
                "de": "(localized caption text for German)",
                "default": "(fallback caption text for other languages)"
            }
        }
    ]
}

```

> [!Tip] 
> Each single backslash character (`\`) need to be escaped as `\\` per JSON syntax.

### Pin Conflicts

- Dynamically delivered apps: Before Microsoft attempts to dynamically pin a first-party or third-party app, it first checks whether the exact same app is already pinned by the OEM on any page. If it is, Microsoft keeps the OEM app pinned in its place.
    
- First-party apps statically defined by Microsoft on Page 1: Microsoft first-party apps (ex: Microsoft Edge, Mail, Store) pinned on Page 1 cannot be moved by the OEM. If the OEM attempts to pin one of these apps on Page 1 as well, it will be ignored.
    
- Elevating statically-defined Microsoft first-party apps: OEMs may pin a Microsoft first-party app (ex: Calculator, Camera) on Page 1 and move its position to Page 1 so long as either it is not already statically pinned by Microsoft on Page 1 or is not pinned.
    

## Pinning a Web Link

To pin a web link to the Start menu, you'll need to use both `LayoutModification.json` and `LayoutModification.xml` files.

Web links use both `LayoutModification.xml` and `LayoutModification.json`. Each web link that's specified in `LayoutModification.json` must have a corresponding `SecondaryTile` element in `LayoutModification.xml`:

- `LayoutModification.xml` is used to configure the web link
- `LayoutModification.json` references the configured web link

> [!Important]
> Make sure to include both `LayoutModification` files to your image.

### Create a LayoutModification.xml

The easiest way to create a Start layout .xml file is to add website links on a _Windows 10_ reference PC's Start menu, and then use PowerShell to export the layout. You'll need to include both the exported layout and your `LayoutModification.json` in your image if you're using web pins.

See [Export the Start Layout](https://learn.microsoft.com/en-us/windows/configuration/customize-and-export-start-layout#export-the-start-layout) to learn how to export a Start Layout.

### Use your Exported Start Layout to Pin a Web Link

Your exported Start layout will contain `SecondaryTile` elements for each of the web links you've configured. Make note of the `AppUserModelID` and `TileID` elements. You'll add these to your `LayoutModification.json` to pin the web link.

> [!Important]
> Make sure to remove the `Square71x71LogoUri` tag from the [[XML]].

### Example Web Pin

Below is an example of a web pin from a `LayoutModification.xml`:

```xml
<start:SecondaryTile AppUserModelID="Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App"
    TileID="MSEdge.anfoedbkjbcacemdbigf.UserData.Default"
    Arguments="--launch-tile --profile-directory=Default --app-id=anfoedbkjbhcfgooaffkopcacemdbigf --app-url=https://www.bing.com/"
    DisplayName="(Text of your choice to display in Start)"
    Square150x150LogoUri="msappdata:///local/Favicons/Taskbar/‌anfoedbkjbhcfgooaffkopcacemdbigf/largefavicon.png"
    Wide310x150LogoUri="ms-appx:///" ShowNameOnSquare150x150Logo="true"
    ShowNameOnWide310x150Logo="false" BackgroundColor="#000000" Size="2x2" Row="0" Column="0" />

```

Add this tile to `LayoutModification.json` by adding a new JSON object in the section you want to add the pin:

- Use the attribute from `AppUserModelID` (`"Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App"`) for the `packagedAppID` value in `LayoutModification.json`.
- Use the attribute from `TileID` (`"MSEdge.anfoedbkjbcacemdbigf.UserData.Default"`) for the `tileID` value in `LayoutModification.json`.

Here's what it looks like, using the above example, to pin the web link to the bottom of the "Pinned" section:



```json
... 
"secondaryOEMPins": [ 
  { "packagedAppId": "Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App", 
    "tileId": "MSEdge.anfoedbkjbcacemdbigf.UserData.Default" }, 
  ], 
...
```

## Pre-Pinning Office

Office Click-to-Run (C2R) apps will automatically be pinned to Start by Windows if the apps are pre-installed. Install the C2R version of Office using the Office pre-installation kit (OPK), and Windows will automatically detect the Office installation and add the appropriate pins to Start. Not every C2R Office app will be pinned to Start, only Word, Excel, and PowerPoint. This behavior is entirely automatic and does not require anything in LayoutModification.json.

If C2R Office is not pre-installed, the other items pinned to Start will slide over to fill the place of these apps so there are no gaps left in the middle of the layout.

## Add a Layout to an Image

1. Mount your Windows image.
    
```powershell
DISM /mount-image /imagefile:E:\Sources\install.wim /mountdir:C:\mount /index:1
```
    
2. Copy your `LayoutModification.json` and `LayoutModification.xml`, to your mounted image. Windows looks for these files in the `\Windows\Users\Default\Appdata\Local\Microsoft\Windows\Shell` folder. If `LayoutModification` files already exists in the folder, replace the existing file(s) with the new one(s).

```powershell
XCOPY /s LayoutModification.json C:\Mount\Users\Default\Appdata\Local\Microsoft\Windows\Shell
XCOPY /s LayoutModification.xml C:\Mount\Users\Default\Appdata\Local\Microsoft\Windows\Shell
```
    
3. Unmount your image, committing changes.

```powershell
DISM /unmount-image /mountdir:C:\mount 
```

## Language Tags for Captions

```json
"caption": {
  "af": "Afrikaans", 
  "sq": "Albanian", 
  "gsw": "Alsatian", 
  "am": "Amharic", 
  "ar-DZ": "Arabic (Algeria)", 
  "ar-BH": "Arabic (Bahrain)", 
  "ar-EG": "Arabic (Egypt)", 
  "ar-IQ": "Arabic (Iraq)", 
  "ar-JO": "Arabic (Jordan)", 
  "ar-KW": "Arabic (Kuwait)", 
  "ar-LB": "Arabic (Lebanon)", 
  "ar-LY": "Arabic (Libya)", 
  "ar-MA": "Arabic (Morocco)", 
  "ar-OM": "Arabic (Oman)", 
  "ar-QA": "Arabic (Qatar)", 
  "ar-SA": "Arabic (Saudi Arabia)", 
  "ar-SY": "Arabic (Syria)", 
  "ar-TN": "Arabic (Tunisia)", 
  "ar-AE": "Arabic (United Arab Emirates)", 
  "ar-YE": "Arabic (Yemen)", 
  "hy": "Armenian", 
  "as": "Assamese", 
  "az-Cyrl": "Azerbaijani (Cyrillic)", 
  "az-Latn": "Azerbaijani (Latin)", 
  "bn-BD": "Bangla (Bangladesh)", 
  "ba-Cyrl": "Bashkir", 
  "eu": "Basque", 
  "be": "Belarusian", 
  "bn-IN": "Bengali (India)", 
  "bs-Cyrl": "Bosnian (Cyrillic)", 
  "bs": "Bosnian (Latin)", 
  "br-Latn": "Breton", 
  "bg": "Bulgarian", 
  "my": "Burmese", 
  "ca": "Catalan", 
  "ceb-Latn-PH": "Cebuano (Latin, Philippines)", 
  "ku-Arab": "Central Kurdish", 
  "ccp-Cakm-BD": "Chakma (Chakma, Bangladesh)", 
  "ccp-Cakm-IN": "Chakma (Chakma, India)", 
  "chr-Cher": "Cherokee (Cherokee)", 
  "zh-Hans-CN": "Chinese (Simplified, China)", 
  "zh-Hans-SG": "Chinese (Simplified, Singapore)", 
  "zh-Hant-HK": "Chinese (Traditional, Hong Kong SAR)", 
  "zh-Hant-MO": "Chinese (Traditional, Macao SAR)", 
  "zh-Hant-TW": "Chinese (Traditional, Taiwan)", 
  "co-Latn": "Corsican", 
  "hr-BA": "Croatian (Bosnia and Herzegovina)", 
  "hr-HR": "Croatian (Croatia)", 
  "cs": "Czech", 
  "da": "Danish", 
  "prs-Arab": "Dari", 
  "dv": "Divehi", 
  "nl-BE": "Dutch (Belgium)", 
  "nl-NL": "Dutch (Netherlands)", 
  "dz": "Dzongkha", 
  "en-AU": "English (Australia)", 
  "en-BZ": "English (Belize)", 
  "en-CA": "English (Canada)", 
  "en-029": "English (Caribbean)", 
  "en-IN": "English (India)", 
  "en-IE": "English (Ireland)", 
  "en-JM": "English (Jamaica)", 
  "en-MY": "English (Malaysia)", 
  "en-NZ": "English (New Zealand)", 
  "en-PH": "English (Philippines)", 
  "en-SG": "English (Singapore)", 
  "en-ZA": "English (South Africa)", 
  "en-TT": "English (Trinidad and Tobago)", 
  "en-AE": "English (United Arab Emirates)", 
  "en-GB": "English (United Kingdom)", 
  "en-US": "English (United States)", 
  "en-ZW": "English (Zimbabwe)", 
  "et": "Estonian", 
  "fo": "Faroese", 
  "fil-Latn": "Filipino", 
  "fi": "Finnish", 
  "fr-BE": "French (Belgium)", 
  "fr-CA": "French (Canada)", 
  "fr-029": "French (Caribbean)", 
  "fr-FR": "French (France)", 
  "fr-LU": "French (Luxembourg)", 
  "fr-MC": "French (Monaco)", 
  "fr-CH": "French (Switzerland)", 
  "fy": "Frisian", 
  "ff-Adlm-BF": "Fulah (Adlam, Burkina Faso)", 
  "ff-Adlm-CM": "Fulah (Adlam, Cameroon)", 
  "ff-Adlm-GM": "Fulah (Adlam, Gambia)", 
  "ff-Adlm-GH": "Fulah (Adlam, Ghana)", 
  "ff-Adlm-GN": "Fulah (Adlam, Guinea)", 
  "ff-Adlm-GW": "Fulah (Adlam, Guinea-Bissau)", 
  "ff-Adlm-LR": "Fulah (Adlam, Liberia)", 
  "ff-Adlm-MR": "Fulah (Adlam, Mauritania)", 
  "ff-Adlm-NE": "Fulah (Adlam, Niger)", 
  "ff-Adlm-NG": "Fulah (Adlam, Nigeria)", 
  "ff-Adlm-SN": "Fulah (Adlam, Senegal)", 
  "ff-Adlm-SL": "Fulah (Adlam, Sierra Leone)", 
  "ff-Latn-BF": "Fulah (Latin, Burkina Faso)", 
  "ff-Latn-CM": "Fulah (Latin, Cameroon)", 
  "ff-Latn-GM": "Fulah (Latin, Gambia)", 
  "ff-Latn-GH": "Fulah (Latin, Ghana)", 
  "ff-Latn-GN": "Fulah (Latin, Guinea)", 
  "ff-Latn-GW": "Fulah (Latin, Guinea-Bissau)", 
  "ff-Latn-LR": "Fulah (Latin, Liberia)", 
  "ff-Latn-MR": "Fulah (Latin, Mauritania)", 
  "ff-Latn-NE": "Fulah (Latin, Niger)", 
  "ff-Latn-NG": "Fulah (Latin, Nigeria)", 
  "ff-Latn-SN": "Fulah (Latin, Senegal)", 
  "ff-Latn-SL": "Fulah (Latin, Sierra Leone)", 
  "gl": "Galician", 
  "ka": "Georgian", 
  "de-AT": "German (Austria)", 
  "de-DE": "German (Germany)", 
  "de-LI": "German (Liechtenstein)", 
  "de-LU": "German (Luxembourg)", 
  "de-CH": "German (Switzerland)", 
  "el": "Greek", 
  "gu": "Gujarati", 
  "ha-Latn": "Hausa (Latin)", 
  "haw-Latn": "Hawaiian", 
  "he": "Hebrew", 
  "hi": "Hindi", 
  "hu": "Hungarian", 
  "is": "Icelandic", 
  "ig-Latn": "Igbo", 
  "smn-Latn": "Inari Sami", 
  "id": "Indonesian", 
  "iu-Cans": "Inuktitut (Canadian Aboriginal Syllabics)", 
  "iu-Latn": "Inuktitut (Latin)", 
  "ga": "Irish", 
  "ga-GB": "Irish (United Kingdom)", 
  "xh": "isiXhosa", 
  "zu": "isiZulu", 
  "it-IT": "Italian (Italy)", 
  "it-CH": "Italian (Switzerland)", 
  "ja": "Japanese", 
  "quc-Latn": "K’iche’", 
  "kl": "Kalaallisut", 
  "kn": "Kannada", 
  "kk": "Kazakh", 
  "km": "Khmer", 
  "rw": "Kinyarwanda", 
  "sw": "Kiswahili", 
  "kok": "Konkani", 
  "ko": "Korean", 
  "ky-Cyrl": "Kyrgyz", 
  "lo": "Lao", 
  "lv": "Latvian", 
  "lt": "Lithuanian", 
  "dsb": "Lower Sorbian", 
  "smj-Latn-NO": "Lule Sami (Norway)", 
  "smj-Latn-SE": "Lule Sami (Sweden)", 
  "lb": "Luxembourgish", 
  "mk": "Macedonian", 
  "ms-BN": "Malay (Brunei)", 
  "ms-MY": "Malay (Malaysia)", 
  "ml": "Malayalam", 
  "mt": "Maltese", 
  "mi-Latn": "Maori", 
  "arn-Latn": "Mapuche", 
  "mr": "Marathi", 
  "moh-Latn": "Mohawk", 
  "mn-Cyrl": "Mongolian (Cyrillic)", 
  "mn-Mong": "Mongolian (Traditional Mongolian)", 
  "ne-IN": "Nepali (India)", 
  "ne-NP": "Nepali (Nepal)", 
  "se-Latn-FI": "Northern Sami (Finland)", 
  "se-Latn-NO": "Northern Sami (Norway)", 
  "se-Latn-SE": "Northern Sami (Sweden)", 
  "nb": "Norwegian (Bokmål)", 
  "nn": "Norwegian (Nynorsk)", 
  "oc-Latn": "Occitan", 
  "or": "Odia", 
  "ps": "Pashto", 
  "ps-PK": "Pashto (Pakistan)", 
  "fa": "Persian", 
  "pl": "Polish", 
  "pt-BR": "Portuguese (Brazil)", 
  "pt-PT": "Portuguese (Portugal)", 
  "pa-Arab": "Punjabi (Arabic)", 
  "pa": "Punjabi (Gurmukhi)", 
  "quz-Latn-BO": "Quechua (Bolivia)", 
  "quz-Latn-EC": "Quechua (Ecuador)", 
  "quz-Latn-PE": "Quechua (Peru)", 
  "ro-MD": "Romanian (Moldova)", 
  "ro-RO": "Romanian (Romania)", 
  "rm": "Romansh", 
  "ru": "Russian", 
  "sah-Cyrl": "Sakha", 
  "sa-Deva": "Sanskrit", 
  "gd-Latn": "Scottish Gaelic", 
  "sr-Cyrl-BA": "Serbian (Cyrillic, Bosnia and Herzegovina)", 
  "sr-Cyrl-ME": "Serbian (Cyrillic, Montenegro)", 
  "sr-Cyrl-RS": "Serbian (Cyrillic, Serbia)", 
  "sr-Latn-BA": "Serbian (Latin, Bosnia and Herzegovina)", 
  "sr-Latn-ME": "Serbian (Latin, Montenegro)", 
  "sr-Latn-RS": "Serbian (Latin, Serbia)", 
  "nso": "Sesotho sa Leboa", 
  "tn-BW": "Setswana (Botswana)", 
  "tn-ZA": "Setswana (South Africa)", 
  "sd-Arab": "Sindhi (Arabic)", 
  "si": "Sinhala", 
  "sms-Latn": "Skolt Sami", 
  "sk": "Slovak", 
  "sl": "Slovenian", 
  "sma-Latn-NO": "Southern Sami (Norway)", 
  "sma-Latn-SE": "Southern Sami (Sweden)", 
  "es-AR": "Spanish (Argentina)", 
  "es-BO": "Spanish (Bolivia)", 
  "es-CL": "Spanish (Chile)", 
  "es-CO": "Spanish (Colombia)", 
  "es-CR": "Spanish (Costa Rica)", 
  "es-DO": "Spanish (Dominican Republic)", 
  "es-EC": "Spanish (Ecuador)", 
  "es-SV": "Spanish (El Salvador)", 
  "es-GT": "Spanish (Guatemala)", 
  "es-HN": "Spanish (Honduras)", 
  "es-419": "Spanish (Latin America)", 
  "es-MX": "Spanish (Mexico)", 
  "es-NI": "Spanish (Nicaragua)", 
  "es-PA": "Spanish (Panama)", 
  "es-PY": "Spanish (Paraguay)", 
  "es-PE": "Spanish (Peru)", 
  "es-PR": "Spanish (Puerto Rico)", 
  "es-ES": "Spanish (Spain)", 
  "es-US": "Spanish (United States)", 
  "es-UY": "Spanish (Uruguay)", 
  "es-VE": "Spanish (Venezuela)", 
  "zgh-Tfng": "Standard Moroccan Tamazight", 
  "sv-FI": "Swedish (Finland)", 
  "sv-SE": "Swedish (Sweden)", 
  "syr-Syrc": "Syriac", 
  "tg-Cyrl": "Tajik (Cyrillic)", 
  "ta-IN": "Tamil (India)", 
  "ta-MY": "Tamil (Malaysia)", 
  "ta-SG": "Tamil (Singapore)", 
  "ta-LK": "Tamil (Sri Lanka)", 
  "tt-Cyrl": "Tatar (Cyrillic)", 
  "te": "Telugu", 
  "th": "Thai", 
  "bo-Tibt": "Tibetan", 
  "ti-ER": "Tigrinya (Eritrea)", 
  "ti-ET": "Tigrinya (Ethiopia)", 
  "tr": "Turkish", 
  "tk-Latn": "Turkmen (Latin)", 
  "uk": "Ukrainian", 
  "hsb": "Upper Sorbian", 
  "ur-IN": "Urdu (India)", 
  "ur-PK": "Urdu (Pakistan)", 
  "ug-Arab": "Uyghur", 
  "uz-Cyrl": "Uzbek (Cyrillic)", 
  "uz-Latn": "Uzbek (Latin)", 
  "ca-ES-valencia": "Valencian", 
  "vi": "Vietnamese", 
  "cy": "Welsh", 
  "wo-Latn": "Wolof", 
  "ii-Yiii": "Yi", 
  "yo-Latn": "Yoruba", 
  "default": "fallback caption for other languages"
}
```

### JSON Example

The example JSON snippet below shows examples of how to use each available language tag

- For languages/locales you have localized text for, replace the placeholder language name in the snippet with your actual text.
    
- For languages/locales you don’t plan to have localized text for, remove the corresponding line in the snippet. System will fall back to the `default` entry at the bottom for the text to display for those languages/locales.
    
- For any language that have multiple locale variants, you can specify just the major tag (the part before the first hyphen) as a fallback for all other locales for that language. For example:

```json
"caption": {
"en-US": "English (United States)", 
"en-GB": "English (United Kingdom)", 
"en": "text for all other locale variants of English"}
```

This would provide texts specifically for US English and UK English, and then for all the other locale variants of English (eg. en-CA for Canada English), system will use the "en" caption text.

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Start Menu Layout]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Customization/Desktop/Start Menu Layout"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023


> [!failure]- Failure 
>   Error: There is another generation process
>   
>   - plugin:obsidian-textgenerator-plugin:56986 TextGenerator.eval
>     plugin:obsidian-textgenerator-plugin:56986:31
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:56972 TextGenerator.generate
>     plugin:obsidian-textgenerator-plugin:56972:12
>   
>   - plugin:obsidian-textgenerator-plugin:58477 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58477:52
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58460 AutoSuggest.getGPTSuggestions
>     plugin:obsidian-textgenerator-plugin:58460:12
>   
>   - plugin:obsidian-textgenerator-plugin:58374 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58374:42
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58371 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58371:60
>   
>   - plugin:obsidian-textgenerator-plugin:58351 eval
>     plugin:obsidian-textgenerator-plugin:58351:14
>   
>  
