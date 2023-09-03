---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Display

> [!SOURCE] Sources
> - *[Display | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/display)*

## Contents

- [Scaling](#scaling)
- [Refresh Rate](#refresh-rate)
	- [Dynamic Refresh Rate Switching for Media Content](#dynamic-refresh-rate-switching-for-media-content)
	- [Adaptive Sync for Gaming](#adaptive-sync-for-gaming)
- [High Dynamic Range (HDR) and Wide Color Gamut (WCG)](#high-dynamic-range-hdr-and-wide-color-gamut-wcg)
- [Display Descriptors](#display-descriptors)
	- [HDR Display Descriptor Requirements](#hdr-display-descriptor-requirements)
	- [DisplayID 2.0 Requirements](#displayid-20-requirements)
- [Connectivity Standards](#connectivity-standards)
	- [DisplayPort and Embedded DisplayPort (eDP)](#displayport-and-embedded-displayport-edp)
	- [Miracast](#miracast)
- [Related Topics](#related-topics)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Scaling

- Unified scaling system. Scaling has been unified between most frameworks and between SKUs. Windows 10 scale factors are: 100%, 125%, 150%, 200%, 250%, 300%, 400%, and 500%. The following will all use these scale factors:
    
    - Windows 10 Universal apps (UAPs)
    - DPI-aware Win32 apps (asset quality dependent on app)
    - System UI on Mobile and Desktop SKU
    - Edge and Internet Explorer content (user can override in-app)

- Expanded scaling system for 4K and 8K devices (up to 500%)
    
- Universal Windows Platform (UWP) apps with their good per-monitor scaling are first-class desktop apps
    
- Lower minimum resolution for very low end devices running desktop SKU
    
- More desktop UI scales on per-monitor basis
    

## Refresh Rate

### Dynamic Refresh Rate Switching for Media Content

On supported hardware, Windows 10 automatically and seamlessly switches the refresh rate to better match the frame rate of any full-screen videos that are playing. For example, when playing a 24fps video (film), Windows 10 switches to 24 Hz or 48 Hz. When playing a 30fps video (NTSC TV), Windows 10 switches to 30 Hz. This functionality provides two key benefits to the user:

1. For film content (24fps), by setting the refresh rate to an integer multiple of the video frame rate, 3:2 pulldown no longer needs to be performed. Each video frame will be displayed for exactly 41.7ms – 3:2 pulldown, which is necessary at 60 Hz (since it is 2.5x the frame rate), results in a pattern of 33.3ms, 50ms, 33.3ms, 50ms, …, causing ‘film judder’.
2. Because the optimal refresh rate can be lower than the standard 60 Hz, running at these refresh rates actually improves video playback battery life for users. Running at 48 Hz for 24 fps video improves system battery life upwards of 5%, while running at 24 Hz provides an additional 10% savings over 48 Hz.

Because the battery life savings when running at 24 Hz are so significant (measured in hours), we recommend that all portable form factors use displays that are qualified for 24 Hz and 30 Hz refresh rates when possible. Generally, this means using display panels built on the Indium-Gallium-Zinc-Oxide (IGZO) process. Amorphous Silicon-based panels (a-Si) are generally only able to support the 48 Hz and 50 Hz refresh rates (which are still valuable).

Windows 10 switches to the following refresh rates based on the underlying content in order of priority (lower refresh rates are always a higher priority since the power savings are greater there).

|   |   |
|---|---|
|24 fps (NTSC film)|24 Hz, 48 Hz, 60 Hz|
|25 fps (PAL film)|25 Hz, 50 Hz, 60 Hz|
|29.97 fps (NTSC TV)|30 Hz|
|48 fps (very rare, some films shot at 48 fps)|48 Hz|
|50 fps (PAL TV)|50 Hz|
|59.94 fps (NTSC TV)|60 Hz|

This feature is designed so that the lower refresh rates are triggered automatically and triggered without any visible artifacts normally associated with a mode switch.

For this feature to be engaged by Windows 10 at a particular refresh rate, the system must report support for the rate through its firmware. By reporting support for a particular refresh rate, the system is guaranteeing that the display panel can run at the corresponding refresh rate without any adverse effects (such as flicker).

### Adaptive Sync for Gaming

On supported hardware, Windows 10 (version 1903 and later) supports automatically synchronizing the refresh rate to the presentation rate of games running full-screen.

## High Dynamic Range (HDR) and Wide Color Gamut (WCG)

On supported hardware, Windows 10 supports high dynamic range (HDR) displays which may optionally have a color gamut wider than sRGB. This is referred to as Windows Advanced Color. When Advanced Color is active on a display, Windows 10 will automatically manage the colors for all applications in order to ensure color accuracy and consistency.

Windows requires that HDR displays conform to a set of minimum guidelines:

|Applicability|Requirement|
|---|---|
|For all displays|[VESA DisplayHDR 1.1 certification](https://displayhdr.org/) required|
|For LCD displays|VESA DisplayHDR 600 or better recommended|
|For OLED or micro-LED displays|VESA DisplayHDR 500 True Black or better recommended|

For LCD displays with multiple backlight dimming zones (highly recommended for LCD displays), Microsoft recommends using a 2-dimensional array of zones rather than only horizontal or vertical zones.

## Display Descriptors

The Windows display stack relies on accurate information reported in a display's hardware descriptor. Windows supports VESA Extended Display Identifier (EDID) descriptors, as well as limited support for DisplayID descriptors.

For all descriptors, Windows depends on the following pieces of information (read directly from the descriptor):

|Descriptor feature|Requirement|Notes|
|---|---|---|
|Physical size|Required|Used for DPI scaling calculations. Projectors may set the physical size to zero.|
|Native resolution|Required|Used for DPI scaling calculations and selecting the default mode|
|Unique serial number per device|Required|Used to track user preferences for individual displays|
|Unique model name|Required|Used to identify models for providing friendly names, monitor drivers, and OEM overrides|
|Colorimetry data (e.g. white point and color primaries)|Required for HDR and WCG displays|Tolerance is expected to have ∆E < 5|
|Luminance and HDR static tone mapping data|Required for HDR and WCG displays||

Windows specifically supports the following display descriptor formats for the above features:

|Descriptor format|Windows 10 support|Windows 11 support|Requirement|
|---|---|---|---|
|EDID 1.4 base block|Supported|Supported|Required for displays with an EDID|
|CEA-861 extension blocks|Supported|Supported||
|CTA-861.3-A HDR static metadata extension|Supported|Supported|Required for HDR displays with an EDID on Windows 10, see below for HDR descriptor requirements|
|DisplayID 1.3 (as an EDID extension block)|Not supported, ignored|Not supported, ignored|Graphics drivers may support extended timing information|
|DisplayID 2.0 (in standalone block)|Supported|Supported|See below for DisplayID 2.0 requirements|
|DisplayID 2.0 (as an EDID extension block)|Not supported, ignored|Supported|See below for DisplayID 2.0 requirements|

### HDR Display Descriptor Requirements

Windows 10 does not support DisplayID 2.0 as an EDID extension block, so HDR displays should use an EDID with a CTA-861.3-A HDR static metadata extension, _or_ a standalone DisplayID 2.0 block without an EDID.

Windows 11 adds support for DisplayID 2.0 as an EDID extension block, but requires that HDR properties be specified using a DisplayID 2.0 Display Parameters block for colorimetry and a DisplayID 2.0 Display Features block for EOTF support. Windows 11 does not support HDR parameters to be specified in a CTA-861.3-A embedded in a DisplayID sub-block.

### DisplayID 2.0 Requirements

Windows does not support DisplayID 1.x blocks, and always ignores them.

Windows 10 has limited support for standalone DisplayID 2.0 descriptors. These descriptors are only utilized if the monitor has no EDID.

Windows 11 adds support for qualifying DisplayID 2.0 descriptors embedded in EDID extension blocks. Windows 11 also now prefers qualifying DisplayID 2.0 descriptors over EDID for all properties other than the PnP identification. In other words, in the presence of a qualifying DisplayID 2.0 descriptor, legacy EDID blocks are assumed to be deprecated legacy blocks maintained only for older systems. Therefore, it's important that a DisplayID 2.0 descriptor _fully_ encompass all properties to identify and describe a monitor.

The DisplayID 2.1 specification adds clarifications around requirements for DisplayID descriptors, both embedded in an EDID extension and standalone. Windows 11 requires that DisplayID 2.0 descriptors follow these requirements precisely in order for the descriptor to be considered a "qualifying" DisplayID 2.0 descriptor. If Windows finds that the DisplayID block does not meet these requirements, the block is entirely ignored and the system falls back to only using the EDID. In particular:

- The DisplayID container must have version 2.0 or later.
- The first sub-block must be a valid Product Identification sub-block.
- There must be at least one Type VII timing sub-block as the first mode block declaring the native mode.
- There must be a valid Display Parameters sub-block.

Windows 11 prefers descriptors in the following order:

1. Standalone DisplayID 2.0 descriptor (if qualifying)
2. DisplayID 2.0 descriptor embedded in EDID extension blocks (if qualifying)
3. EDID

> [!Note] Since qualifying DisplayID descriptors are required to have all information necessary to replace the EDID, DisplayID descriptors may need to span multiple EDID 128-byte extension blocks. Manufacturers are recommended to pick panels with support for at least 384 bytes (3 blocks) of storage to accommodate descriptor changes.

> [!Note] Graphics drivers may make use of DisplayID features or descriptors that Windows does not currently support as long as Windows provides a higher-level DDI that allows the driver to express the functionality without a Windows DisplayID parser dependency.

## Connectivity Standards

### DisplayPort and Embedded DisplayPort (eDP)

On supported hardware, Windows 10 and Windows 11 support displays connected via the DisplayPort standard, including daisy-chaining and multi-stream topology (MST) configurations with multiple monitors attached to a hub device.

> [!Note] Windows 10 and Windows 11 do not provide native support for multi-SST operation (MSO) over eDP. Since MSO displays do not provide a single display descriptor for the entire display, use of MSO eDP displays is known to result in undefined behavior and is not recommended.

### Miracast

On supported hardware, Windows 10 and Windows 11 support wireless projection over Miracast. [Find out more](https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/wireless-projection).

## Related Topics

- [GetSystemMetrics](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getsystemmetrics)
- [Windows Hardware Compatibility Program](https://learn.microsoft.com/en-us/windows-hardware/design/compatibility/)
- [Unattend settings (Windows 8.1)](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-8.1-and-8/ff699026(v=win.10))

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Display]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Hardware/Display"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

