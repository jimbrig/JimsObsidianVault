---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# NVMe

> [!SOURCE] Sources
> - *[NVMe | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/power-management-for-storage-hardware-devices-nvme)*

## Contents

- [Overview](#overview)
- [Runtime Device Power Management](#runtime-device-power-management)
- [Modern Standby and DRIPS](#modern-standby-and-drips)
- [Power Configuration Settings](#power-configuration-settings)
	- [Primary NVMe Idle Timeout](#primary-nvme-idle-timeout)
	- [Secondary NVMe Idle Timeout](#secondary-nvme-idle-timeout)
	- [PCIe ASPM and L1 Sub-states](#pcie-aspm-and-l1-sub-states)
- [Active Power Management](#active-power-management)
- [Windows Thermal Framework Passive Cooling Callback](#windows-thermal-framework-passive-cooling-callback)
- [Maximum Operational Power Level Power Configuration Setting](#maximum-operational-power-level-power-configuration-setting)
- [IOCTL_STORAGE_DEVICE_POWER_CAP](#ioctl_storage_device_power_cap)
- [Shutdown/Hibernate](#shutdownhibernate)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

> [!NOTE] About
> *Description of note contents.*

This section details how Microsoft’s in-box NVMe driver (StorNVMe) manages power and what configuration options are available. The NVMe spec allows NVMe devices to report up to 32 power states. Each power state has the following parameters:

- Maximum Power Consumption (MP)
- Operational or Non-operational
- Entry Latency (ENLAT)
- Exit Latency (EXLAT)
- Relative performance values (relative to other power states)

StorNVMe maps operational power states (the device can handle IO in these states) to logical performance states (a.k.a. P-States). Likewise, the driver maps non-operational power states (the device does not handle IO in these states) to logical idle power states (a.k.a. F-States). With StorNVMe, transitions to these states is largely determined by the overall system power state. The NVMe specification defines an Autonomous Power State Transition (APST) feature. For Modern Standby support, StorNVMe does not support devices with APST enabled.

## Runtime Device Power Management

StorNVMe may choose to transition the device to an F-State after a certain amount of idle time has elapsed. The F-State is chosen based on 3 factors:

1. **Latency Tolerance**, which is how quickly the device can respond if needed. For F1, the TransitionLatency (ENLAT + EXLAT) shouldn’t be larger than Primary Transition Latency Tolerance. For F2 and other deeper F-states (if any), their TransitionLatency shouldn’t be larger than Secondary Transition Latency Tolerance. Otherwise, the device might not be able to transition to these F-states, and modern standby transition might be impacted (for instance, introduce long latency to enter DRIPS).
2. **Idle Timeout**. This is the amount of time from when the device completed its last IO operation.
3. **System Power State**. If the system is in active use, StorNVMe will prefer responsiveness. This implies varying latency tolerances and timeouts will be used.

The table shows the default idle timeouts and latency tolerances used by StorNVMe. See the [Power Configuration Settings](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/power-management-for-storage-hardware-devices-nvme#power-configuration-settings) section for how to change these settings.

|ACPI System Power State|Primary Idle Timeout|Primary Transition Latency Tolerance|Secondary Idle Timeout|Secondary Transition Latency Tolerance|
|---|---|---|---|---|
|S0 (Working) - Performance Scheme|200ms|0ms (AC) / 10ms (DC)|2000ms|0ms|
|S0 (Working) - Balanced Scheme|200ms (AC) / 100ms (DC)|15ms (AC) / 50ms (DC)|2000ms (AC) / 1000ms (DC)|100ms|
|S0 (Working) - Power Saver Scheme|100ms|100ms (AC) / 200ms (DC)|1000ms|200ms|
|S0 Low Power Idle (Modern Standby)|50ms|500ms|N/A|N/A|

Once the idle timeout has expired, the driver will traverse its internal table of power states and select the deepest power state where ENLAT+EXLAT is less than or equal to the current transition latency tolerance.

For example, assume an NVMe device has the following power states, and that an idle timeout has occurred:

|Power State|Entry Latency (ENLAT)|Exit Latency (EXLAT)|
|---|---|---|
|PS0|5us|5us|
|PS1|10ms|300us|
|PS2|50ms|10ms|

When the system is on DC power and not in Modern Standby, StorNVMe will choose PS1 since this is the deepest power state where (ENLAT+EXLAT) <= 50ms. Likewise, when the system enters Modern Standby, StorNVMe will then choose PS2 because it is the deepest power state where (ENLAT+EXLAT) <= 500ms.

## Modern Standby and DRIPS

To fully support Modern Standby, StorNVMe will transition the device to an appropriate low-power state depending on hints provided by the hardware platform. The idle state will vary between an F-State (deeper than F0), to D3 Cold. Some platforms require D3 Cold when in Modern Standby. This depends on the SoC, so please check with your silicon vendor for more information. D3 support for storage devices on Modern Standby systems can be enabled as described [here](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/power-management-for-storage-hardware-devices-intro#d3-support).

Devices should support RTD3 with short resume latency in order to help Modern Standby systems meet the 1 second system resume latency requirement. RTD3 Resume Latency (RTD3R) refers to resume latency from D3cold and is recommended to report a nonzero value ≤ 100 ms. **RTD3R** is described in section 8.4.4 of the NVMe spec.

## Power Configuration Settings

Windows 10 supports the following NVMe power settings to tune energy efficiency.

### Primary NVMe Idle Timeout

The following power configuration setting allows you to change the primary device idle timeout used by StorNVMe.


```
Power Setting GUID: d639518a-e56d-4345-8af2-b9f32fb26109  (Primary NVMe Idle Timeout)
      Minimum Possible Setting: 0x00000000
      Maximum Possible Setting: 0x0000ea60
      Possible Settings increment: 0x00000001
      Possible Settings units: milliseconds
```

The following power configuration setting allows you to change the primary transition latency tolerance value that StorNVMe uses when calculating an idle state. This is the value that is compared against the sum of the ENLAT and EXLAT values when the idle timeout expires. **The higher this value, the more likely that a deeper power state will be chosen.**


```
Power Setting GUID: fc95af4d-40e7-4b6d-835a-56d131dbc80e  (Primary NVMe Power State Transition Latency Tolerance)
      Minimum Possible Setting: 0x00000000
      Maximum Possible Setting: 0x0000ea60
      Possible Settings increment: 0x00000001
      Possible Settings units: milliseconds
```

### Secondary NVMe Idle Timeout

The following power configuration setting allows you to change the secondary device idle timeout used by StorNVMe.

```
Power Setting GUID: d3d55efd-c1ff-424e-9dc3-441be7833010  (Secondary NVMe Idle Timeout)
      Minimum Possible Setting: 0x00000000
      Maximum Possible Setting: 0x0000ea60
      Possible Settings increment: 0x00000001
      Possible Settings units: milliseconds
```

The following power configuration setting allows you to change the secondary transition latency tolerance value that StorNVMe uses when calculating an idle state. This is the value that is compared against the sum of the ENLAT and EXLAT values when the idle timeout expires. **The higher this value, the more likely that a deeper power state will be chosen.**

Copy

```
Power Setting GUID: dbc9e238-6de9-49e3-92cd-8c2b4946b472  (Secondary NVMe Power State Transition Latency Tolerance)
      Minimum Possible Setting: 0x00000000
      Maximum Possible Setting: 0x0000ea60
      Possible Settings increment: 0x00000001
      Possible Settings units: milliseconds
```

To change the value for a given power scheme, use:

Windows Command `PromptCopy`

```
powercfg [-setacvalueindex | -setdcvalueindex] <scheme> sub_disk <Power Setting GUID> <milliseconds>
```

Don’t forget to apply the value by using: `powercfg –setactive <scheme>`

### PCIe ASPM and L1 Sub-states

Depending on your platform, you may observe that the NVMe device is able to enter L1 sub-states when on DC power but not on AC power. In this case, you may need to change the PCIe ASPM power configuration setting such that it gets maximum power savings when on AC power (in addition to DC power).

```
Power Setting GUID: ee12f906-d277-404b-b6da-e5fa1a576df5  (Link State Power Management)
      GUID Alias: ASPM
      Possible Setting Index: 000
      Possible Setting Friendly Name: Off
      Possible Setting Index: 001
      Possible Setting Friendly Name: Moderate power savings
      Possible Setting Index: 002
      Possible Setting Friendly Name: Maximum power savings
```

To change the value, use:

`powercfg -setacvalueindex <scheme> sub_pciexpress aspm <value>`

with Index 002 from above for maximum power savings. Don’t forget to apply the value by using: `powercfg –setactive <scheme>`

## Active Power Management

Active power management involves “P-States” (a.k.a. performance or “perf” states) and is primarily intended for thermal control. StorNVMe maps the device’s operational power states to logical P-States using the Maximum Power value reported for each operational power state. When the device is active (i.e. has outstanding IO) then StorNVMe will transition the device to one of its operational power states via a P-State transition.

During Windows 10 development there was a limited set of NVMe devices that implemented more than one operational power state. Based on our power and performance measurements, we did not find a significant benefit to using any but the highest operational power state. Therefore, with the default configuration you will only see the highest operational power state utilized.

The operational power state chosen depends upon the current “max operational power” hint. This hint can have 3 different sources:

- A [passive cooling](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/passive-and-active-cooling-modes) callback from the Windows Thermal Framework.
- A change in the maximum power level power configuration setting value. (This can be triggered by a change in system power scheme or AC/DC power source.)
- A [IOCTL_STORAGE_DEVICE_POWER_CAP](https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/ntddstor/ni-ntddstor-ioctl_storage_device_power_cap) request. The lowest maximum value from these sources is the effective maximum operational power value. The mechanics of each of these sources is discussed below.

In general, StorNVMe will choose the highest operational power state that is less than or equal to the effective maximum operational power value.

For example, say an NVMe device has the following power states:

|Power State|Max Power|Operational?|
|---|---|---|
|PS0|9W|Yes|
|PS1|6W|Yes|
|PS2|4W|Yes|

The lowest maximum value from these sources is the effective maximum operational power value. The mechanics of each of these sources is discussed below.

In general, StorNVMe will choose the highest operational power state that is less than or equal to the effective maximum operational power value.

By default, there is no maximum power level so StorNVMe will always choose PS0. This is equivalent to 100%.

If the Windows Thermal Framework calls the passive cooling callback with a value of 50% then this will result in an absolute power value of (50% * (9W – 4W)) + 4W = 6W. StorNVMe will then ensure that when the device is active it will always be in PS1 since that state’s Max Power value is 6W.

Then some user mode process sends an IOCTL_STORAGE_DEVICE_POWER_CAP request to the disk with a value of 5W. StorNVMe will choose PS2 now because it is the highest operational power state whose Max Power value (4W) is less than the max operational power requirement of 5W.

If the given max operational power requirement is less than the Max Power value of the lowest operational power state, then the expectation is to simply choose the lowest operational power state. In our example, if the max operational power requirement given was 3W then StorNVMe would choose PS2 because it has no operational power state with a Max Power value of 3W or less.

If later the max operational power requirement changes to 9W then StorNVMe will go back to choosing PS0 when the device is active.

## Windows Thermal Framework Passive Cooling Callback

StorNVMe (via Storport) registers a thermal cooling interface with the Windows Thermal Framework which makes it possible for the system to throttle the NVMe device through that framework. The specifics of this are outside the scope of this document, but in general the platform specifies thermal zones and thresholds via ACPI which the Windows Thermal Framework then uses to throttle devices via callbacks to the devices’ drivers.

## Maximum Operational Power Level Power Configuration Setting

The following power configuration setting can be used to change the maximum operational power level for different system power schemes and AC/DC power source.

```
Power Setting GUID: 51dea550-bb38-4bc4-991b-eacf37be5ec8  (Maximum Power Level)
      GUID Alias: DISKMAXPOWER
      Minimum Possible Setting: 0x00000000
      Maximum Possible Setting: 0x00000064
      Possible Settings increment: 0x00000001
      Possible Settings units: %
```

To change the value for a given power scheme, use:

Windows Command PromptCopy

```
powercfg [-setacvalueindex | -setdcvalueindex] <scheme> sub_disk 51dea550-bb38-4bc4-991b-eacf37be5ec8 <value>
```

Don’t forget to apply the value by using: `powercfg –setactive <scheme>`

## IOCTL_STORAGE_DEVICE_POWER_CAP

This IOCTL can be sent to a storage device to change the maximum operational power level. For more info, see the documentation for the input/output buffer, STORAGE_DEVICE_POWER_CAP.

## Shutdown/Hibernate

When the system is being shut down or hibernated, StorNVMe sets the device’s Shutdown Notification (CC.SHN) field to 1. StorNVMe then waits for the device’s reported RTD3 entry latency for the device to indicate it is ready (by updating the Shutdown Status (CSTS.SHST) field to 2). If no entry latency value is reported, then StorNVMe will use a default value of 5 seconds. In this case, if the device takes longer than 5 seconds, then the system will continue with the shutdown or hibernate procedure without checking the NVMe device any further. OEMs should only use devices that report RTD3 entry and exit values for Modern Standby systems.

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[NVMe]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Hardware/Power Management/NVMe"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

