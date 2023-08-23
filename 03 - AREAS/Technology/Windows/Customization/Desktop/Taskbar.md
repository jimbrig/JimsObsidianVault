---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ "Customize Windows Taskbar", "Taskbar" ]
---

# Customize Windows Taskbar

> [!SOURCE] Sources
> - *[Customize the Windows 11 Taskbar | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-the-windows-11-taskbar)*

> [!INFO] **See Also:** 
> [[TaskbarGroups]] Utility Tool / Application

## Contents

- [Overview](#overview)
- [Taskbar Links and Ordering](#taskbar-links-and-ordering)
- [Author a TaskbarLayoutModification.xml file](#author-a-taskbarlayoutmodificationxml-file)
	- [Adding Pins to the Layout](#adding-pins-to-the-layout)
	- [Use Different Layouts for Different Regions](#use-different-layouts-for-different-regions)
- [Add TaskbarLayoutModification.XML to an Image](#add-taskbarlayoutmodificationxml-to-an-image)
	- [Set a Default Path](#set-a-default-path)
	- [Add TaskbarLayoutModification.xml to your Image](#add-taskbarlayoutmodificationxml-to-your-image)
	- [Generalize and Re-capture your Image](#generalize-and-re-capture-your-image)
- [How Windows Parses the Setting for Unattend and Taskbar Layout Modification XML](#how-windows-parses-the-setting-for-unattend-and-taskbar-layout-modification-xml)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Overview

> [!TIP]
> For the Windows 10 version of this topic, see [Customize the Windows 10 Taskbar](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-the-taskbar)

You can pin up to three additional apps to the Taskbar. You can configure Taskbar pins using one of these two methods:

- **TaskbarLayoutModification.XML** method (recommended)
    - Supports multivariant images; you can specify different sets of taskbar layouts for different regions.
    - Uses a single XML file.
    - Only method that allows you to add UWP apps to the taskbar.
    - In the examples below, the file name "TaskbarLayoutModification.xml" is used, however, you can choose any name you like.
- **Classic Unattend method** (still supported in Windows 10, but marked as deprecated and may not be available in future builds)
    - Uses the Unattend setting: [TaskbarLinks](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-shell-setup-taskbarlinks)

![Image showing the Windows desktop, including the taskbar](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/images/desktop_light.png)

## Taskbar Links and Ordering

The taskbar starts with the following links: **Start**, **Search (glyph)**, **Task View**, **Widgets**, and **Chat** plus three additional Windows-provided links: **File Explorer**, **Edge**, and **Store**. These pins cannot be removed or replaced.

OEMs can pin up to three additional items to the taskbar.

For left-to-right languages, the taskbar icons are ordered from left to right, and for right-to-left languages the taskbar icons are in the opposite order, with the right-most element being **Start**.

## Author a TaskbarLayoutModification.xml file

Below is an basic example of a `TaskbarLayoutModification.xml` file:

```xml
<?xml version="1.0" encoding="utf-8"?>
<LayoutModificationTemplate
xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout"
xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout"
Version="1">

<CustomTaskbarLayoutCollection PinListPlacement="Replace">
    <defaultlayout:TaskbarLayout>
        <taskbar:TaskbarPinList>
            <taskbar:UWA AppUserModelID ="Microsoft.WindowsNotepad_8wekyb3d8bbwe!App"/> 
            <taskbar:UWA AppUserModelID="Microsoft.WindowsCalculator_8wekyb3d8bbwe!App" />
            <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk"/>
        </taskbar:TaskbarPinList>
    </defaultlayout:TaskbarLayout>
</CustomTaskbarLayoutCollection>
</LayoutModificationTemplate>
```

The above example defines a default layout that has three pinned items: Notepad, the Calculator UWP app, and Command Prompt.

### Adding Pins to the Layout

Pin Classic Windows applications or Universal Windows Apps to your Taskbar by adding up to three elements under the `<taskbar:TaskbarPinList>` element:

- To add a **Classic Windows application**, add a `<taskbar:DesktopApp>` element with a `DesktopApplicationLinkPath` attribute that specifies the path to a shortcut (.lnk) file. We recommend using the same shortcut .lnk files in the All Users Start menu. 

Example:

```xml
<taskbar:TaskbarPinList>
	<taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk"/>
</taskbar:TaskbarPinList>
```

> [!Note] Some classic Windows applications are now packaged differently than they were in previous versions of Windows. 
> See [Notepad](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-non-language-fod#notepad) and [Paint](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-non-language-fod#paint) to learn more.
    
- For **Universal Windows apps**, add a `<Taskbar:UWA>` element with a `AppUserModelID` attribute that specifies the a Universal Windows app's user model ID (AUMID). Example:

```xml
<taskbar:TaskbarPinList>
	<taskbar:UWA AppUserModelID="Microsoft.Windows.Photos_8wekyb3d8bbwe!App"/>
</taskbar:TaskbarPinList>
```

See [Find the Application User Model ID of an installed app](https://learn.microsoft.com/en-us/windows/configuration/find-the-application-user-model-id-of-an-installed-app) to learn how to find the AUMID of an installed app.

> [!NOTE] Links to `.url` files are not supported.

### Use Different Layouts for Different Regions

You can also define different layouts for different regions within the same TaskbarLayoutModification.xml file. To additional layouts for different regions, configure additional `<defaultlayout:TaskbarLayout>` elements that include a `Region` attribute to define the applicable region. You can use multiple region tags separated by a pipe (`|`) character.

Here is an example of adding pins to the Chinese (PRC) and Chinese (Taiwan) regions:

```xml
<defaultlayout:TaskbarLayout Region="CN|TW">
```

> [!NOTE] These regions use the second half of the language/region tags listed in [Available Language Packs for Windows](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/available-language-packs-for-windows).

The example below shows a `TaskbarLayoutModification.xml` file with a default configuration, and two configurations for specific regions:

```xml
<?xml version="1.0" encoding="utf-8"?>
<LayoutModificationTemplate
xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout"
xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout"
Version="1">

<CustomTaskbarLayoutCollection PinListPlacement="Replace">
    <defaultlayout:TaskbarLayout>
        <taskbar:TaskbarPinList>
            <taskbar:UWA AppUserModelID="Microsoft.Windows.Photos_8wekyb3d8bbwe!App" />
            <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk"/>
        </taskbar:TaskbarPinList>
    </defaultlayout:TaskbarLayout>
    <defaultlayout:TaskbarLayout Region="US|GB">
        <taskbar:TaskbarPinList >
            <taskbar:UWA AppUserModelID ="Microsoft.WindowsNotepad_8wekyb3d8bbwe!App"/> 
            <taskbar:UWA AppUserModelID="Microsoft.WindowsCalculator_8wekyb3d8bbwe!App" />
        </taskbar:TaskbarPinList>
    </defaultlayout:TaskbarLayout>
    <defaultlayout:TaskbarLayout Region="CN|TW">
        <taskbar:TaskbarPinList>
            <taskbar:UWA AppUserModelID ="Microsoft.WindowsNotepad_8wekyb3d8bbwe!App"/> 
            <taskbar:UWA AppUserModelID="Microsoft.Windows.Photos_8wekyb3d8bbwe!App" />
            <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk"/>
        </taskbar:TaskbarPinList>
    </defaultlayout:TaskbarLayout>
</CustomTaskbarLayoutCollection>
</LayoutModificationTemplate>
```

## Add TaskbarLayoutModification.XML to an Image

If you're using a `TaskbarLayoutModification.xml` files to customize your taskbar, you'll:

1. Configure a registry key in your Windows image to set the default path of your `TaskBarLayoutModification.xml` file.
2. Add the `TaskBarLayoutModification.xml` file to your image.
3. Generalize and recapture your image.

### Set a Default Path

To use a Taskbar Layout Modification XML file, you'll need to add a registry key (`LayoutXMLPath`) to the image, then generalize and recapture the image. The registry key is processed before the specialize configuration pass, so you can't add the registry key using Synchronous Commands/FirstLogonCommands unless you're planning to generalize the image afterwards.

Once the registry key is configured in your image, the other shortcut files, apps, and the Taskbar Layout Modification file itself can be changed at any time through regular imaging techniques. You can add this registry key to all your images, even if you intend to add taskbar links using the Classic Unattend method.

To set the path:

1. Install the Windows image to a technician computer.
    
2. After the image boots, go into audit mode by pressing CTRL+SHIFT+F3.
    
3. Add the following registry key to define a default location for the Taskbar Layout Modification file:

```powershell
cmd /c reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ /v LayoutXMLPath /d C:\Windows\OEM\TaskbarLayoutModification.xml
```

> [!NOTE] 
> We recommend using the file location `C:\Windows\OEM\TaskbarLayoutModification.xml` because this is the default path used for [Push-button reset auto-apply folders](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/deploy-pbr-features-using-auto-apply).

### Add TaskbarLayoutModification.xml to your Image

Now that Windows knows where to look for the file, copy your TaskbarLayoutModification.xml file into the configured location.

While still in [[Windows Audit Mode]]:

1. Add a Taskbar Layout Modification file (`TaskbarLayoutModification.xml`) in the location you configured in the previous step, for example: `C:\Windows\OEM\TaskbarLayoutModification.xml`.
2. (Optional) You can also place a backup copy of your file at `C:\Recovery\AutoApply\TaskbarLayoutModification.xml` so it will be restored during a [push-button reset](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/deploy-pbr-features-using-auto-apply).

### Generalize and Re-capture your Image

While still in [[Windows Audit Mode]]:

1. Generalize the Windows image using [Sysprep](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/sysprep--system-preparation--overview):

```powershell
Sysprep /generalize /oobe /shutdown
```
    
2. Boot to Windows PE.
    
3. Recapture the image. For example:
    
```powershell
DISM /Capture-Image /CaptureDir:C:\ /ImageFile:c:\install-with-new-taskbar-layout.wim /Name:"Windows image with Taskbar layout"
```

Your image is now configured to use your `TaskBarLayoutModification.xml`.

## How Windows Parses the Setting for Unattend and Taskbar Layout Modification XML

While you’re transitioning to the new method to customize the taskbar, you may end up using existing images that still include your old Unattend TaskbarLinks settings. When that happens:

1. If Windows finds a valid Taskbar Layout Modification XML file, it uses the XML file, and ignores any of the Unattend taskbar settings.
2. If the Taskbar Layout Modification XML file isn't found, or is invalid, Windows looks for the old Unattend TaskbarLinks settings. If it finds them, it uses them.
3. If Windows can't find either a valid Taskbar Layout Modification XML file, or Unattend TaskbarLink settings, then only the Windows-provided pins and **Start**, **Search (Glyph)**, **Task View**, **Widgets**, **Chat**, and Taskbar corner icons are shown.

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Taskbar]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Customization/Desktop/Taskbar"
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
