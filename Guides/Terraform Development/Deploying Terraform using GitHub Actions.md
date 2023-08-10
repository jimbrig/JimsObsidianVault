---
Date: 2023-08-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Deploying Terraform using GitHub Actions

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *To deploy any resources to an [[Azure]] cloud infrastructure environment using [[Terraform]] using [[GitHub Actions]], follow the steps outlined below.*

### Setup Backend Storage and Service Principal

Before we can start to run any Actions, we need two supporting items in place:

1. Backend Storage for Terraform to store the state file
2. A Service Principal for Terraform to use to authenticate to our Azure Tenant/Subscriptions

> [!help] Help
> See the [Appendix]() for details on the backend remote-state storage and service principal setups.



```bash
#!/usr/bin/env bash

# ---------------------------------------------------------------------
# This Azure CLI script helps prepare everything you need to run 
# Terraform in GitHub Actions. 
# 
# It Sets up:
# 	- Storage Account and Container to store Terraform State remotely.
# 	- Creates a Service Principal and assigns contributor at tenant root. 
# 		- Note: You may wish to reduce this scope for your deployment down to single Subscription
# ---------------------------------------------------------------------

set -euo pipefail

# Login/Authenticate to Azure
az login

# Variable Declarations
AZ_REGION="eastus"
AZ_RG="RG_TERRAFORM"
AZ_SA="saterraformstate"
AZ_SC="tfstate"
AZ_SP="sp-terraform"
AZ_SUB_ID=$(az account show --query id -o tsv)

AZ_ENVTAG="Environment=Terraform"
AZ_DATETAG="Build-Date=$(date +%Y-%m-%d)"

# Create Resource Group, Storage Account, and Storage Container
az account set -s $AZ_SUB_ID

az group create --location $AZ_REGION \
	--name $AZ_RG \
	--tags $AZ_ENVTAG $AZ_DATETAG

az storage account create --location $AZ_REGION \
	--resource-group $AZ_RG \
	--name $AZ_SA \
	--tags $AZ_ENVTAG $AZ_DATETAG \
	--https-only \
	--sku Standard_LRS \
	--encryption-services blob \
	--subscription $AZ_SUB_ID

# Get Storage Account Access Key
AZ_SA_KEY=$(az storage account keys list --resource-group $AZ_RG --account-name $AZ_SA --query '[0].value' -o tsv)

# Create Container
az storage container create --name $AZ_SC \
	--account-name $AZ_SA \
	--account-key $AZ_SA_KEY

# Creates Service Principal
$AZ_SP_ID = $(az ad sp create-for-rbac -n $AZ_SP --role Contributor --scopes "/" | jq)


Write-Output "
Below are the details of the storage account that will need to be in the Terraform Backend Configuration:
Resource Group: $rgname
Storage Account: $strname
Container Name: $containername

Below are the details of the Service Principal that will need to be in the GitHub Repo Secrets:
ARM_CLIENT_ID: "$spid.appid"
ARM_CLIENT_SECRET: "$spid.password"
ARM_TENANT_ID: "$spid.tenant"
ARM_SUBSCRIPTION_ID: $mansub"
```

***

## Appendix: Links and References

*Note created on [[2023-08-09]] and last modified on [[2023-08-09]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Deploying Terraform using GitHub Actions]] AND -"CHANGELOG" AND -"Guides/Terraform Development/Deploying Terraform using GitHub Actions"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

