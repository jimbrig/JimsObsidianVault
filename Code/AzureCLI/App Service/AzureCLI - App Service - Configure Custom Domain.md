```bash
#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Configure a custom domain for an Azure App Service
# ------------------------------------------------------------------------------

# Variables
read -p "Enter the Azure Region/Location: " location
read -p "Enter the Name of the Resource Group: " resourceGroup
read -p "Enter the Name of the App Service Plan: " appServicePlanName
read -p "Enter the Name of the Web App: " webAppName
read -p "Enter the Custom Domain: " customDomainName

scriptName=$(basename "$0")

# Create a Resource Group
echo "Creating Resource Group $resourceGroup in "$location"..."

az group create \
    --name $resourceGroup \
    --location $location \
    --tags "CreatedByScript=$scriptName"

# Create an App Service Plan
echo "Creating App Service Plan $appServicePlanName in "$resourceGroup"..."
az appservice plan create \
    --name $appServicePlanName \
    --resource-group $resourceGroup \
    --sku B1 \
    --tags "CreatedByScript=$scriptName"

# Create a Web App
echo "Creating Web App $webAppName under the App Service Plan: "$appServicePlanName"..."
az webapp create \
    --name $webAppName \
    --resource-group $resourceGroup \
    --plan $appServicePlanName \
    --tags "CreatedByScript=$scriptName"

# Copy the result of the following command into a browser to see the static HTML site.
site="http://$webapp.azurewebsites.net"
echo $site
curl "$site"

# Configure CNAME Record for the Custom Domain
echo "Configuring CNAME Record for mapping the Custom Domain $customDomainName to $webAppName.azurewebsites.net..."
echo "Before continuing, go to your DNS Configuration interface for $customDomainName and follow the instructions on https://aka.ms/appservicecustomdns to configure a CNAME record for the hostname "www" and point it to $webAppName.azurewebsites.net"
read -p "Press [Enter] key when ready ..."

az webapp config hostname add \
    --webapp-name $webAppName \
    --resource-group $resourceGroup \
    --hostname $customDomainName

# Verify the Custom Domain
echo "Verifying the Custom Domain $customDomainName..."
az webapp config hostname list \
    --webapp-name $webAppName \
    --resource-group $resourceGroup \
    --query "[?hostname=='$customDomainName']"

# Configure SSL Binding for the Custom Domain
echo "Configuring SSL Binding for the Custom Domain $customDomainName..."
read -p "Enter the full path to the .pfx file containing SSL certificate: " pfxPath
read -p "Enter the password for the .pfx file: " pfxPassword

thumbprint=$(az webapp config ssl upload \
    --certificate-file $pfxPath \
    --certificate-password $pfxPassword \
    --name $webAppName \
    --resource-group $resourceGroup \
    --query thumbprint \
    --output tsv)

# Bind SSL Certificate to the Custom Domain
az webapp config ssl bind \
    --certificate-thumbprint $thumbprint \
    --ssl-type SNI \
    --name $webAppName \
    --resource-group $resourceGroup \
    --hostname $customDomainName

# Complete
echo "Custom Domain $customDomainName is now configured for the Web App $webAppName"
echo "Browse to https://$customDomainName to see the site!"

# Cleanup Resources
# echo "Deleting all resources"
# az group delete --name $resourceGroup -y
```