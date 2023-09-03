---
Date: 2023-08-29
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Azure Container Apps

> [!SOURCE] Sources
> - *[Azure Container Apps documentation | Microsoft Learn](https://learn.microsoft.com/en-us/azure/container-apps/)*

## Contents

- [Overview](#overview)
- [Features](#features)
- [Introductory Video](#introductory-video)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

Azure Container Apps is a fully managed environment that enables you to run [[microservices]] and containerized applications on a [[serverless platform]].

Common uses of Azure Container Apps include:

- Deploying [[API]] endpoints
- Hosting background processing jobs
- Handling [[event-driven processing]]
- Running [[microservices]]

Applications built on Azure Container Apps can [[dynamically scale]] based on the following characteristics:

- [[HTTP]] traffic
- [[Event-driven Processing]]
- [[CPU]] or memory load
- Any [KEDA-supported scaler](https://keda.sh/docs/scalers/)

![Example scenarios for Azure Container Apps.](https://learn.microsoft.com/en-us/azure/container-apps/media/overview/azure-container-apps-example-scenarios.png)

Azure Container Apps enables executing application code packaged in any container and is unopinionated about runtime or programming model. With Container Apps, you enjoy the benefits of running containers while leaving behind the concerns of managing cloud infrastructure and complex container orchestrators.


## Features

With Azure Container Apps, you can:

- [**Use the Azure CLI extension, Azure portal or ARM templates**](https://learn.microsoft.com/en-us/azure/container-apps/get-started) to manage your applications.

- [**Enable HTTPS or TCP ingress**](https://learn.microsoft.com/en-us/azure/container-apps/ingress) without having to manage other Azure infrastructure.

- [**Build microservices with Dapr**](https://learn.microsoft.com/en-us/azure/container-apps/microservices) and [access its rich set of APIs](https://learn.microsoft.com/en-us/azure/container-apps/dapr-overview).

- [**Run jobs**](https://learn.microsoft.com/en-us/azure/container-apps/jobs) on-demand, on a schedule, or based on events.

- Add [**Azure Functions**](https://aka.ms/functionsonaca) and [**Azure Spring Apps**](https://aka.ms/asaonaca) to your Azure Container Apps environment.

- [**Use specialized hardware**](https://learn.microsoft.com/en-us/azure/container-apps/plans) for access to increased compute resources.

- [**Run multiple container revisions**](https://learn.microsoft.com/en-us/azure/container-apps/application-lifecycle-management) and manage the container app's application lifecycle.

- [**Autoscale**](https://learn.microsoft.com/en-us/azure/container-apps/scale-app) your apps based on any KEDA-supported scale trigger. Most applications can scale to zero. [^1]

- [**Split traffic**](https://learn.microsoft.com/en-us/azure/container-apps/revisions) across multiple versions of an application for Blue/Green deployments and A/B testing scenarios.

- [**Use internal ingress and service discovery**](https://learn.microsoft.com/en-us/azure/container-apps/connect-apps) for secure internal-only endpoints with built-in DNS-based service discovery.

- [**Run containers from any registry**](https://learn.microsoft.com/en-us/azure/container-apps/containers), public or private, including Docker Hub and Azure Container Registry (ACR).

- [**Provide an existing virtual network**](https://learn.microsoft.com/en-us/azure/container-apps/vnet-custom) when creating an environment for your container apps.

- [**Securely manage secrets**](https://learn.microsoft.com/en-us/azure/container-apps/manage-secrets) directly in your application.

- [**Monitor logs**](https://learn.microsoft.com/en-us/azure/container-apps/log-monitoring) using Azure Log Analytics.

- [**Generous quotas**](https://learn.microsoft.com/en-us/azure/container-apps/quotas) which can be overridden to increase limits on a per-account basis.

[^1]: Applications that [scale on CPU or memory load](https://learn.microsoft.com/en-us/azure/container-apps/scale-app) can't scale to zero.

## Introductory Video


<iframe title="How to Build and Deliver Apps Fast and Scalable with Azure Container Apps" src="https://www.youtube.com/embed/b3dopSTnSRg?feature=oembed" height="113" width="200" allowfullscreen="" allow="fullscreen" style="aspect-ratio: 1.76991 / 1; width: 100%; height: 100%;"></iframe>

***

## Appendix: Links and References

*Note created on [[2023-08-29]] and last modified on [[2023-08-29]].*

### Internal Linked Notes

- [[Microsoft Azure]]
- [[Azure Container Registry]]
- [[Azure Container Services]]
- [[Azure Container App Environment]]
- [[Application Licecycle Management]]
- [[Microservices Architecture]]
- [[Azure Portal]]
- [[Azure CLI]]
- [[Distributed Application Runtime]]
- [[Ingress]]
- [[Azure Virtual Network]]

### External References

#### Backlinks

```dataview
list from [[Azure Container Apps]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Cloud Compute/Microsoft Azure/Azure Container Apps"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023
