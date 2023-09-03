---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Bluetooth

> [!SOURCE] Sources
> - *[Bluetooth | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/bluetooth)*

## Contents

- [Features](#features)
- [Upgrading from Windows 10](#upgrading-from-windows%C2%A010)
- [Maintained guidelines from Windows 8.1](#maintained-guidelines-from-windows%C2%A081)
	- [Hardware](#hardware)
	- [Transport Bus Driver](#transport-bus-driver)
	- [Initialization and Power Handling](#initialization-and-power-handling)
	- [Radio Management](#radio-management)
	- [Mechanical](#mechanical)
	- [Third-Party Bluetooth Software](#third-party-bluetooth-software)
- [Related topics](#related-topics)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Features

- Converged Bluetooth core stack. Audio profiles differ in behavior between Windows 10 for Desktop editions (Home, Pro, Enterprise, and Education) and Windows 10 Mobile.
    
    - Compliant to the standard Bluetooth 4.1 (for all mandatory spec requirements, not for optional requirements)
    - Support for the following features:
    - [Hardware Offload (HCI)](https://learn.microsoft.com/en-us/windows-hardware/drivers/bluetooth/microsoft-defined-bluetooth-hci-commands-and-events): Microsoft defines vendor-specific HCI commands and events that are consumed by Windows
    - Dual mode support (except in Windows 10 Mobile): Dual mode support for Bluetooth BR/EDR and Bluetooth LE. For example, a Jabra Sport Pulse can transfer heart rate data over Bluetooth LE and stream music over a BR/EDR profile. Bluetooth BR/EDR, the older standard, is still needed for higher data-rate or long-range applications.
    - LE privacy 1.1: Windows protects the user’s privacy by randomizing the Bluetooth address whenever it is broadcast.
    - Enterprise Management
        - Turn Bluetooth on/off
        - Allow/Block the device going into discoverable mode
        - Change the friendly name of the Bluetooth device
        - Allow/Block advertisements
        - (1511) Allow/Block connections and pairings based off of the profiles supported. For example, block file transfers while allowing keyboards and mice.
    - Windows Phone General Distribution Release (GDR) features ported to Windows 10 (Cortana address book entry, LE HID, MAP)
    - (1607) [Pre-pair Bluetooth devices during manufacturing](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/bluetooth-prepairing): Allows for a seamless out-of-box experience that allows Bluetooth devices to just work.
    - (1703) Hands-Free Profile (HFP) 1.6 specification with Wideband speech on Windows 10 for Desktop editions.
    - (Windows 11 version 22H2) Bluetooth 5.3
    - (Windows 11 version 22H2) Bluetooth LE Audio
- APIs/Profiles
    
    - [Advertisement API](https://learn.microsoft.com/en-us/uwp/api/Windows.Devices.Bluetooth.Advertisement): Support for scanning of Bluetooth LE advertisement packets for beacons and other similar scenarios.
    - Existing Windows Phone Background support converged to Desktop.
    - Bluetooth audio enhancements (Wideband speech, aptX®) - High Definition sound while limiting Lip Sync and latency issues.
    - (1511) In App Pairing: Allows apps to discover, pair, and connect to devices all without leaving the app in question. See this [GitHub code sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/DeviceEnumerationAndPairing) and [DeviceInformationPairing class](https://learn.microsoft.com/en-us/uwp/api/Windows.Devices.Enumeration.DeviceInformationPairing) for more information.
    - (1607) Non-paired support for connections over RFCOMM: Apps can now communicate with Windows over RFCOMM without having to pair the device.
    - (1607) Map apps can now use Cortana's voice for navigation.
    - (1703) Support for [Call Control APIs](https://learn.microsoft.com/en-us/uwp/api/Windows.ApplicationModel.Calls) on Windows 10 for Desktop editions.
    - (1703) Support for GATT Server, Bluetooth LE Peripheral role and non-paired support for Bluetooth LE. See our [developer post](https://blogs.windows.com/windowsdeveloper/2017/01/13/new-bluetooth-features-in-creators-update-gatt-server-bluetooth-le/) for more details.
    - (1803) Support for Swift-Pair. See [Bluetooth Swift Pair](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/bluetooth-swift-pair)

## Upgrading from Windows 10

During upgrade, Windows will migrate Bluetooth drivers, applications, and profile packs. There is still the ability to check Windows Update for a more current driver, and install during the upgrade process. If Bluetooth is not working or missing after upgrade, please file feedback in the Feedback Hub with details of what is happening. Users may need to check their hardware manufacturer's or OEM's website to install Windows 10 compatible drivers.


## Maintained guidelines from Windows 8.1

This section cover guidelines from Windows 8.1 that are maintained for Windows 10.

### Hardware

If implemented, Bluetooth controllers must support the Bluetooth 4.0+LE specification, complying with both Basic Rate (BR) and Low Energy (LE).

The following table summarizes the supported peripheral buses and driver support.

|Bus (HCI)|Driver support|SCO support|
|---|---|---|
|Non-USB|WDK sample|Sideband I2S/PCM connection only (HCI bypass)|
|USB|In-box|In-band (SCO over HCI)|

The [WDK Bluetooth Serial HCI Bus Driver sample](https://github.com/Microsoft/Windows-driver-samples/tree/master/bluetooth/serialhcibus) is based on the UART (H4) standard as defined in the Bluetooth SIG specification. A vendor will be required to adopt and enhance the sample for any vendor-specific device requirements around device initialization and/or power management. If desired, the vendor can adopt the sample and develop for a non-UART interface as well, i.e.: non-UART controllers will also be supported by the Bluetooth stack (given a proper vendor-supplied driver).

A vendor supplied serial controller driver is necessary for UART-based controllers. For UART-specific features, see [Simple Peripheral Bus (SPB)](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/simple-peripheral-bus--spb-).

> [!Note] A non-USB connected Bluetooth controller must use a sideband channel for SCO applications, i.e.: SCO over I2S/PCM interface. SCO over HCI (in-band) will not be supported for non-USB controllers.

### Transport Bus Driver

The Windows Driver Kit (WDK) sample is available for the UART (H4) transport. A vendor can enhance it for any vendor-specific feature, including for any non-UART transports as well. There will be no limitations around the stack’s ability to support a particular transport.

There will be no changes to the existing in-box Bluetooth USB driver. We recommend using UART (H4) as the connectivity interface, since the WDK sample will be UART-based and due to UART’s lower power consumption. Voice (SCO) support must go through a “sideband” audio channel for non-USB controllers, such as an I2S/PCM interface.

### Initialization and Power Handling

For non-USB based Bluetooth controllers that require initialization see [Transport Bus Driver for Bluetooth Power Handling Guidelines](https://learn.microsoft.com/en-us/previous-versions//dn349726(v=vs.85)).

### Radio Management

The 3rd-party Bluetooth radio management plugin is not supported as Bluetooth Radio Management support is now provided inbox. Transport drivers must respond to being D3 by turning off power to the radio.

[](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/bluetooth#mechanical)

### Mechanical

We do not recommend an external switch for controlling the on/off state of the Bluetooth radio.

[](https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/bluetooth#third-party-bluetooth-software)

### Third-Party Bluetooth Software

3rd party software can be added to x86/x64 Windows PCs to provide additional Bluetooth profile functionality not natively shipped in Windows. To avoid impacting the Windows user experience, causing incompatibilities with other Windows PCs, and creating serviceability issues on upgrade, Windows recommends the following:

- Make them installable by INF so they can be easily serviced to support Windows as a Service.
- Do not replace inbox profiles, icons, or user interfaces.
- When adding profiles and/or other software, use the native Windows APIs.
- Use Wi-Fi Direct for high bandwidth peer-to-peer scenarios instead of Bluetooth High Speed (HS).
- Optimal app footprint to minimize impact on manufacturing time.
- Optimal app performance to minimize impact on off to on transitions (boot, resume from S3/S4) and energy efficiency.

## Related topics

- [Advertising API](https://learn.microsoft.com/en-us/uwp/api/Windows.Devices.Bluetooth.Advertisement)
- [Background support](https://learn.microsoft.com/en-us/uwp/api/Windows.ApplicationModel.Background)
- [GattCharacteristicNotificationTrigger](https://learn.microsoft.com/en-us/uwp/api/Windows.ApplicationModel.Background.GattCharacteristicNotificationTrigger)
- [RfcommConnectionTrigger](https://learn.microsoft.com/en-us/uwp/api/Windows.ApplicationModel.Background.RfcommConnectionTrigger)
- [Hardware Offload (HCI)](https://learn.microsoft.com/en-us/windows-hardware/drivers/bluetooth/microsoft-defined-bluetooth-hci-commands-and-events)
- [Dual mode, LE Privacy 1.1 (Bluetooth Core Spec updates)](https://www.bluetooth.org/DocMan/handlers/DownloadDoc.ashx?doc_id=282159)
- [Bluetooth audio enhancements - aptX® audio codec](http://www.csr.com/products/aptx)

***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Bluetooth]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Hardware/Bluetooth"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

