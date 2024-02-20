---
Date: 2023-11-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Note"
  - "#Topic/Unknown"
Alias: []
---

# Microsoft Licensing

> [!SOURCE] Sources
> - *[Understanding Microsoft Licensing: What You Need to Know (licenseware.io)](https://licenseware.io/understanding-microsoft-licensing-what-you-need-to-know/)*
> - *[Understand subscriptions and licenses in Microsoft 365 for business | Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/commerce/licenses/subscriptions-and-licenses?view=o365-worldwide)*
> - *[Microsoft Licensing crash course (samexpert.com)](https://samexpert.com/microsoft-licensing/)*

## Contents

- [Overview](#overview)
- [The Basics of Microsoft Licensing](#the-basics-of-microsoft-licensing)
- [What Requires a Microsoft License?](#what-requires-a-microsoft-license)
	- [Types of Microsoft Licenses](#types-of-microsoft-licenses)
	- [The Role of Software Assurance](#the-role-of-software-assurance)
	- [Understanding Volume Licensing](#understanding-volume-licensing)
- [Microsoft Licensing for Businesses](#microsoft-licensing-for-businesses)
	- [Open License Program](#open-license-program)
	- [Select Plus Program](#select-plus-program)
	- [Enterprise Agreement Program](#enterprise-agreement-program)
	- [Microsoft Online Subscription Program (MOSP)](#microsoft-online-subscription-program-mosp)
- [Microsoft Licensing for Individuals and Small Businesses](#microsoft-licensing-for-individuals-and-small-businesses)
	- [Retail Licensing](#retail-licensing)
	- [Original Equipment Manufacturer (OEM) Licensing](#original-equipment-manufacturer-oem-licensing)
	- [Home and Student Licensing](#home-and-student-licensing)
- [Licensing for Specific Microsoft Products](#licensing-for-specific-microsoft-products)
	- [Windows Operating System Licensing](#windows-operating-system-licensing)
	- [Microsoft Office Licensing](#microsoft-office-licensing)
	- [Microsoft Server Licensing](#microsoft-server-licensing)
	- [Microsoft Cloud Services Licensing](#microsoft-cloud-services-licensing)
- [Conclusion](#conclusion)
- [Appendix: Software Licensing Notes](#appendix-software-licensing-notes)
	- [Same Software May Have Different Licensing Rules](#same-software-may-have-different-licensing-rules)
		- [Rules Depend on Versions and Editions](#rules-depend-on-versions-and-editions)
		- [Rules Depend on How the License was Purchased](#rules-depend-on-how-the-license-was-purchased)
		- [Rules are Different in Physical and Virtual Machines](#rules-are-different-in-physical-and-virtual-machines)
		- [Rules are Different for Remote Connections to Servers](#rules-are-different-for-remote-connections-to-servers)
		- [Other Dependencies](#other-dependencies)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)




## Overview

> [!NOTE] About
> *Microsoft licensing is a critical aspect of using Microsoft software, and it’s essential to understand the different types of licenses and programs available to choose the best option for your needs. Whether you are an individual or a business, Microsoft offers a range of licensing options to suit your requirements, and with the right licensing program, you can get the most out of your software investment.*

In today’s business environment, technology plays a crucial role in helping businesses stay competitive. Microsoft is a giant in the technology world, offering a broad range of software products that businesses use to manage their operations. However, obtaining the right licenses for Microsoft products can be a complex and challenging process. If you are trying to understand Microsoft licensing, then this article is for you. In this article, we will break down the basics of Microsoft licensing, examine the various types of licenses available, and explore licensing for specific Microsoft products.

> [!WARNING] Warning
> It is important to note that when discussing Microsoft Licensing, one must separate the licenses based on the customer:
>  1. Licensing for Individuals and Small Businesses
>  2. Licensing for Businesses and Enterprise
>  3. Licensing for Specific Microsoft Products

## The Basics of Microsoft Licensing

Before diving into the various types of licenses offered by Microsoft, it is essential to understand the basics of Microsoft licensing. Essentially, Microsoft licenses are legal agreements that allow businesses and individuals to use Microsoft software. Microsoft offers different licensing programs for different types of customers, each program having various features and benefits to meet specific needs.

Under a license agreement, individuals and businesses gain access to Microsoft software, updates, and support. Microsoft offers different types of licenses based on the number of licenses required, features needed, and usage terms.

It is important to note that Microsoft licensing can be a complex process, and it’s essential to ensure that you are compliant with the licensing terms and conditions. Microsoft has strict guidelines, and failure to comply can result in penalties and legal action.

## What Requires a Microsoft License?

There are five primary categories of Microsoft Licenses. There (technically) are more, but they are outside to scope of this summary.

1. **Desktop Operating System Licenses**: When you buy a laptop, it will likely come with Windows. That is a "Desktop OS license". These licenses predominantly come pre-installed on end-user hardware. In addition, organizations may buy upgrade licenses for extended functionality.
2. **Desktop Application Licenses**: Unless you are a keen admirer of Open Source, you would probably consider Microsoft Office. These days, there are two flavors of Office and, consequently, two license types:
	1. User Subscription Licenses for Microsoft 365 (Office 365), Project Online, Visio Online
	2. Desktop Application Licences for non-online editions like Office Professional Plus and Office Standard
3. **Server Operating System Licenses**: If you work for an organisation, it probably uses servers to store files, print, run server software, and perform other server functions. Servers running Microsoft software predominantly use Windows Server operating system.
4. **Server Licenses**: It is uncommon to use only Windows Server. Server applications, or "servers", are used in almost every modern-day organization. These may include:
	1. Database - [Microsoft SQL Server](https://samexpert.com/sql-server-cost-optimisation-tips/)
	2. Email - Microsoft Exchange Server
	3. ERP - Dynamics 365 (on-premises), and more
5. **Client Access Licenses (CALs)**: 
	- This is the most confusing category of Microsoft licenses for a non-licensing person. CALs don't include software. Some licensing experts formally call them "softwareless licenses".
	- All Microsoft servers require Client Access Licenses unless there is an explicit exception. You may not use – "access" – server software if you only have licenses for your laptops and servers.
	- There are two types of CALs:
		1. **User CAL** is assigned to a user that becomes a "Licensed User" that may access the server software from any device. That is the dominant model because modern users usually have more than one device.
		2. **Device CAL** is assigned to a client device, and any user may use the "Licensed Device" to access the server software. It is the best CAL for shift workers using one computer.
	- Client Access License Basics:
		- A CAL is only required once per person or device. If you need to access two or more servers of the same type, you only need one CAL.
		- Every server software has its CAL: Windows Server CAL, SQL Server CAL, and others
		- Some servers may have multiple "levels" of CALs depending on the functionality provided to the Licensed User or users of the Licensed Device, for example, Exchange Enterprise and Standard CALs
		- Additional functionality may require extra CALs. For example, Windows Server requires Windows Server CALs, but if you want to provide access to the Windows Server graphical desktop, it will also require [Remote Desktop Services CALs](https://samexpert.com/rds-cal-azure/).

With that, lets discuss the various *types* of Microsoft Licenses.

### Types of Microsoft Licenses

Microsoft offers several licensing options for different categories of users. The types of licenses offered are:

1. Retail license: sold to individuals who require only one or a few licenses for personal use.
2. Original equipment manufacturer (OEM) license: sold to computer manufacturers who pre-install Windows on the machines they manufacture.
3. Volume license: sold to businesses and organizations that require multiple licenses.

Each of these licenses has specific usage rights, terms, and conditions, and it’s essential to understand each and their corresponding features based on your requirements.

### The Role of Software Assurance

Software Assurance is an additional offering from Microsoft which provides a comprehensive range of benefits to ensure that you get the most out of your software. This program offers upgrades and cost-effective upgrades to new software versions, training, and support to help users maximize their software investment. It’s an essential program for businesses that need to stay current with the latest technology updates.

With Software Assurance, businesses can benefit from predictable costs and simplified license management, enabling them to focus on their core business operations. Additionally, businesses can take advantage of home-use programs, which allow employees to use the software at home for work-related purposes.

### Understanding Volume Licensing

Microsoft’s Volume Licensing program is designed for businesses that need multi-license packages. This program allows businesses to purchase a volume of licenses rather than buying individual licenses, resulting in cost savings. The Microsoft Volume Licensing program offers four options:

- Enterprise Agreement
- Enterprise Subscription Agreement
- Open Value
- Open Value Subscription

Each of these options has its own set of features and benefits, and it’s essential to understand them to choose the best option for your business needs. The Volume Licensing program also offers customized pricing and payment options, making it easier for businesses to manage their software expenses.

It’s important to note that businesses that purchase licenses through the Volume Licensing program must comply with the program’s terms and conditions, which include regular reporting and compliance checks.

## Microsoft Licensing for Businesses

Microsoft is a leading provider of software and technology solutions for businesses of all sizes. One of the most important aspects of using Microsoft products is ensuring that your business has the proper licensing in place. Microsoft offers several licensing programs to meet the diverse needs of businesses.

### Open License Program

The Open License Program is a flexible program that enables businesses to purchase licenses based on their needs. It’s perfect for businesses that require five or more licenses and want to manage them under one agreement. With the Open License Program, businesses can save money by purchasing licenses in bulk, and they have the flexibility to add more licenses as needed.

In addition, the Open License Program offers a range of benefits, including volume discounts, online tools for managing licenses, and the ability to transfer licenses between computers. This program is an excellent option for businesses that want to simplify their licensing management and save money on Microsoft products.

### Select Plus Program

The Select Plus Program is a streamlined purchasing program for businesses that require multiple Microsoft products. With this program, businesses can purchase licenses for different Microsoft products, such as Microsoft Office or Windows, under one agreement. The Select Plus program offers more cost savings compared to purchasing individual licenses.

In addition, the Select Plus Program offers businesses the ability to track their purchases and licenses online, making it easy to manage their Microsoft products. This program is an excellent option for businesses that want to simplify their licensing management and save money on Microsoft products.

### Enterprise Agreement Program

The Enterprise Agreement program is available to large organizations with over 250 PCs, which require custom-built solutions. This program is designed to meet the licensing needs of organizations with multiple products or programs that share common functionality requirements.

The Enterprise Agreement program offers a range of benefits, including volume discounts, online tools for managing licenses, and the ability to transfer licenses between computers. This program is an excellent option for large organizations that want to simplify their licensing management and save money on Microsoft products.

### Microsoft Online Subscription Program (MOSP)

The Microsoft Online Subscription Program is a cloud-based licensing program that enables businesses to purchase monthly or annual subscriptions for various Microsoft cloud-based products, such as Office 365 or Azure. This program is perfect for organizations that want to eliminate upfront licensing costs and upfront hardware costs.

In addition, the Microsoft Online Subscription Program offers businesses the ability to scale their licenses up or down as needed, making it easy to adjust to changing business needs. This program is an excellent option for businesses that want to simplify their licensing management and save money on Microsoft products.

In conclusion, Microsoft offers a range of licensing programs to meet the diverse needs of businesses. Whether you are a small business or a large organization, there is a Microsoft licensing program that can help you save money and simplify your licensing management. Consider your business needs and choose the program that is right for you.

## Microsoft Licensing for Individuals and Small Businesses

Microsoft offers a variety of licensing options to meet the needs of individuals and small businesses. Each licensing option provides a different set of features and benefits, so it is important to choose the one that best suits your needs.

### Retail Licensing

Retail licensing is designed for individuals and small businesses that require only a few licenses for personal or business use. This license is available for a one-time purchase and does not require any ongoing fees. With retail licensing, you have the flexibility to install the software on multiple devices, as long as it is only used by one user at a time. This makes it a great option for individuals and small businesses that need to use the software on multiple devices.

Additionally, with retail licensing, you have the option to purchase extended support, which includes access to technical support and security updates. This can be especially beneficial for small businesses that may not have an IT department to handle these tasks.

### Original Equipment Manufacturer (OEM) Licensing

OEM licenses are designed for Original Equipment Manufacturers, such as computer manufacturers who pre-install Windows on computers they sell. OEM licenses are available at a discounted price and cannot be transferred from one computer to another. This means that if you purchase a new computer, you will need to purchase a new OEM license for that device.

One benefit of OEM licensing is that it is often less expensive than other licensing options. This can be a great option for individuals and small businesses that need to purchase multiple licenses for their devices.

### Home and Student Licensing

Microsoft offers licensing for home and student use at an affordable price. This type of license provides access to Microsoft Office applications, such as Word, Excel, and PowerPoint, without needing to purchase a more comprehensive license. With home and student licensing, you can install the software on up to six devices, making it a great option for families or students who need to use the software on multiple devices.

In addition to the Office applications, home and student licensing also includes access to OneNote, which is a note-taking application that can be used for personal or educational purposes.

Overall, Microsoft offers a variety of licensing options to meet the needs of individuals and small businesses. Whether you need a few licenses for personal use or multiple licenses for your small business, there is a licensing option that can meet your needs and budget.

## Licensing for Specific Microsoft Products

### Windows Operating System Licensing

The Windows Operating System license is required to use Windows on any device. Microsoft offers several licensing options for Windows based on the needs of various users. Windows licenses come in several editions, such as Windows 10 Pro and Windows 10 Enterprise.

### Microsoft Office Licensing

Microsoft Office is a critical software tool for businesses of all sizes. Microsoft offers different licensing options for Microsoft Office based on user needs. The standard Microsoft Office suite consists of Word, Excel, PowerPoint, Outlook, and OneNote.

### Microsoft Server Licensing

Microsoft Server is a powerful tool for businesses that need to manage their IT infrastructure. Server licenses are available in several editions, such as Windows Server Essentials and Windows Server Datacenter.

### Microsoft Cloud Services Licensing

Microsoft Cloud Services licensing provides businesses with access to Microsoft cloud-based services, such as SharePoint and Dynamics 365. This type of licensing is perfect for businesses that need to manage their data and backend infrastructure in the cloud.

## Lifetime of a Microsoft License

### Perpetual Licenses

Perpetual licences are evergreen. You purchase it once, and unless it's explicitly terminated or you sell it on the second-hand market – it's legal in Europe – the license stays with you forever.

When software reaches "end-of-life", it only means that Microsoft stopped supporting it and releasing security updates. **Your perpetual licences are still valid.** If anyone tells you otherwise, they may be up to something.

Regrettably, fewer and fever purely perpetual options are available, and they are limited in how you can use them in a modern office.

### Perpetual licenses with Software Assurance

If you have a [Microsoft Enterprise Agreement](https://samexpert.com/what-is-a-microsoft-enterprise-agreement/), most of the licences will be "perpetual with SA".

- The perpetual part doesn't expire.
    
- [Software Assurance](https://samexpert.com/what-is-software-assurance-mistakes-to-avoid/) is a subscription, so it will expire unless you renew it.

### Subscription licences

Subscription licences are yours for as long as you keep paying. They are not different in that regard from a Netflix subscription.

Subscription licenses include Software Assurance or SA-equivalent rights that expire with them.

You must pay for the next subscription period ("term") or remove the software when a subscription license expires.

## Conclusion

Understanding Microsoft licensing is essential for businesses and individuals to use Microsoft products legally and efficiently. Microsoft offers several licensing options based on different user requirements. It’s essential to explore the options available and select the one that meets your specific needs. By doing so, you’ll enjoy the benefits of Microsoft products while staying compliant with licensing agreements.

***

## Appendix: Software Licensing Notes

### Same Software May Have Different Licensing Rules

#### Rules Depend on Versions and Editions

Among many other factors, terms and conditions for the same software depend on the licensed _version_ and licensed _edition_.

 - **Version** indicates when the software was released and its generation, for example, 2012, 2016, and XP.
    
- **Editions** are more critical. For example, SQL Server Enterprise provides additional functionality. It also costs _four times more_ than SQL Server Standard.

Never confuse versions and editions. If you do, you may accidentally overpay or become non-compliant.

- **Correct**: — What database edition did you install? — SQL Server Enterprise.
    
- **Incorrect**: — What is the SQL edition on this server? — 2012.

#### Rules Depend on How the License was Purchased

The same software may have different terms and conditions based on how you acquired a license, for example:

- Pre-installed on the laptop,
    
- Purchased in a computer shop,
    
- Via a [Microsoft Enterprise Agreement](https://samexpert.com/what-is-a-microsoft-enterprise-agreement/),
    
- Via a [CSP](https://samexpert.com/what-is-csp-microsoft-cloud-solution-program-explained/),
    
- and more.
    

Always pay attention to how the license was purchased when you try to figure out what you can do with it.

Also, when you switch from one agreement type to another, ask your reseller if you may still use the software the way you do it now. You may want to read a captivating story about how our client decided to [migrate from EA to CSP](https://samexpert.com/switching-from-enterprise-agreement-to-csp/).

#### Rules are Different in Physical and Virtual Machines

The same software moved from a physical to a [virtual machine or container](https://samexpert.com/windows-server-sql-server-licensing-in-containers-2/) may have radically different licensing requirements. It may affect the formula to calculate the number of licences and introduce other requirements like having compulsory [Software Assurance](https://samexpert.com/what-is-software-assurance-mistakes-to-avoid/) (we'll explain it soon).

#### Rules are Different for Remote Connections to Servers

Starting from 2020, many employees will work from home and use their corporate software via remote access tools like VPN, Citrix, and Remote Desktop Client.

Desktop software like Microsoft Office installed on a server to be used remotely has different licensing requirements than a basic installation on a laptop.

#### Other Dependencies

In addition to all the above, you also need to establish:

- Is it running in your office, a third-party data centre, or the cloud?
    
- Will you use it for everyday business needs ("_production_") or to develop and test applications ("_non-production_")?
    
- Who will have access, only your employees and contractors or partners, suppliers and customers ("_external users_")?
    

And even this list is not exhaustive.

Bottom line:

- Licensing depends on usage,
    
- When you change how you use the software, for example, move it from your office ("on-premises") to the cloud, licensing rules and requirements change too,
    
- You should not assume you always have enough licences in a changing IT environment.

## Appendix:: Terms, Definitions, and Principles of Microsoft Licensing

### The license must be assigned before the software is used

_This is the reason why_:

- You must license all authorised users/devices, even if they may never access or run the software,
    
- You must license for the worst case.
    

For example, Microsoft usually insists that you must license every host in a virtualised cluster for the maximum virtual machines that may run on the host, even if it never happens. Why? Because if it happens, you must already have the required quantity of licenses assigned to the host.

### Assigning licences

On-premises licenses may be assigned to the following entities:

|User|Device|Server|
|---|---|---|
|A Licensed User is a person, a "warm body".|- Computer - Phone - "Hardware partition"|A server is a device running server software.|

On-premises licenses may not be assigned to:

|Virtual machine|Connection|
|---|---|
|Always assign the licenses to the host server.<br><br>(see also the next chapter)|There is no such metric.|

### May licenses be assigned to virtual machines?

Licenses may only be assigned to virtual machines in multi-tenant Cloud environments with the following caveats:

- Product Terms must allow it for the specific type of license,
    
- The license must be eligible, [Software Assurance](https://samexpert.com/what-is-software-assurance-mistakes-to-avoid/) may be required,
    
- The provider must be eligible.
    

Examples of such scenarios:

- [BYOL](https://samexpert.com/microsoft-byol-explained/) to a service provider with License Mobility through Software Assurance (may soon be replaced with [Flexible Virtualisation](https://samexpert.com/flexible-virtualization/)),
    
- Deploying to Azure with Azure Hybrid Benefit.
    

There is a misconception prevalent among IT professionals and ITAM managers that SQL Server licences, for example, may be assigned to virtual machines. That is incorrect. Here's the correct explanation:

- If you license SQL Server per virtual core, the _calculation_ is done per the virtual machine's requirements.
    
- However, the required licences must then be _assigned_ to the virtual machine's _host_, not the virtual machine itself.
    
- If a virtual machine is in a cluster and must be "mobile", the corresponding licences require Software Assurance, which allows them to travel _from a host to a host_ following the virtual machine.

### Re-assigning licences, the rule of 90 days

In normal circumstances, licences may be reassigned to a different user or device not more often than once in 90 days. There are exceptions listed in Product Terms including permanent hardware failure or a user leaving the organisation.

The above limitation does not apply, and the licences may be reassigned at any moment if both of the following requirements are true:

- The licence is eligible for License Mobility in Server Farms,
    
- The license is covered with active Software Assurance.
    

### What happens when a license expires?

|When a license expires|When Software Assurance expires|
|---|---|
|You must stop using the software.|You must stop using _additional rights_ granted by Software Assurance.|

When Software Assurance expires, you may have to do the following depending on the license and the rights granted by Software Assurance:

- Break virtual clusters,
    
- Buy additional licenses for SQL Server,
    
- Disable remote access to Office applications,
    
- Downgrade Windows Enterprise to Enterprise LTSC,
    
- and more.
    

### Multiplexing and indirect access

When product access is indirect, it does not reduce the number of required user or device licenses.

Here is what we often hear from sysadmins and IT support:

- "Users connect to a web server, which only has one connection to the database",
    
- "This software uses a concurrent connection pool to the server, and the number of connections never exceeds ten".
    

Unfortunately, pooling connections or using multi-tier architecture does not waver the requirement to license all users and devices connecting to the server. In other words, a license is required for the end-point, either user or device, regardless of the hardware and software layers between the endpoint and the server.

In the picture below, you can see six users connecting to an application server that maintains one connection to the database. SQL Server Client Access License is not required for the application server. It is irrelevant. Instead, you need six SQL CALs per user.

## Appendix: Links and References

*Note created on [[2023-11-27]] and last modified on [[2023-11-27]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Microsoft Licensing]] AND -"CHANGELOG" AND -"00 - INBOX/Microsoft Licensing"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

