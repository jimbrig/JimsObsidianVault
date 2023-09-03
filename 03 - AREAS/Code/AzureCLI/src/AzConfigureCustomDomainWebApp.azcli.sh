#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# AzConfigureCustomDomainWebApp.azcli.sh

# VARIABLES
AZ_REGION="eastus"
AZ_RESOURCE_GROUP="RG_JIMBRIG"
AZ_TAG="Script:AzConfigureCustomDomainWebApp"
AZ_ASP="jimbrig-app-service-plan"
AZ_WEBAPP="jimbrig-webapp"

# create resource group
echo "Creating resource group $AZ_RESOURCE_GROUP in $AZ_REGION..."
az group create \
    --name $AZ_RESOURCE_GROUP \
    --location $AZ_REGION \
    --tag $AZ_TAG

# create app service plan (SHARED tier):
echo "Creating app service plan $AZ_ASP in $AZ_REGION..."
az appservice plan create \
    --name $AZ_ASP \
    --resource-group $AZ_RESOURCE_GROUP \
    --location $AZ_REGION \
    --sku SHARED \
    --tag $AZ_TAG

# create web app
echo "Creating web app $AZ_WEBAPP in $AZ_REGION..."
az webapp create \
    --name $AZ_WEBAPP \
    --resource-group $AZ_RESOURCE_GROUP \
    --plan $AZ_ASP \
    --tag $AZ_TAG

# configure custom domain
echo "Configuring custom domain for web app $AZ_WEBAPP..."


