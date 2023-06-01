   wlan report body { margin: 0; padding: 0; background-color: #EFEFEF; font-family: "segoe ui light", "segoe ui"; letter-spacing: 0.03em; } table { border-collapse: collapse; } th { border: 1px solid #222; text-align: center; } tr { height: 1.5em; border: 1px solid #222; } td { border: 1px solid #222; } #top-btn { position: fixed; padding: 5px; border: 2px solid #333; cursor: pointer; } #top-btn p { margin: 0; } #report-wrapper { width: 1000px; margin: 0 auto; } #session-graph-wrapper { background-color: #1F1F1F; outline: 2px solid #AAA; } #session-graph { cursor: pointer; } #graph-event-info { float: left; width: 500px; height: 170px; color: #DDD; padding: 0px 30px 0px 20px; } #graph-event-info h4 { margin: 0px 0px 10px 0px; } #event-info { margin: 0; height: 135px overflow: scroll; } #sysinfo { margin: 0px 0px 30px 0px; } #sysinfo p { margin: 0; padding: 0; } #report-info p { margin: 0; padding: 0; } #disconnect-status tr { border: 1px solid #222; } #disconnect-status td { border: 1px solid #222; } #disconnect-status .status { width: 300px; padding-top: 0px; } #disconnect-reasons .reason { width: 800px; padding-top: 0; } .count { width: 75px; text-align: center; } .graph-background { position: absolute; z-index: -1; height: 1.5em; margin: -1px; background-color: rgb(171,168,244); } .graph-background.success { background-color: rgb(108, 216, 108); } .graph-background.failure { background-color: rgb(216, 108, 108); } .graph-background.warning { background-color: rgb(216, 216, 108); } #session-durations { border-left: 1px solid #222; overflow: hidden; } #duration-labels { text-align: center; } #duration-graph { height: 550px; border: none; } #duration-graph td { width: 80px; padding: 0px 2px 0px 2px; vertical-align: top; position: relative; border: none; } .duration-bar { width: 80px; position: absolute; } .bar-label { width: 80px; position: absolute; text-align: center; font-weight: bold; } .bar-background { background-color: rgb(171,168,244); display: block; width: 100%; height: 100%; outline: 1px solid #222; } .session { background-color: #FFF; margin: 0px 0px 20px 0px; padding: 10px; border: 2px solid #666; } .session p { margin: 0.2em; } .session table { width: 100%; } .session .event-header { width: 75px; } .session .time-header { width: 180px; } .session .message-header { width: auto; } .successful { background-color: #1BEB00; } .warning { background-color: #EBEB00; } .failed { background-color: #F00; } .info { background-color: #E2E2E2; } .message { width: 700px; height: 1.5em; overflow: hidden; white-space: pre; text-overflow: ellipsis; } .message.show { height: auto; overflow: auto; white-space: normal; } .message .expand-btn { cursor: pointer; } .error { background-color: rgb(255,178,178); font-weight: bold; } .ndis.sleep { background-color: #AF9AE4; } .ndis.wake { background-color: #E49AEF; } .wlan { background-color: #FFF; } .wlan.connect { background-color: #9AE4A6; } .wlan.disconnect { background-color: #F5BE9C; } .ncsi.internet { background-color: #9CCAF5; } .ncsi.local { background-color: #F1F59C; } .ncsi.none { background-color: #F59C9C; } .wcm { background-color: #F0FFFF; } .eap { background-color: #FFFFF0; } .glow { font-weight: bold; outline: 3px solid #000000; } #commands-output { margin: 0px 0px 30px 0px; } .command-output { background-color: #000; color: #C0C0C0; padding: 5px; outline: 5px solid #BBB; }

Top

Wlan Report
===========

#### Summary

Hover over a session or event to view a summary  
Click on an event to jump to it in the session list

Report Info
-----------

Report created:**2023-06-01T19:00:22Z**

Report duration:**3 days**

General System Info
-------------------

ComputerName: **DESKTOP-CUSTOM**

System Manufacturer:**Micro-Star International Co., Ltd.**

System Product Name:**GE66 Raider 10SFS**

BIOS Date:**03/10/2021**

BIOS Version:**E1541IMS.10F**

OS Build:**25375.1.amd64fre.zn\_release.230520-1632**

Machine Id: **{D5B10ADC-3B19-4E06-B5E8-64EA5D6279C3}**

MDM joined: **False**

User Info
---------

Username: **jimmy**

User Domain:**DESKTOP-CUSTOM**

User DNS Domain:**Unknown**

Network Adapters
----------------

Device: **Realtek USB GbE Family Controller #12**

PNP ID: **USB\\VID\_0BDA&PID\_8153\\000001**

Guid: **{D625BD1B-BED9-435F-9B2C-64E0D46E556E}**

Current driver version: **10.59.20.420**

Driver date: **5-15-2023**

DevNode flags: **0x180600a**

  

Device: **Killer E3100X 2.5 Gigabit Ethernet Controller**

PNP ID: **PCI\\VEN\_8086&DEV\_3101&SUBSYS\_00008086&REV\_02\\2CF05DFFFF6A29F000**

Guid: **{D5555413-B9F5-4D09-82D0-559683DB60D6}**

Current driver version: **1.1.4.38**

Driver date: **2-9-2023**

DevNode flags: **0x180200a**

  

Device: **Microsoft Kernel Debug Network Adapter**

PNP ID: **ROOT\\KDNIC\\0000**

Guid: **{0F42BEC9-948A-4C97-B718-BDD68A9AABFB}**

Current driver version: **10.0.25375.1**

Driver date: **6-21-2006**

DevNode flags: **0x4180200b**

  

Device: **Microsoft Wi-Fi Direct Virtual Adapter #8**

PNP ID: **{5D624F94-8850-40C3-A3FA-A4FD2080BAF3}\\VWIFIMP\_WFD\\4&2A6BF2FD&7&11**

Guid: **{919BD590-B836-49EC-B43E-3DC255B853A6}**

Current driver version: **10.0.25375.1**

Driver date: **6-21-2006**

DevNode flags: **0x4180200a**

  

Device: **Microsoft Wi-Fi Direct Virtual Adapter #9**

PNP ID: **{5D624F94-8850-40C3-A3FA-A4FD2080BAF3}\\VWIFIMP\_WFD\\4&2A6BF2FD&7&12**

Guid: **{E0CB7AA7-12D0-4463-B95C-6DB6E0C0BC0A}**

Current driver version: **10.0.25375.1**

Driver date: **6-21-2006**

DevNode flags: **0x4180200a**

  

Device: **Killer(R) Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW)**

PNP ID: **PCI\\VEN\_8086&DEV\_06F0&SUBSYS\_16521A56&REV\_00\\3&11583659&0&A3**

Guid: **{0BB94A3D-E696-4D68-AC13-74423DF1D203}**

Current driver version: **22.200.2.1**

Driver date: **3-9-2023**

DevNode flags: **0x180200a**

  

Device: **Hyper-V Virtual Switch Extension Adapter**

PNP ID: **ROOT\\VMS\_VSMP\\0000**

Guid: **{F25BD47F-C829-439C-86A5-D8F1E99B10C3}**

Current driver version: **10.0.25375.1**

Driver date: **6-21-2006**

DevNode flags: **0x4180200b**

  

Device: **Hyper-V Virtual Switch Extension Adapter #2**

PNP ID: **ROOT\\VMS\_VSMP\\0001**

Guid: **{21AD121D-EBF4-440E-A7CC-D24E7F77222B}**

Current driver version: **10.0.25375.1**

Driver date: **6-21-2006**

DevNode flags: **0x4180200b**

  

Script Output
-------------

### Output for _'ipconfig /all'_

Windows IP Configuration Host Name . . . . . . . . . . . . : DESKTOP-CUSTOM Primary Dns Suffix . . . . . . . : Node Type . . . . . . . . . . . . : Hybrid IP Routing Enabled. . . . . . . . : No WINS Proxy Enabled. . . . . . . . : No Ethernet adapter Ethernet 15: Media State . . . . . . . . . . . : Media disconnected Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Realtek USB GbE Family Controller #12 Physical Address. . . . . . . . . : 34-29-8F-79-01-66 DHCP Enabled. . . . . . . . . . . : Yes Autoconfiguration Enabled . . . . : Yes Ethernet adapter Ethernet: Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Killer E3100X 2.5 Gigabit Ethernet Controller Physical Address. . . . . . . . . : 2C-F0-5D-6A-29-F0 DHCP Enabled. . . . . . . . . . . : Yes Autoconfiguration Enabled . . . . : Yes IPv6 Address. . . . . . . . . . . : 2601:c2:1600:1ad4:fbab:6329:b76:8c3d(Preferred) Temporary IPv6 Address. . . . . . : 2601:c2:1600:1ad4:1d55:b72d:8d8e:72e6(Preferred) Link-local IPv6 Address . . . . . : fe80::7eaa:dd2e:fbfe:ec88%41(Preferred) IPv4 Address. . . . . . . . . . . : 192.168.1.9(Preferred) Subnet Mask . . . . . . . . . . . : 255.255.255.0 Lease Obtained. . . . . . . . . . : Thursday, June 1, 2023 9:14:12 AM Lease Expires . . . . . . . . . . : Friday, June 2, 2023 9:14:12 AM Default Gateway . . . . . . . . . : fe80::2a80:88ff:fe24:ba66%41 192.168.1.1 DHCP Server . . . . . . . . . . . : 192.168.1.1 DHCPv6 IAID . . . . . . . . . . . : 1026355293 DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-E6-1B-1D-2C-F0-5D-6A-29-F0 DNS Servers . . . . . . . . . . . : 2001:558:feed::1 2001:558:feed::2 192.168.1.1 NetBIOS over Tcpip. . . . . . . . : Enabled Wireless LAN adapter Wi-Fi: Media State . . . . . . . . . . . : Media disconnected Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Killer(R) Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) Physical Address. . . . . . . . . : 94-E7-0B-03-87-F2 DHCP Enabled. . . . . . . . . . . : Yes Autoconfiguration Enabled . . . . : Yes Wireless LAN adapter Local Area Connection\* 5: Media State . . . . . . . . . . . : Media disconnected Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Microsoft Wi-Fi Direct Virtual Adapter #8 Physical Address. . . . . . . . . : 94-E7-0B-03-87-F3 DHCP Enabled. . . . . . . . . . . : Yes Autoconfiguration Enabled . . . . : Yes Wireless LAN adapter Local Area Connection\* 6: Media State . . . . . . . . . . . : Media disconnected Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Microsoft Wi-Fi Direct Virtual Adapter #9 Physical Address. . . . . . . . . : 96-E7-0B-03-87-F2 DHCP Enabled. . . . . . . . . . . : No Autoconfiguration Enabled . . . . : Yes Ethernet adapter vEthernet (Default Switch): Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Hyper-V Virtual Ethernet Adapter Physical Address. . . . . . . . . : 00-15-5D-25-A8-66 DHCP Enabled. . . . . . . . . . . : No Autoconfiguration Enabled . . . . : Yes Link-local IPv6 Address . . . . . : fe80::732c:86aa:1dd6:d409%23(Preferred) IPv4 Address. . . . . . . . . . . : 172.26.240.1(Preferred) Subnet Mask . . . . . . . . . . . : 255.255.240.0 Default Gateway . . . . . . . . . : DHCPv6 IAID . . . . . . . . . . . : 385881437 DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-E6-1B-1D-2C-F0-5D-6A-29-F0 NetBIOS over Tcpip. . . . . . . . : Enabled Ethernet adapter vEthernet (Default Switch (Ethernet 15)): Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Hyper-V Virtual Ethernet Adapter #2 Physical Address. . . . . . . . . : 00-15-5D-D7-49-B2 DHCP Enabled. . . . . . . . . . . : No Autoconfiguration Enabled . . . . : Yes Link-local IPv6 Address . . . . . : fe80::8b9d:5496:f558:2f94%49(Preferred) IPv4 Address. . . . . . . . . . . : 172.23.80.1(Preferred) Subnet Mask . . . . . . . . . . . : 255.255.240.0 Default Gateway . . . . . . . . . : DHCPv6 IAID . . . . . . . . . . . : 822089053 DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-E6-1B-1D-2C-F0-5D-6A-29-F0 NetBIOS over Tcpip. . . . . . . . : Enabled Ethernet adapter vEthernet (Default Switch (Ethernet)): Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Hyper-V Virtual Ethernet Adapter #3 Physical Address. . . . . . . . . : 00-15-5D-1D-3C-3F DHCP Enabled. . . . . . . . . . . : No Autoconfiguration Enabled . . . . : Yes Link-local IPv6 Address . . . . . : fe80::8c68:e46c:4543:6e53%54(Preferred) IPv4 Address. . . . . . . . . . . : 172.18.112.1(Preferred) Subnet Mask . . . . . . . . . . . : 255.255.240.0 Default Gateway . . . . . . . . . : DHCPv6 IAID . . . . . . . . . . . : 905975133 DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-E6-1B-1D-2C-F0-5D-6A-29-F0 NetBIOS over Tcpip. . . . . . . . : Enabled Ethernet adapter vEthernet (Default Switch (Wi-Fi)): Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Hyper-V Virtual Ethernet Adapter #4 Physical Address. . . . . . . . . : 00-15-5D-54-C8-31 DHCP Enabled. . . . . . . . . . . : No Autoconfiguration Enabled . . . . : Yes Link-local IPv6 Address . . . . . : fe80::e3b2:8bf8:4e56:d90e%58(Preferred) IPv4 Address. . . . . . . . . . . : 172.19.48.1(Preferred) Subnet Mask . . . . . . . . . . . : 255.255.240.0 Default Gateway . . . . . . . . . : DHCPv6 IAID . . . . . . . . . . . : 973083997 DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-E6-1B-1D-2C-F0-5D-6A-29-F0 NetBIOS over Tcpip. . . . . . . . : Enabled Ethernet adapter vEthernet (WSL): Connection-specific DNS Suffix . : Description . . . . . . . . . . . : Hyper-V Virtual Ethernet Adapter #5 Physical Address. . . . . . . . . : 00-15-5D-B2-09-B2 DHCP Enabled. . . . . . . . . . . : No Autoconfiguration Enabled . . . . : Yes Link-local IPv6 Address . . . . . : fe80::6906:10a4:fa5a:f30a%82(Preferred) IPv4 Address. . . . . . . . . . . : 192.168.208.1(Preferred) Subnet Mask . . . . . . . . . . . : 255.255.240.0 Default Gateway . . . . . . . . . : DHCPv6 IAID . . . . . . . . . . . : 1375737181 DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-E6-1B-1D-2C-F0-5D-6A-29-F0 NetBIOS over Tcpip. . . . . . . . : Enabled

### Output for _'netsh wlan show all'_

Wireless System Information Summary (Time: 6/1/2023 7:00:24 PM Eastern Daylight Time) ======================================================================= ============================== SHOW DRIVERS =========================== ======================================================================= Interface name: Wi-Fi Driver : Killer(R) Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) Vendor : Intel Corporation Provider : Intel Date : 3/9/2023 Version : 22.200.2.1 INF file : oem118.inf Type : Native Wi-Fi Driver Radio types supported : 802.11b 802.11g 802.11n 802.11a 802.11ac FIPS 140-2 mode supported : Yes 802.11w Management Frame Protection supported : Yes Hosted network supported : No Authentication and cipher supported in infrastructure mode: Open None Open WEP-40bit Open WEP-104bit Open WEP WPA-Enterprise TKIP WPA-Enterprise CCMP WPA-Personal TKIP WPA-Personal CCMP WPA2-Enterprise TKIP WPA2-Enterprise CCMP WPA2-Personal TKIP WPA2-Personal CCMP Open Vendor defined WPA3-Personal CCMP Vendor defined Vendor defined WPA3-Enterprise 192 Bits GCMP-256 OWE CCMP Number of supported bands : 2 2.4 GHz \[ 0 MHz - 0 MHz\] 5 GHz \[ 0 MHz - 0 MHz\] IHV service present : Yes IHV adapter OUI : \[00 00 00\], type: \[00\] IHV extensibility DLL path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll IHV UI extensibility ClSID: {00000000-0000-0000-0000-000000000000} IHV diagnostics CLSID : {00000000-0000-0000-0000-000000000000} Wireless Display Supported: Yes (Graphics Driver: Yes, Wi-Fi Driver: Yes) ======================================================================= ============================= SHOW INTERFACES ========================= ======================================================================= There is 1 interface on the system: Name : Wi-Fi Description : Killer(R) Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW) GUID : 0bb94a3d-e696-4d68-ac13-74423df1d203 Physical address : 94:e7:0b:03:87:f2 Interface type : Primary State : disconnected Radio status : Hardware On Software Off Hosted network status : Not available ======================================================================= =========================== SHOW HOSTED NETWORK ======================= ======================================================================= Hosted network settings ----------------------- Mode : Allowed Settings : <Not configured> Hosted network status --------------------- Status : Not available ======================================================================= ============================= SHOW SETTINGS =========================== ======================================================================= Wireless LAN settings --------------------- Show blocked networks in visible network list: No Only use GP profiles on GP-configured networks: No Hosted network mode allowed in WLAN service: Yes Allow shared user credentials for network authentication: Yes Block period: Not Configured. Auto configuration logic is enabled on interface "Wi-Fi" MAC randomization disabled on interface Wi-Fi ======================================================================= ============================== SHOW FILTERS =========================== ======================================================================= Allow list on the system (group policy) --------------------------------------- <None> Allow list on the system (user) ------------------------------- <None> Block list on the system (group policy) --------------------------------------- <None> Block list on the system (user) ------------------------------- <None> ======================================================================= =========================== SHOW CREATEALLUSER ======================== ======================================================================= Everyone is allowed to create all user profiles. ======================================================================= ============================= SHOW PROFILES =========================== ======================================================================= Profiles on interface Wi-Fi: Group policy profiles (read only) --------------------------------- <None> User profiles ------------- All User Profile : bradford-5G-2 All User Profile : bradford-5G-1 All User Profile : bradford All User Profile : BriggsWifi ======================================================================= ========================== SHOW PROFILES NAMES ======================== ======================================================================= Profile bradford-5G-2 on interface Wi-Fi: ======================================================================= Applied: All User Profile Profile information ------------------- Version : 1 Type : Wireless LAN Name : bradford-5G-2 Control options : Connection mode : Connect manually Network broadcast : Connect only if this network is broadcasting AutoSwitch : Do not switch to other networks MAC Randomization : Disabled Connectivity settings --------------------- Number of SSIDs : 1 SSID name : "bradford-5G-2" Network type : Infrastructure Radio type : \[ Any Radio Type \] Vendor extension : Not present Security settings ----------------- Authentication : WPA2-Personal Cipher : CCMP Authentication : WPA2-Personal Cipher : GCMP Security key : Present Cost settings ------------- Cost : Unrestricted Congested : No Approaching Data Limit : No Over Data Limit : No Roaming : No Cost Source : Default Profile bradford-5G-1 on interface Wi-Fi: ======================================================================= Applied: All User Profile Profile information ------------------- Version : 1 Type : Wireless LAN Name : bradford-5G-1 Control options : Connection mode : Connect automatically Network broadcast : Connect only if this network is broadcasting AutoSwitch : Do not switch to other networks MAC Randomization : Disabled Connectivity settings --------------------- Number of SSIDs : 1 SSID name : "bradford-5G-1" Network type : Infrastructure Radio type : \[ Any Radio Type \] Vendor extension : Not present Security settings ----------------- Authentication : WPA2-Personal Cipher : CCMP Authentication : WPA2-Personal Cipher : GCMP Security key : Present Cost settings ------------- Cost : Unrestricted Congested : No Approaching Data Limit : No Over Data Limit : No Roaming : No Cost Source : Default Profile bradford on interface Wi-Fi: ======================================================================= Applied: All User Profile Profile information ------------------- Version : 1 Type : Wireless LAN Name : bradford Control options : Connection mode : Connect automatically Network broadcast : Connect only if this network is broadcasting AutoSwitch : Do not switch to other networks MAC Randomization : Disabled Connectivity settings --------------------- Number of SSIDs : 1 SSID name : "bradford" Network type : Infrastructure Radio type : \[ Any Radio Type \] Vendor extension : Not present Security settings ----------------- Authentication : WPA2-Personal Cipher : CCMP Authentication : WPA2-Personal Cipher : GCMP Security key : Present Cost settings ------------- Cost : Unrestricted Congested : No Approaching Data Limit : No Over Data Limit : No Roaming : No Cost Source : Default Profile BriggsWifi on interface Wi-Fi: ======================================================================= Applied: All User Profile Profile information ------------------- Version : 1 Type : Wireless LAN Name : BriggsWifi Control options : Connection mode : Connect automatically Network broadcast : Connect only if this network is broadcasting AutoSwitch : Do not switch to other networks MAC Randomization : Disabled Connectivity settings --------------------- Number of SSIDs : 1 SSID name : "BriggsWifi" Network type : Infrastructure Radio type : \[ Any Radio Type \] Vendor extension : Not present Security settings ----------------- Authentication : WPA2-Personal Cipher : CCMP Authentication : WPA2-Personal Cipher : GCMP Security key : Present Cost settings ------------- Cost : Unrestricted Congested : No Approaching Data Limit : No Over Data Limit : No Roaming : No Cost Source : Default ======================================================================= ======================= SHOW NETWORKS MODE=BSSID ====================== ======================================================================= Interface name : Wi-Fi ======================================================================= ======================= SHOW INTERFACE CAPABILITIES =================== ======================================================================= Wireless System Capabilities ---------------------------- Number of antennas connected to the 802.11 radio (value not available) Max number of channels the device can operate on, simultaneously (value not available) Co-existence Support : Unknown Wireless Device Capabilities ---------------------------- Interface name: Wi-Fi WDI Version (Windows) : 0.1.1.12 WDI Version (IHV) : 0.1.1.12 WiFiCx Version (IHV) : WiFiCx Interface Not Supported Firmware Version : D4.C2 Station : Supported Soft AP : Not supported Network monitor mode : Not supported Wi-Fi Direct Device : Supported Wi-Fi Direct GO : Supported Wi-Fi Direct Client : Supported Protected Management Frames : Supported DOT11k neighbor report : Supported ANQP Service Information Discovery : Supported Action Frame : Supported Diversity Antenna : Supported IBSS : Not Supported Promiscuous Mode : Not Supported P2P Device Discovery : Supported P2P Service Name Discovery : Supported P2P Service Info Discovery : Not Supported P2P Background Discovery : Supported P2P GO on 5 GHz : Supported P2P GO on 6 GHz : Not Supported P2P Sae on GO : Not Supported ASP 2.0 Service Name Discovery : Not Supported ASP 2.0 Service Information Discovery : Not Supported IP Docking Capable : Not Supported FIPS : Supported Instant Connect : Supported Dx Standby NLO : Supported Extended Channel Switch Announcement : Supported Function Level Reset : Supported Platform Level Reset : Supported Bus Level Reset : Supported MAC Randomization : Supported Fast Transition : Supported MU-MIMO : Supported Miracast Sink : Supported BSS Transition (802.11v) : Supported IHV Extensibility Module Configured : Supported SAE Authentication : Supported SAE Hash-to-Element Authentication : Supported WPA3 SUITE-B Authentication : Supported WPA3 SUITE-B FIPS Mode : Not Supported OWE Authentication : Supported FTM as Initiator : Not Supported MBO Support : Supported Number of Tx Spatial Streams : 2 Number of Rx Spatial Streams : 2 Number of Concurrent Channels Supported : 0 P2P GO ports count : 1 P2P Clients Port Count : 1 P2P Max Mobile AP Clients : 8 Max ANQP Service Advertisements Supported : 0 Maximum Number of Secondary STAs Supported : 0 Number of MLO Connections Supported : 0 QoS MSCS Supported : Not Supported QoS DSCP to UP Mapping Supported : Not Supported Wpa3-Sae with 384-bit Pmk Supported : Not Supported Co-existence Support : Wi-Fi performance is maintained

### Output for _'certutil -store -silent My & certutil -store -silent -user My'_

My "Personal" ================ Certificate 0 ================ Serial Number: 6f4712c8b2db28924145812d26baf09b Issuer: CN=JimBrigDevt NotBefore: 3/10/2023 7:26 PM NotAfter: 3/10/2024 7:46 PM Subject: CN=JimBrigDevt Signature matches Public Key Root Certificate: Subject matches Issuer Cert Hash(sha1): c6a3bb2a0f2697a499ab97ed0d4f30bb770f1dcb Key Container = te-17582869-6761-449e-acba-19cc60027b39 Unique container name: 5ebb8964060d3617e39cafeb52643b4e\_82e57ac4-4563-4ea2-919d-57ff382fd581 Provider = Microsoft Software Key Storage Provider Private key is NOT plain text exportable Encryption test passed ================ Certificate 1 ================ Serial Number: 51cd681f726169bc4347cdd06182d1f3 Issuer: CN=JimBrig NotBefore: 5/26/2023 5:22 PM NotAfter: 5/26/2025 5:32 PM Subject: CN=JimBrig Signature matches Public Key Root Certificate: Subject matches Issuer Cert Hash(sha1): c69d0d61d9676ab8f5c9a492c2c282c5be326cac Key Container = te-ee801013-e7e8-4671-9525-1effd1ab0d06 Unique container name: fac51dd8310319597791e7b86b1c5e63\_82e57ac4-4563-4ea2-919d-57ff382fd581 Provider = Microsoft Software Key Storage Provider Private key is NOT plain text exportable Encryption test passed ================ Certificate 2 ================ Serial Number: 3de3d046f7e7288144e76745697aaa89 Issuer: CN=localhost NotBefore: 6/26/2022 12:34 AM NotAfter: 6/25/2027 8:00 PM Subject: CN=localhost Signature matches Public Key Root Certificate: Subject matches Issuer Cert Hash(sha1): 6e37adcaf40b071758a32292e51bacf6030bacab Key Container = IIS Express Development Certificate Container Provider = Microsoft RSA SChannel Cryptographic Provider Missing stored keyset ================ Certificate 3 ================ Serial Number: f0067219fc1183ad Issuer: CN=NVIDIA GameStream Server NotBefore: 5/18/2023 7:30 PM NotAfter: 5/18/2043 7:30 PM Subject: CN=NVIDIA GameStream Server Signature matches Public Key Root Certificate: Subject matches Issuer Cert Hash(sha1): 29c6792ae836a30736b92505cff768dfba89e51c Key Container = {4297A0ED-25FF-44EC-9283-2E80A68D8917} Unique container name: e82b405c9870d760a103c8534310e511\_82e57ac4-4563-4ea2-919d-57ff382fd581 Provider = Microsoft Enhanced Cryptographic Provider v1.0 Encryption test passed My "Personal" ================ Certificate 0 ================ Serial Number: 010b483239bd61d6905a Issuer: CN=Apple iPhone Device CA, OU=Apple iPhone, O=Apple Inc., C=US NotBefore: 5/31/2023 5:42 PM NotAfter: 5/31/2024 5:47 PM Subject: CN=9E01AD5B-75A0-457C-A236-EE503C7225CE Non-root Certificate Cert Hash(sha1): d37f2aee292910ab5887dc1356d7e5926767a151 No key provider information Cannot find the certificate and private key for decryption. ================ Certificate 1 ================ Serial Number: 9749ab2edc33ac4a Issuer: CN=localhost NotBefore: 6/3/2022 1:00 AM NotAfter: 6/3/2023 1:00 AM Subject: CN=localhost Signature matches Public Key Root Certificate: Subject matches Issuer Cert Hash(sha1): 99b3cf3184b31b9deef7de6557f140a55795b243 Key Container = {5DD7555C-1EA0-47EB-8949-BBEBFED591CF} Unique container name: aeac3536481b4525a56cddae268e5ccd\_82e57ac4-4563-4ea2-919d-57ff382fd581 Provider = Microsoft Software Key Storage Provider Private key is NOT plain text exportable Encryption test passed ================ Certificate 2 ================ Serial Number: 03cd529a2bbac0fcf016 Issuer: CN=Apple iPhone Device CA, OU=Apple iPhone, O=Apple Inc., C=US NotBefore: 7/16/2022 8:44 PM NotAfter: 7/16/2023 8:49 PM Subject: CN=407C5073-51C4-4127-B233-6D0F031383EF Non-root Certificate Cert Hash(sha1): 7bfe0347922d4162ede2d056702545aad2259d50 No key provider information Cannot find the certificate and private key for decryption. ================ Certificate 3 ================ Serial Number: ef630b691f80aca9469cc34acbc2ea30 Issuer: DC=net + DC=windows + CN=MS-Organization-Access + OU=82dbaca4-3e81-46ca-9c73-0950c1eaca97 NotBefore: 12/30/2022 5:10 PM NotAfter: 12/30/2032 5:40 PM Subject: CN=20b802d5-2957-4d01-86af-58d019ef7b4b Non-root Certificate Cert Hash(sha1): 3c3909ca689b069882719d9628f91b5acf594727 Key Container = be2844f6-08e2-4cde-892d-e6907df49f1f Provider = Microsoft Platform Crypto Provider Missing stored keyset

Profile Output
--------------

<!--Interface: Wi-Fi, Profile: BriggsWifi--> <?xml version="1.0"?><WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"><name>BriggsWifi</name><SSIDConfig><SSID><hex>42726967677357696669</hex><name>BriggsWifi</name></SSID></SSIDConfig><connectionType>ESS</connectionType><connectionMode>auto</connectionMode><MSM><security><authEncryption><authentication>WPA2PSK</authentication><encryption>AES</encryption><useOneX>false</useOneX></authEncryption><sharedKey><keyType>passPhrase</keyType><protected>true</protected><keyMaterial>01000000D08C9DDF0115D1118C7A00C04FC297EB01000000F8641A02D133854B8B7B43511F7B4FC80000000002000000000010660000000100002000000027165B5B74048E275EBB8163C0B90A121125E39DA642085E091E2E17EACB6A78000000000E8000000002000020000000831A3B344F01D396C1B4E7D1B31A083F6EDE896BD59C50F54A566776D4D714C310000000071749C268D9CAF19A618DAD4A699D0240000000FCDA6F58D0A14E9F59FCCB4F2B3A82010EF6DC19573A40B98941D9944A237A18F74987724A197D8AEF0A51E715B375C9281CD01EFC06FB6B9DB79119144AF8B0</keyMaterial></sharedKey></security></MSM><MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3"><enableRandomization>false</enableRandomization><randomizationSeed>4234628642</randomizationSeed></MacRandomization></WLANProfile> <!--Interface: Wi-Fi, Profile: bradford--> <?xml version="1.0"?><WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"><name>bradford</name><SSIDConfig><SSID><hex>62726164666F7264</hex><name>bradford</name></SSID></SSIDConfig><connectionType>ESS</connectionType><connectionMode>auto</connectionMode><MSM><security><authEncryption><authentication>WPA2PSK</authentication><encryption>AES</encryption><useOneX>false</useOneX></authEncryption><sharedKey><keyType>passPhrase</keyType><protected>true</protected><keyMaterial>01000000D08C9DDF0115D1118C7A00C04FC297EB01000000F8641A02D133854B8B7B43511F7B4FC8000000000200000000001066000000010000200000003A5E2ECFB5462C1532A98141E883B3D9D170B62BE93E80F7F5B9C8F8464B862D000000000E8000000002000020000000B1B8A7829FF106E1666640336C14F2937CAC12E4F7216E01204C80CA8094602C10000000A57B04D5B1A5AF3B37DBD1E63C22653740000000B333DFB659EC87B24B57256781246868559725DEC81E9467294408B2FABBFA7F29033EC49F9E61B192C2E9FCFCF10538D12F75574A664414A50B1263DBD4A7BE</keyMaterial></sharedKey></security></MSM><MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3"><enableRandomization>false</enableRandomization><randomizationSeed>3059565716</randomizationSeed></MacRandomization></WLANProfile> <!--Interface: Wi-Fi, Profile: bradford-5G-1--> <?xml version="1.0"?><WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"><name>bradford-5G-1</name><SSIDConfig><SSID><hex>62726164666F72642D35472D31</hex><name>bradford-5G-1</name></SSID></SSIDConfig><connectionType>ESS</connectionType><connectionMode>auto</connectionMode><MSM><security><authEncryption><authentication>WPA2PSK</authentication><encryption>AES</encryption><useOneX>false</useOneX></authEncryption><sharedKey><keyType>passPhrase</keyType><protected>true</protected><keyMaterial>01000000D08C9DDF0115D1118C7A00C04FC297EB01000000F8641A02D133854B8B7B43511F7B4FC800000000020000000000106600000001000020000000DE6C56DE5563D199951282A005F0C7CDB836AE8C32C9C128F4A13B45006570BE000000000E800000000200002000000090B727BCD10C3409342C924F4323805F8F2200ADF1637FA559B72A011AB9955410000000D5691E182C211C2F77AA3D446467D91040000000AC595E157E62D256E61E96C82C01A1D882C779246BA0CCFB56F10B16B96B07F54C437AB20671840F8F24AFCED4A85810FF37C74C1BC2D2AA0178C5AA8956DFE8</keyMaterial></sharedKey></security></MSM><MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3"><enableRandomization>false</enableRandomization><randomizationSeed>3769210152</randomizationSeed></MacRandomization></WLANProfile> <!--Interface: Wi-Fi, Profile: bradford-5G-2--> <?xml version="1.0"?><WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"><name>bradford-5G-2</name><SSIDConfig><SSID><hex>62726164666F72642D35472D32</hex><name>bradford-5G-2</name></SSID></SSIDConfig><connectionType>ESS</connectionType><connectionMode>manual</connectionMode><MSM><security><authEncryption><authentication>WPA2PSK</authentication><encryption>AES</encryption><useOneX>false</useOneX></authEncryption><sharedKey><keyType>passPhrase</keyType><protected>true</protected><keyMaterial>01000000D08C9DDF0115D1118C7A00C04FC297EB01000000F8641A02D133854B8B7B43511F7B4FC8000000000200000000001066000000010000200000009EB69AD5C968F0965FE10DA05C81220A4CD47D4C2B97B568AFD5780000807471000000000E8000000002000020000000E9778449143923460F041FB6B6CB15A973F1A903B83D4247EDF0D33970DBFA3710000000B03B3C2DBED719CC5A54019A06BF75A7400000009414AEA7EE2F53889ADABBA03BE95A397C19DE76120CDF6E1ADEF3D225DC16AC7FAB6DD2C26633B3F0349C4CA8775706CC51E264E4429B2339C49B6F6639C7B1</keyMaterial></sharedKey></security></MSM><MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3"><enableRandomization>false</enableRandomization><randomizationSeed>1531969526</randomizationSeed></MacRandomization></WLANProfile>

Summary
-------

### Session Success/Failures

Status

Count

  Successes

0

  Failures

0

  Warnings

0

### Disconnect Reasons

Reason

Count

### Session Durations

0  

0  

0  

0  

0  

0  

0  

0 - 1  
minutes

1 - 5  
minutes

5 - 10  
minutes

10 - 30  
minutes

30 - 60  
minutes

60 - 360  
minutes

360+  
minutes

Wireless Sessions
-----------------

EventId

Time

Message

10002

2023-05-29T20:48:50

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-29T20:48:50

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-29T20:49:15

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T00:49:14.500000000Z.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-29T20:49:30

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-29T20:49:30

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-05-29T20:49:30

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-05-29T20:49:31

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

1015

2023-05-29T20:49:31

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: true

1015

2023-05-29T20:49:36

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: false

10002

2023-05-29T22:13:16

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-29T22:13:16

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-29T22:13:42

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T02:13:41.500000000Z.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-29T22:13:56

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-29T22:13:56

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-05-29T22:13:57

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-05-29T22:13:57

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

1015

2023-05-29T22:13:57

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: true

1015

2023-05-29T22:16:48

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: false

10002

2023-05-30T01:50:06

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-30T01:50:06

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-30T01:50:30

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T05:50:29.500000000Z.

12

2023-05-30T01:52:04

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T05:52:03.500000000Z.

12

2023-05-30T01:53:30

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T05:53:29.500000000Z.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-30T01:53:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-30T01:53:45

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-05-30T01:53:45

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-05-30T01:53:46

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

10002

2023-05-30T02:08:27

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-30T02:08:27

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-30T02:08:55

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T06:08:54.500000000Z.

12

2023-05-30T02:09:46

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T06:09:45.500000000Z.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-30T02:10:04

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-30T02:10:05

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-05-30T02:10:05

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-05-30T02:10:05

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

10002

2023-05-30T02:13:15

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-30T02:13:15

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-30T02:13:40

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T06:13:39.500000000Z.

12

2023-05-30T02:16:28

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T06:16:27.500000000Z.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-30T02:16:42

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-30T02:16:42

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-05-30T02:16:43

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-05-30T02:16:43

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

10002

2023-05-30T02:19:58

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-30T02:19:58

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-30T02:20:23

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎30T06:20:22.500000000Z.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-30T02:20:44

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-30T02:20:45

\[+\]WLAN AutoConfig service has successfully started.  

1009

2023-05-30T02:20:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

10001

2023-05-30T02:20:45

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

10002

2023-05-31T00:34:56

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-31T00:34:56

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-31T00:35:22

\[+\]The operating system started at system time ‎2023‎-‎05‎-‎31T04:35:21.500000000Z.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-31T00:36:09

\[+\]WLAN AutoConfig service has successfully started.  

1009

2023-05-31T00:36:09

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

10001

2023-05-31T00:36:10

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

12

2023-05-31T20:09:37

\[+\]The operating system started at system time ‎2023‎-‎06‎-‎01T00:09:36.500000000Z.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-31T20:10:00

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-31T20:10:00

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-05-31T20:10:01

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-05-31T20:10:01

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

1015

2023-05-31T20:17:04

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: true

1015

2023-05-31T20:17:09

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: false

10002

2023-05-31T20:25:40

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

10001

2023-05-31T20:25:40

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

10002

2023-05-31T21:09:30

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-31T21:09:30

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-31T21:09:59

\[+\]The operating system started at system time ‎2023‎-‎06‎-‎01T01:09:58.500000000Z.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-31T21:10:45

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-31T21:10:45

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-05-31T21:10:46

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-05-31T21:10:46

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

10002

2023-05-31T21:39:44

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-05-31T21:39:44

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-05-31T21:40:08

\[+\]The operating system started at system time ‎2023‎-‎06‎-‎01T01:40:07.500000000Z.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-05-31T21:40:54

\[+\]WLAN AutoConfig service has successfully started.  

1009

2023-05-31T21:40:54

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

10001

2023-05-31T21:40:54

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1015

2023-05-31T23:39:20

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: true

1015

2023-05-31T23:43:36

\[+\]Interface Token Applied  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
Media Type: Wlan  
Manual enabled: true  
Auto enabled: false

10002

2023-06-01T09:13:07

\[+\]WLAN Extensibility Module has stopped.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

4001

2023-06-01T09:13:07

\[+\]WLAN AutoConfig service has successfully stopped.  

12

2023-06-01T09:13:31

\[+\]The operating system started at system time ‎2023‎-‎06‎-‎01T13:13:30.500000000Z.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {2e834e18-28ae-49c1-84c4-ab128873bbc5}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {9ae3946e-d158-4909-8e1e-6f0ebbe61e1f}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {36282427-c8ca-4a6e-b361-507f4387d68e}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {91609fef-1d84-4d7a-a95c-0cdcf5707f49}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {af94bff8-06a4-4d79-9a93-01b29f5092bb}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {68338134-0a59-4c66-9250-fbea9d63e7ab}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {52f4ba49-6a40-4216-8432-456796772c58}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {b4fb998c-2f60-4980-92d6-1922edcb3cc2}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {38dba123-b632-4d7a-8ddb-b706f7dacdb1}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d5555413-b9f5-4d09-82d0-559683db60d6}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {1eaefe6b-21d6-491e-9b1f-107a9970cfa0}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {e6a02b93-d172-4158-a94e-ebbb265892b7}  
  
Type: Ethernet.

1009

2023-06-01T09:14:13

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {d625bd1b-bed9-435f-9b2c-64e0d46e556e}  
  
Type: Ethernet.

4000

2023-06-01T09:14:14

\[+\]WLAN AutoConfig service has successfully started.  

10001

2023-06-01T09:14:14

\[+\]WLAN Extensibility Module has successfully started.  
  
Module Path: C:\\WINDOWS\\system32\\IntelIHVRouter10.dll  

1009

2023-06-01T09:14:14

\[+\]CDE reported an L2 adapter arrival  
  
Interface: {0bb94a3d-e696-4d68-ac13-74423df1d203}  
  
Type: Wlan

var snapshots = \[ \]; var wlanReport = ( function() { var wlanReport = {}, pointRadius = 8, eventOffset = 50, wlanYOffset = 0, ncsiYOffset = 100, ndisYOffset = 200, eventRenderInfo, boundRenderInfo, wlanBounds = \[\], connectivityBounds = \[\], powerBounds = \[\], bindToggleMessageBtns, toggleMessage, timeToXCoord, findNewestEvent, calculateEventCoordinates, findwlanBounds, findConnectivityBounds, findPowerBounds, drawEvents, drawPoint, drawSessionBounds, drawBound, drawAxis, drawEventRegionLabels, drawLegend, drawLegendLabel, drawSessionGraph, eventClickHandler, eventMouseMoveHandler, calculateSessionDuration, getSnapshotAtXY, getSessionAtXY, convertSnapshotTimes, convertFileTimeToUnixTime, fixCommandOutputFormatting, checkForEmptyReport, bindTopBtn; eventRenderInfo = { 'Connect': {'label':'C', 'color':'#9AE4A6'}, 'Disconnect':{'label':'D', 'color':'#F5BE9C'}, 'Sleep': {'label':'S', 'color':'#AF9AE4'}, 'CS-Sleep': {'label':'S', 'color':'#AF9AE4'}, 'Wake': {'label':'W', 'color':'#E49AEF'}, 'CS-Wake': {'label':'W', 'color':'#E49AEF'}, 'Internet': {'label':'I', 'color':'#9CCAF5'}, 'Local': {'label':'L', 'color':'#F1F59C'}, 'None': {'label':'N', 'color':'#F59C9C'}, 'Error': {'label':'X', 'color':'#FF0000'} }; boundRenderInfo = { 'Connected': {'fill':'rgba(0,210,0,0.3)','stroke':'rgba(0,210,0,0.8)', 'lineWidth':'3'}, 'Power': {'fill':'rgba(0,0,0,0.95)', 'stroke':'rgba(20,20,20,1.0)','lineWidth':'1'}, 'ConnectedStandby':{'fill':'rgba(0,135,0,0.3)','stroke':'rgba(0,100,0,0.95)','lineWidth':'1'} }; bindToggleMessageBtns = function() { var divElements, expandBtn, i; divElements = document.getElementsByTagName('div'); for( i = 0; i < divElements.length; i++ ) { if( divElements\[i\].className === 'message' ) { expandBtn = divElements\[i\].firstChild; expandBtn.addEventListener('click', toggleMessage(expandBtn), false); } } }; toggleMessage = function(btn) { return function() { var message = btn.parentNode; if(message.className === "message") { message.className = "message show"; btn.innerHTML = "\[‒\]"; //A digit width hyphen. This way the button doesn't shrink (by much) } else { message.className = "message"; btn.innerHTML = "\[+\]"; } } }; // Calculate the X coordinate for the snapshot based on the time it // occured relative to the 48 hours displayed on the graph. timeToXCoord = function(startTimeStr, snapshotTimeStr, width) { var twoDaysInMS = (1000 \* 60 \* 60 \* 24) \* 2, startTime = parseInt(startTimeStr, 10), snapshotTime = parseInt(snapshotTimeStr, 10), endTime = startTime - twoDaysInMS, xPosRatio = 0; xPosRatio = (snapshotTime - startTime) / (endTime - startTime); return (width - (xPosRatio \* width)); }; calculateEventCoordinates = function(canvas) { var width, height, xOffset = 10, yOffset = 0, xPos = 0, yPos = 0, lastXPos = \[\], minXDiff = 2 \* pointRadius, //The min difference between points to prevent them from overlapping startTime, i; if(snapshots.length === 0) { return; } width = canvas.width; height = canvas.height; lastXPos\[wlanYOffset\] = -1; lastXPos\[ndisYOffset\] = -1; lastXPos\[ncsiYOffset\] = -1; startTime = findNewestEvent(); for(i = 0; i < snapshots.length; i++) { if(snapshots\[i\].type === 'Connect') { yOffset = wlanYOffset; } else if(snapshots\[i\].type === 'Disconnect') { yOffset = wlanYOffset; } else if(snapshots\[i\].type === 'Error') { yOffset = wlanYOffset; } else if(snapshots\[i\].type === 'Wake' || snapshots\[i\].type === 'CS-Wake') { yOffset = ndisYOffset; } else if(snapshots\[i\].type === 'Sleep' || snapshots\[i\].type === 'CS-Sleep') { yOffset = ndisYOffset; } else { yOffset = ncsiYOffset; } xPos = timeToXCoord(startTime, snapshots\[i\].time, width) - xOffset; if(lastXPos\[yOffset\] >= 0 && (lastXPos\[yOffset\]) - xPos < minXDiff) { // Keep track of the offset we are adding to events to make sure that events // remain in chronological order across their different y-axis channels (wlan,ndis,ncsi) xOffset += (minXDiff - (lastXPos\[yOffset\] - xPos)); xPos = lastXPos\[yOffset\] - minXDiff; } yPos = eventOffset + yOffset; snapshots\[i\].x = xPos; snapshots\[i\].y = yPos; lastXPos\[yOffset\] = xPos; // If the xPos is greater than the width of the canvas // stop calculating cordinates since they won't fit anyways. if (xPos > width) { snapshots = snapshots.slice(0, i); //Discard the points that don't fit break; } } }; // Unfortunatly the newest event is not always the first event in the list, // so we have to do a search for the newest event findNewestEvent = function() { var startTime = 0, i; for(i = 0; i < snapshots.length; i++) { startTime = Math.max(startTime, snapshots\[i\].time); } return startTime; }; drawEvents = function(canvas) { var graph, pointLabel, snapshot, style, i; graph = canvas.getContext('2d'); if(snapshots.length === 0){ graph.font = "18px sans-serif"; graph.fillStyle = "#EFEFEF"; graph.textAlign = "center"; graph.fillText("No events from the last 48 hours to display", canvas.width/2, canvas.height/2); return; } graph.strokeStyle = "#111"; graph.lineWidth = 1; for( i = 0; i < snapshots.length; i++) { snapshot = snapshots\[i\]; if(snapshot.error !== "0") { style = eventRenderInfo\["Error"\]; } else { style = eventRenderInfo\[snapshot.type\]; } if( style === undefined) { continue; } graph.fillStyle = style.color; pointLabel = style.label; drawPoint(graph, snapshot.x, snapshot.y, pointLabel); } }; drawPoint = function(graph, x, y, label) { graph.font = "10px sans-serif"; graph.textAlign = "center"; graph.beginPath(); graph.arc( x, y, pointRadius, 0, 2 \* Math.PI, false); graph.fill(); graph.stroke(); graph.fillStyle = "#222"; graph.fillText(label, x, y + (pointRadius/2)); }; findwlanBounds = function() { var connectEvent = null, disconnectEvent = null, isConnected = false, currentEvent, type, boundType, i; // Snapshots only include the state from the last 48 hours. // In order to properly draw session bounds we need to know // the state from when the 48 hours started. i.e. was a session // in progress already when the 48 section began. To fnd this out // look to see if the first wlan event is a disconnect or a connect. for(i = snapshots.length - 1; i >= 0; i-- ) { if( snapshots\[i\].type === 'Disconnect' ) { isConnected = true; break; } else if (snapshots\[i\].type === 'Connect'){ isConnected = false; break; } } // If we start in a connected state draw a bound from the left side // of the graph to the first wlan/ndis event if( isConnected ) { for(i = snapshots.length - 1; i >= 0; i-- ) { type = snapshots\[i\].type; if(type === 'Wake' || type === 'CS-Wake' ) { boundType = type === 'Wake' ? 'Sleep' : 'CS-Sleep'; powerBounds.push({'type':boundType, 'sleepEvent':snapshots\[i\], 'wakeEvent':snapshots\[i\], 'x':0, 'y':snapshots\[i\].y, 'width':snapshots\[i\].x, 'height':200}); break; } else if(type === 'Disconnect') { wlanBounds.push({'connectEvent':snapshots\[i\], 'disconnectEvent':snapshots\[i\], 'x':0, 'y': wlanYOffset + eventOffset, 'width':snapshots\[i\].x, 'height':200}); break; } } } // Loop through all of the events finding pairs of events to draw a box between // indicating the start and stop of a particular wlan state. Current pairs include // // Connect->Disconnect/Error/Sleep/CS-Sleep // Wake->Disconnect/Error/Sleep/CS-Sleep (if previously connected) // for(i = snapshots.length - 1; i >= 0; i-- ) { currentEvent = snapshots\[i\]; type = currentEvent.type; if ( type === 'Internet' || type === 'Local' || type == 'None') { continue; } if( type === 'Connect' ) { if (connectEvent === null) { connectEvent = snapshots\[i\]; } isConnected = true; } else if( type === 'Disconnect' || type === 'Sleep' || type === 'CS-Sleep') { disconnectEvent = snapshots\[i\]; // If we are stopping the session because of the Sleep, consider the // session to still be connected since we will likely do a fast reconnect // on wake meaning we will not see a new connect event if( type !== 'Sleep' && type !== 'CS-Sleep') { isConnected = false; } // If we have a connect event and a disconnect event, have the session bounds be a box connecting them if(connectEvent !== null && disconnectEvent !== null ) { wlanBounds.push({'connectEvent':connectEvent, 'disconnectEvent':disconnectEvent, 'x':connectEvent.x, 'y': wlanYOffset + eventOffset, 'width':disconnectEvent.x - connectEvent.x, 'height':200}); } // If we only have a disconnect event, and it is the first connection event, // Draw a session bounds from the left end of the graph to the disconnect if( connectEvent === null && wlanBounds.length === 0 ) { wlanBounds.push({'connectEvent':null, 'disconnectEvent':disconnectEvent, 'x':0, 'y':wlanYOffset + eventOffset, 'width':disconnectEvent.x, 'height':200}); } connectEvent = null; disconnectEvent = null; } else if( type === 'Wake' || type === 'CS-Wake' ) { if(isConnected && connectEvent === null) { connectEvent = snapshots\[i\]; } } } // If there is a current active session with no disconnect draw its bound // The bound will be from the connect to beyond the end of the graph if( connectEvent !== null && disconnectEvent === null) { wlanBounds.push({'connectEvent':connectEvent, 'disconnectEvent':null, 'x':connectEvent.x, 'y':wlanYOffset + eventOffset, 'width':1000, 'height':200}); } }; findConnectivityBounds = function() { var connectivityStart = null, connectivityEnd = null, isConnectedToNetwork = false, i; for(i = snapshots.length - 1; i >= 0; i-- ) { if (snapshots\[i\].type === 'Connect') { isConnectedToNetwork = true; } else if (snapshots\[i\].type === 'Disconnect' || snapshots\[i\].type === 'Sleep' || snapshots\[i\].type === 'Error') { connectivityEnd = snapshots\[i\]; // Draw the bounds of the last capability from when it // started to when the disconnect event happened if (connectivityStart !== null) { connectivityBounds.push({'startEvent':connectivityStart, 'endEvent':connectivityEnd, 'x':connectivityStart.x, 'y':connectivityStart.y, 'width':connectivityEnd.x - connectivityStart.x, 'height':2\*pointRadius}); } if (snapshots\[i\].type === 'Disconnect') { isConnectedToNetwork = false; } connectivityStart = null; connectivityEnd = null; } else if(snapshots\[i\].type === 'Internet' || snapshots\[i\].type === 'Local' || snapshots\[i\].type === 'None') { // Don't draw bounds between capability events // that are not part of a session if( !isConnectedToNetwork ) { continue; } if( connectivityStart == null ) { connectivityStart = snapshots\[i\]; } else { connectivityEnd = snapshots\[i\]; connectivityBounds.push({'startEvent':connectivityStart, 'endEvent':connectivityEnd, 'x':connectivityStart.x, 'y':connectivityStart.y, 'width':connectivityEnd.x - connectivityStart.x, 'height':2\*pointRadius}); connectivityStart = connectivityEnd; connectivityEnd = null; } } else if ( snapshots\[i\].type === 'Disconnect' && connectivityStart !== null ) { // Do not draw connectivity bounds that span from one session to another. // On disconnect there is an implicit capability None where the current // capability would end. connectivityBounds.push({'startEvent':connectivityStart, 'endEvent':snapshots\[i\], 'x':connectivityStart.x, 'y':connectivityStart.y, 'width':snapshots\[i\].x - connectivityStart.x, 'height':2\*pointRadius}); connectivityStart = null; connectivityEnd = null; } } // If the last connectivity event started a bounds, creat a region // from it to the edge of the graph if(connectivityStart) { connectivityBounds.push({'startEvent':connectivityStart, 'endEvent':null, 'x':connectivityStart.x, 'y':connectivityStart.y, 'width':1000, 'height':2\*pointRadius}); } }; findPowerBounds = function() { var sleepEvent = null, wakeEvent = null, isConnected = false, boundType = 'Sleep', i; // Find the initial connected state for(i = snapshots.length - 1; i >= 0; i-- ) { if( snapshots\[i\].type === 'Disconnect' ) { isConnected = true; break; } else if (snapshots\[i\].type === 'Connect'){ isConnected = false; break; } } // Generate power bounds for(i = snapshots.length - 1; i >= 0; i--) { if(snapshots\[i\].type === 'CS-Sleep' || snapshots\[i\].type === 'Sleep') { sleepEvent = snapshots\[i\]; } else if( snapshots\[i\].type === 'CS-Wake' || snapshots\[i\].type === 'Wake') { wakeEvent = snapshots\[i\]; // If we have a sleep and a wake, draw a bounds between them if(sleepEvent !== null && wakeEvent !== null) { // If we are connected to a network and the power event is a connected standby // sleep, draw a light green box for the time asleep signifying that the // connection is still active if( isConnected && sleepEvent.type === 'CS-Sleep') { boundType = 'CS-Sleep'; } else { boundType = 'Sleep'; } powerBounds.push({'type':boundType, 'sleepEvent':sleepEvent, 'wakeEvent':wakeEvent, 'x':sleepEvent.x, 'y':wakeEvent.y, 'width':wakeEvent.x - sleepEvent.x, 'height':200}); } sleepEvent = null; wakeEvent = null; } else if( snapshots\[i\].type === 'Connect') { isConnected = true; } else if( snapshots\[i\].type === 'Disconnect') { isConnected = false; } } }; drawSessionBounds = function(canvas) { var graph, session, i; graph = canvas.getContext('2d'); if(wlanBounds) { for(i = wlanBounds.length - 1; i >= 0; i--) { session = wlanBounds\[i\]; drawBound(graph, 'Connect', session.x, session.width); } } if(powerBounds) { for(i = powerBounds.length - 1; i >= 0; i--) { session = powerBounds\[i\]; drawBound(graph, session.type, session.x, session.width); } } // Draw Internet/Limited connectivity bounds graph.fillStyle = "rgba(235,235,0,0.4)"; graph.strokeStyle = "rgba(30,30,30,0.8)"; graph.lineWidth = 1; if(connectivityBounds) { for(i = 0; i < connectivityBounds.length; i++) { session = connectivityBounds\[i\]; if(session.startEvent.type === 'Local') { graph.fillStyle = "rgba(235,235,0,0.4)"; } else if(session.startEvent.type === 'None') { graph.fillStyle = "rgba(235,0,0,0.4)"; } else { // Don't draw bounds when the capability is internet continue; //graph.fillStyle = "rgba(156,202,245,0.6)"; } graph.fillRect( session.x, session.y - pointRadius, session.width, session.height); } } }; drawBound = function(graph, type, x, width) { var style, y = 50, height = 200; if(type === 'Connect' || type === 'Disconnect') { style = boundRenderInfo\['Connected'\]; } else if(type === 'Sleep' || type === 'Wake') { style = boundRenderInfo\['Power'\]; } else if(type === 'CS-Sleep' || type === 'CS-Wake' ) { style = boundRenderInfo\['ConnectedStandby'\]; } else { style = boundRenderInfo\['Connected'\]; } graph.fillStyle = style\['fill'\]; graph.strokeStyle = style\['stroke'\]; graph.lineWidth = style\['lineWidth'\]; graph.fillRect(x, y, width, height); graph.strokeRect(x, y, width, height); } drawAxis = function(canvas) { var graph, width, height, xPadding, yPadding, step, twoDaysInHours = 48, i; width = canvas.width; height = canvas.height; xPadding = 10; yPadding = 15; graph = canvas.getContext('2d'); // Separate WLAN/NCSI/NDIS events // into their own 'lanes' graph.fillStyle = "#141414"; graph.fillRect(0, 0, width, 100); //WLAN lane graph.fillRect(0, 200, width, 100); //NDIS lane //Draw a line for each of the 48 hours in 2 days graph.strokeStyle = "#333"; graph.lineWidth = 1; graph.font = "12px sans-serif"; graph.fillStyle = "#555"; graph.textAlign = "center"; step = width/twoDaysInHours; for( i = 0; i < twoDaysInHours; i++) { graph.beginPath(); graph.moveTo((step \* i), 0); graph.lineTo((step \* i), height - yPadding); graph.stroke(); } // Label X axis graph.fillText('Oldest', 30, height - 5); graph.fillText('Newest', width - 30, height - 5); }; drawEventRegionLabels = function(canvas) { var graph = canvas.getContext('2d'); // Label event regions graph.font = "12px sans-serif"; graph.textAlign = "center"; graph.strokeStyle = "#333"; graph.lineWidth = 1; graph.fillStyle = "#050505"; //WLAN graph.fillRect(0, 0, 40, 20); graph.strokeRect(0,0,40,20); //NCSI graph.fillRect(0, 101, 40, 20); graph.strokeRect(0,101,40,20); //NDIS graph.fillRect(0, 201, 40, 20); graph.strokeRect(0,201,40,20); graph.fillStyle = "#EEE"; graph.fillText('WLAN', 20, 15); graph.fillText('NCSI', 20, 115); graph.fillText('NDIS', 20, 215); }; drawLegend = function() { var canvas, legend, width, height, x; canvas = document.getElementById('graph-legend'); width = canvas.width; height = canvas.height; symbolX = 20; textX = 40; legend = canvas.getContext('2d'); // Connect legend.fillStyle = eventRenderInfo\['Connect'\].color; drawPoint(legend, symbolX, 10, eventRenderInfo\['Connect'\].label); drawLegendLabel(legend, textX, 13, "- Started a connection"); // Disconnect legend.fillStyle = eventRenderInfo\['Disconnect'\].color; drawPoint(legend, symbolX, 30, eventRenderInfo\['Disconnect'\].label); drawLegendLabel(legend, textX, 33, "- Disconnected from a network"); // Sleep legend.fillStyle = eventRenderInfo\['Sleep'\].color; drawPoint(legend, symbolX, 50, eventRenderInfo\['Sleep'\].label); drawLegendLabel(legend, textX, 53, "- Wireless adapter entered a low power state"); // Wake legend.fillStyle = eventRenderInfo\['Wake'\].color; drawPoint(legend, symbolX, 70, eventRenderInfo\['Wake'\].label); drawLegendLabel(legend, textX, 73, "- Wireless adapter entered a working power state"); // Capability Internet legend.fillStyle = eventRenderInfo\['Internet'\].color; drawPoint(legend, symbolX, 90, eventRenderInfo\['Internet'\].label); drawLegendLabel(legend, textX, 93, "- Network is connected to the internet"); // Capability Local legend.fillStyle = eventRenderInfo\['Local'\].color; drawPoint(legend, symbolX, 110, eventRenderInfo\['Local'\].label); drawLegendLabel(legend, textX, 113, "- Network has limited connectivity"); // Capability None legend.fillStyle = eventRenderInfo\['None'\].color; drawPoint(legend, symbolX, 130, eventRenderInfo\['None'\].label); drawLegendLabel(legend, textX, 133, "- Network has no connectivity"); // Error legend.fillStyle = eventRenderInfo\['Error'\].color; drawPoint(legend, symbolX, 150, eventRenderInfo\['Error'\].label); drawLegendLabel(legend, textX, 153, "- Error"); }; drawLegendLabel = function(legend, x, y, text) { legend.font = "14px sans-serif"; legend.fillStyle = '#DDD'; legend.textAlign = "left"; legend.fillText(text, x, y); }; drawSessionGraph = function() { var canvas, events; canvas = document.getElementById('session-graph'); calculateEventCoordinates(canvas); drawAxis(canvas); findwlanBounds(); findConnectivityBounds(); findPowerBounds(); drawSessionBounds(canvas); drawEvents(canvas); drawEventRegionLabels(canvas); drawLegend(); canvas.addEventListener('click', eventClickHandler, false); canvas.addEventListener('mousemove', eventMouseMoveHandler, false); }; eventClickHandler = function(e) { var canvas = document.getElementById('session-graph'), x, y, snapshot, originalClass; e = e || window.event; if( e.stopPropogation ) { e.stopPropogation(); } else { e.cancelBubble = true; } x = e.offsetX; y = e.offsetY; snapshot = getSnapshotAtXY(x,y); // Emphasize the selected event by placing a border // around it that dissapears after one second if( snapshot !== null) { window.location.hash = snapshot.correspondingEvent; evtElement = document.getElementById(snapshot.correspondingEvent).parentNode.parentNode; originalClass = evtElement.className; evtElement.className = evtElement.className + ' glow'; setTimeout(function(){ evtElement.className = originalClass; }, 1000); } }; eventMouseMoveHandler = function(e) { var summary, x, y, snapshot, session, startEvent = null, endEvent = null, i; e = e || window.event; if( e.stopPropogation ) { e.stopPropogation(); } else { e.cancelBubble = true; } x = e.offsetX; y = e.offsetY; summary = document.getElementById('event-info'); snapshot = getSnapshotAtXY(x,y); summary.innerHTML = "Hover over a session or event to view a summary <br> Click on an event to jump to it in the session list"; // Handle mouseover on snapshot events if(snapshot !== null) { if(snapshot.type === 'Connect') { summary.innerHTML = 'Started a connection to a wireless network <br>' + '<br>' + snapshot.date + '<br>' + 'Connection mode: ' + snapshot.connectionMode + '<br>' + 'Profile: ' + snapshot.profileName + '<br>' + 'SSID: ' + snapshot.ssid; } else if(snapshot.type === 'Disconnect') { summary.innerHTML = snapshot.disconnectReason + '<br>' + '<br>' + snapshot.date + '<br>' + 'Connection mode: ' + snapshot.connectionMode + '<br>' + 'Profile: ' + snapshot.profileName + '<br>' + 'SSID: ' + snapshot.ssid; } else if( snapshot.type === 'Wake' || snapshot.type === 'CS-Wake' || snapshot.type === 'Sleep' || snapshot.type === 'CS-Sleep' ) { summary.innerHTML = snapshot.message + '<br>' + '<br>' + snapshot.date + '<br>'; } else if(snapshot.type === 'Internet' || snapshot.type == 'Local' || snapshot.type == 'None') { summary.innerHTML = snapshot.message + '<br>' + '<br>' + snapshot.date + '<br>'; } else if( snapshot.type === 'Error' ) { var messageCutoffIndex = 0; messageCutoffIndex = snapshot.message.indexOf('br') - 1; summary.innerHTML = snapshot.message.substring(0,messageCutoffIndex) + '<br>' + '<br>' + snapshot.date + '<br>'; } return; } session = getSessionAtXY(x,y); // Handle mouseover on session bounds if( session !== null) { startEvent = session.connectEvent; endEvent = session.disconnectEvent; if(startEvent !== null && endEvent !== null) { summary.innerHTML = 'Session duration: ' + calculateSessionDuration(startEvent.time, endEvent.time) + '<br>' + 'Start time: ' + startEvent.date.toLocaleString() + '<br>' + 'End time: ' + endEvent.date.toLocaleString() + '<br>' + 'Disconnect reason: ' + endEvent.disconnectReason + '<br>'; } else if(startEvent !== null) { summary.innerHTML = 'Session duration: Ongoing' + '<br>' + 'Start time: ' + startEvent.date.toLocaleString() + '<br>'; } else if(endEvent !== null) { summary.innerHTML = 'End time: ' + endEvent.date.toLocaleString() + '<br>' + 'Disconnect reason: ' + endEvent.disconnectReason + '<br>'; } } }; calculateSessionDuration = function(start, end ) { var duration = (end - start) / 1000, hours = parseInt( duration / (60 \* 60), 10), minutes = parseInt((duration / 60) % 60, 10), seconds = Math.round(duration % 60); return (hours + ' hours ' + minutes + ' minutes ' + seconds + ' seconds'); }; getSnapshotAtXY = function(x, y) { var snapshot, i; // Check to see if the mouse pointer correspondes to an event for(i = 0; i < snapshots.length; i++) { snapshot = snapshots\[i\]; if( x >= snapshot.x - pointRadius && x <= snapshot.x + pointRadius ) { if(y >= snapshot.y - pointRadius && y <= snapshot.y + pointRadius) { return snapshot; } } } return null; }; getSessionAtXY = function(x, y) { var session, i; // Check to see if the mouse pointer corresponds to a session for(i = 0; i < wlanBounds.length; i++) { session = wlanBounds\[i\]; if( x >= session.x && x <= session.x + session.width ) { if(y >= session.y && y <= session.y + session.height) { return session; } } } return null; }; convertSnapshotTimes = function() { var i; for(i = 0; i < snapshots.length; i++) { snapshots\[i\].time = convertFileTimeToUnixTime(snapshots\[i\].time); snapshots\[i\].date = new Date(snapshots\[i\].time); } }; convertFileTimeToUnixTime = function(time) { var nanoSecondsPerMS = 10000, yearDifferenceInMS = 11644473600000; //MS between 1601 and 1970 return (time / nanoSecondsPerMS) - yearDifferenceInMS; }; fixCommandOutputFormatting = function() { var commandTextboxes = document.getElementsByTagName("textarea"), textbox, i; for(i in commandTextboxes) { textbox = commandTextboxes\[i\]; if(textbox.className === "command-output") { var output = textbox.innerHTML; output = output.replace(/\\n\\n\\n\\n/g, '\\n'); textbox.innerHTML = output.trim(); } } }; checkForEmptyReport = function() { var sessionList = document.getElementById('session-list'), eventsSummary; if(sessionList.innerHTML == '') { sessionList.innerHTML = "<h4>No WLAN events were found on this system.</h4>"; sessionList.style.margin = "0 0 100px 0"; eventsSummary = document.getElementById('events-summary'); eventsSummary.parentNode.removeChild(eventsSummary); } }; bindTopBtn = function() { var btn = document.getElementById('top-btn'), reportWrapper = document.getElementById('report-wrapper'); btn.style.left = (reportWrapper.offsetLeft - btn.clientWidth - 20) + 'px'; btn.style.top = '30px'; btn.addEventListener('click', function() { window.scrollTo(0,0); window.history.replaceState({}, '', window.location.href.split('#')\[0\]); }, false); }; wlanReport.initialize = function() { bindTopBtn(); bindToggleMessageBtns(); convertSnapshotTimes(); drawSessionGraph(); fixCommandOutputFormatting(); checkForEmptyReport(); }; return wlanReport; }()); window.addEventListener('load', wlanReport.initialize, false);