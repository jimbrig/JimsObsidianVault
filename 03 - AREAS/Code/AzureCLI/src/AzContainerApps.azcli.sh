#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# AzContainerApps.azcli.sh

# VARIABLES
AZ_REGION="eastus"
AZ_RESOURCE_GROUP="RG_JIMBRIG"
AZ_CONTAINERAPPS_ENV="containerapps-env"
AZ_CONTAINERAPP_NAME="containerapp"


az login
az account set --subscription "Azure subscription name"

# Create a resource group
az group create --name "rg-azcontainerapps" --location "westeurope"


az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

az group create \
    --name $AZ_RESOURCE_GROUP \
    --location $AZ_REGION

az containerapp env create \
  --name $AZ_CONTAINERAPPS_ENV \
  --resource-group $AZ_RESOURCE_GROUP \
  --location $AZ_REGION

az containerapp create \
  --name $AZ_CONTAINERAPP_NAME \
  --resource-group $AZ_RESOURCE_GROUP \
  --environment $AZ_CONTAINERAPPS_ENV \
  --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest \
  --target-port 80 \
  --ingress 'external' \
  --query properties.configuration.ingress.fqdn


az group delete --name $RESOURCE_GROUP
