---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Ethernet

> [!SOURCE] Sources
> - *[Ethernet | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/ethernet)*
## Contents

- [Hardware](#hardware)
- [Wake-On-Lan (WOL)](#wake-on-lan-wol)
- [Related topics](#related-topics)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Hardware

This topic covers recommendations for Ethernet in Windows 10. Due to potential mechanical design limitations, an Ethernet is considered optional on a tablet form factor. However, if implemented, the platform must provide a power gating option to reduce the power consumption of the integrated Ethernet chip.

## Wake-On-Lan (WOL)

The default shutdown behavior puts the system into [Hybrid Shutdown (S4)](https://learn.microsoft.com/en-us/windows/win32/power/system-power-states) and all devices into the lowest power state [(D3)](https://learn.microsoft.com/en-us/previous-versions/aa932261(v=msdn.10)). In Hybrid Shutdown, user sessions are shut down while the contents of the kernel sessions are written to the disk, enabling faster startup.

WOL wakes the PC from a low power state when a network adapter detects a WOL event (typically, a specially constructed Ethernet packet). Remote wake from Hybrid Shutdown (S4) or Classic Shutdown (S5) is unsupported because Network Interface Cards (NICs) are explicitly not armed for wake in both the Classic (S5) and Hybrid Shutdown (S4) cases. Users expect zero power consumption and battery drain in both Shutdown states. This behavior removes the possibility of spurious wakes when explicit shutdown was requested.

In summary:

- Wake-On-LAN is only supported from Sleep (S3) or Hibernate (S4) states.
- Wake-On-LAN is not supported from Classic Shutdown (S5) or Hybrid Shutdown (S4) states.

[](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/ethernet#related-topics)

## Related topics

- [System Power Actions](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/system-power-actions)
- [USB Remote NDIS Devices and Windows](https://learn.microsoft.com/en-us/windows-hardware/drivers/network/remote-ndis-communication)

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Ethernet]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Hardware/Ethernet"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

