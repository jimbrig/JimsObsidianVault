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
# ---------------------------------------------------------------------
# This Azure CLI script helps prepare everything you need to run 
# Terraform in GitHub Actions. 
# 
# It Sets up:
# 	- Storage Account and Container to store Terraform State remotely.
# 	- Creates a Service Principal and assigns contributor at tenant root. 
# 		- Note: You may wish to reduce this scope for your deployment down to single Subscription
# ---------------------------------------------------------------------

# Login/Authenticate to Azure
az login

# Variable Declarations
$location = "uksouth"                                           # This sets the Resource Group and Storage Account location.
$rgname = "rgname"                                              # This sets the Resource Group name the Storage Account will be deployed into.
$strname = "storageaccoutname"                                  # This sets the Storage Account name - note this must be unique!
$containername = "tfstate"                                      # This sets the Container name.
$envtag = "Environment=TFStorage"                               # This sets the Environment Tag applied to the Resource Group and Storage Account.
$datetag = "Build-Date=27072024"                                # This sets the Build Date Tag applied to the Resource Group and Storage Account. 
$spname = "tfdeploy"                                            # This sets the Service Principal Name
# Below Subscription should be the Management Subscription
$mansub = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"                # This is the ID of the Subscription to deploy the Resource Group and Storage Account into. 

########################################

# Creates Resource Group and Storage Account for TF State File Storage
az account set -s $mansub
az group create --location $location --name $rgname --tags $envtag $datetag
az storage account create --location $location --resource-group $rgname --name $strname --tags $envtag $datetag --https-only --sku Standard_LRS --encryption-services blob --subscription $mansub
$storageacckey=$(az storage account keys list --resource-group $rgname --account-name $strname --query '[0].value' -o tsv)
az storage container create --name $containername --account-name $strname --account-key $storageacckey

# Creates Service Principal for TF to use and gives access at root. 
$spid = az ad sp create-for-rbac -n $spname --role Contributor --scopes "/" | convertfrom-json

########################################
# Information to setup GitHub Secrets and Terraform backend configuration is output by the script below. 
########################################
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

