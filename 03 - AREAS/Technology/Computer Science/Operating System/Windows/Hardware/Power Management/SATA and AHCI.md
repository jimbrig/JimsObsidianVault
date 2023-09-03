---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# SATA and AHCI

> [!SOURCE] Sources
> - *[SATA/AHCI | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/power-management-for-storage-hardware-devices-sata)*

## Contents

[TOC]

## Overview

This section details how Microsoft’s in-box SATA driver (StorAHCI) manages power and what configuration options are available.

## HIPM / DIPM

By default, HIPM-only is enabled and StorAHCI manages Partial to Slumber transitions. When the device is in D0, after the link has been in Partial for 100ms, StorAHCI will transition to Slumber. StorAHCI allows the controller to handle transitions from Active to Partial by enabling the “Aggressive Partial feature” of the SATA-I/O standard.

After the device enters D3, StorAHCI will immediately transition the link to Slumber.

HIPM-only was chosen because StorAHCI controls DEVSLP transitions directly and typically DEVSLP-capable controllers indicate that DEVSLP can only be reached through the Slumber state. Thus, StorAHCI also needs to control transitions to Slumber.

## DEVSLP

StorAHCI controls DEVSLP directly in order to effectively balance power, responsiveness, and diagnosability. Thus, StorAHCI does not use the hardware-controlled DEVSLP feature (a.k.a. “Aggressive DEVSLP” per the SATA-I/O spec.).  
DEVSLP is mapped to a single logical idle power state or “F-State,” namely F1.

The following table shows the time the SATA device must be idle before it transitions to DEVSLP under different system power states. Note that if the controller has specified that DEVSLP must be entered from Slumber, StorAHCI will first transition to Slumber and then upon completing the transition to Slumber it will immediately transition to DEVSLP. As mentioned above, this implies that HIPM must be supported.

|System Power State|DEVSLP Idle Timeout|
|---|---|
|S0 (Working)|6 seconds|
|S0 Low Power Idle (Modern Standby (MS))|50ms|

#### Adaptive D3 Idle Timeout

Now that SATA drives with rotational media are supported on Modern Standby systems, there is a need to balance power savings with device reliability. The device needs to be powered down more aggressively when in Modern Standby in order to meet the system’s power requirements. However, powering down a rotational drive too aggressively can result in excessive wear on the drive’s mechanical parts. To help reduce wear and tear, Windows 10 includes Adaptive D3 Idle Timeout, where the device’s power cycle count is tracked and compared against a worst case model based on a typical device warranty (the worst case being where the drive would only last a couple of years). If the actual power cycle frequency is trending too close to the worst case model, then the D3 idle timeout is increased to allow the trend to dip back into safer numbers. If the power cycle frequency is low enough such that the device is not in danger of experiencing excess wear, then the D3 idle timeout value is shortened dramatically to ensure the drive is powered down quickly once it is idle in Modern Standby.

StorAHCI specifies a minimum power cycle period of 5 minutes for rotational drives. This means that if such a drive is being power cycled more frequently than every 5 minutes it will instead remain powered up when idle for a short time to compensate. If you want to modify the minimum power cycle period, according to guidance from your device vendor, you can use the following registry key:

- Name: MinPowerCyclePeriodInSecs
- Type: MULTI_SZ
- Path: HKLM\System\CurrentControlSet\Services\storahci\Parameters\Device
- Value: `<Product ID> <Value>`, e.g. "ST31000528AS 300" or "WDC WD4* 360"
    - To specify a pattern to match multiple product IDs, use:
        - ‘?’ to match any single character
        - ‘*’ to match any remaining characters
    - The value itself is in units of seconds.

## Device Maintenance Time

Because it is now possible for rotational drives to spend a significant amount of time powered down, Windows 10 also includes a mechanism that gives the drive some powered-up idle time (1 minute every 24 hours) to perform internal maintenance. This only occurs when the system is connected to AC power in order to preserve battery life and when the system is in Modern Standby in order to ensure disk activity is at a minimum. Device maintenance is not configurable.

## Modern Standby and DRIPS

Starting with Windows 10, drives with rotational media (HDDs or SSHDs) are supported on Modern Standby systems. HDDs may result in higher power drain due to Adaptive D3 Idle Timeout keeping the disk in D0 for longer periods. HDDs may also result in longer exit latency from Modern Standby. However, Modern Standby systems with HDDs are exempted from the 1s system resume latency requirement. SSDs, especially for the primary boot drive, are recommended over HDDs if possible.

Regardless of the media type of the storage device(s) on the system, in order to support Modern Standby, the platform needs to specify a constraint on either:

1. Each SATA port; or
2. On the AHCI controller

This constraint is consumed by the Power Engine Plug-in (PEP) and should allow the system to enter its Deepest Runtime Idle Power State (DRIPS) when either:

1. All SATA drives enter DEVSLP (F1) or deeper (D3 is considered deeper than F1); or
2. The AHCI controller enters the F1 state or deeper.

The specifics of this are platform-specific and outside the scope of this document.

 Note

Microsoft does not recommend that SATA SSDs/HDDs support Automatic Partial to Slumber Transitions (APST). APST will be automatically disabled.


## PCIe-Connected AHCI SSDs

During Windows 10 development none of the PCIe-connected AHCI SSDs we encountered exposed a DEVSLP state to StorAHCI. This means Windows 10 has virtually no options when it comes to managing power for these devices. In this case, the device and platform bear the bulk of the power management responsibility.

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[SATA and AHCI]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Hardware/Power Management/SATA and AHCI"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

