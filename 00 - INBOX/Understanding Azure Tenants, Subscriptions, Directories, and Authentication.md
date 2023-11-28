---
Date: 2023-11-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Understanding Azure Tenants, Subscriptions, Directories, and Authentication

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

## Associate Azure Subscription with Microsoft Entra Tenant

All Azure subscriptions have a trust relationship with a Microsoft Entra tenant. Subscriptions rely on this tenant (directory) to authenticate and authorize security principals and devices. When a subscription expires, the trusted instance remains, but the security principals lose access to Azure resources. Subscriptions can only trust a single directory while one Microsoft Entra tenant may be trusted by multiple subscriptions.

When a user signs up for a Microsoft cloud service, a new Microsoft Entra tenant is created and the user is made a Global Administrator. However, when an owner of a subscription joins their subscription to an existing tenant, the owner isn't assigned to the Global Administrator role.

While users may only have a single authentication _home_ directory, users may participate as guests in multiple directories. You can see both the home and guest directories for each user in Microsoft Entra ID.

![](https://i.imgur.com/WH6GYlk.png)

> [!IMPORTANT] Important
> When a subscription is associated with a different directory, users who have roles assigned using [Azure role-based access control](https://learn.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal) lose their access. Classic subscription administrators, including Service Administrator and Co-Administrators, also lose access.
>
> Moving your Azure Kubernetes Service (AKS) cluster to a different subscription, or moving the cluster-owning subscription to a new tenant, causes the cluster to lose functionality due to lost role assignments and service principal's rights. For more information about AKS, see [Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/).

***

## Appendix: Links and References

*Note created on [[2023-11-27]] and last modified on [[2023-11-27]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Understanding Azure Tenants, Subscriptions, Directories, and Authentication]] AND -"CHANGELOG" AND -"00 - INBOX/Understanding Azure Tenants, Subscriptions, Directories, and Authentication"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

