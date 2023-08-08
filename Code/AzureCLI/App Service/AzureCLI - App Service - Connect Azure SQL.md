```bash
#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Configure WebApp Service to Connect to an Azure SQL Database
# ------------------------------------------------------------------------------

# Variables
read -p "Enter the Azure Region/Location: " location
read -p "Enter the Name of the Resource Group: " resourceGroup
read -p "Enter the Name of the App Service Plan: " appServicePlanName
read -p "Enter the Name of the Web App: " webAppName
read -p "Enter the SQL Server: " sqlServerName
read -p "Enter the SQL Database: " sqlDatabaseName
read -p "Enter the SQL User: " sqlUserName
read -p "Enter the SQL Password: " sqlPassword

startIp="0.0.0.0"
endIp="0.0.0.0"

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

# Create a SQL Database Server
echo "Creating $server"
az sql server create \
    --name $sqlServerName \
    --resource-group $resourceGroup \
    --location "$location" \
    --admin-user $sqlUserName \
    --admin-password $sqlPassword

# Configure a firewall rule for the server
echo "Configuring a firewall rule for the server"
az sql server firewall-rule create \
    --resource-group $resourceGroup \
    --server $sqlServerName \
    -n AllowYourIp \
    --start-ip-address $startIp \
    --end-ip-address $endIp

# Create a SQL Database
echo "Creating $databaseName"
az sql db create \
    --resource-group $resourceGroup \
    --server $sqlServerName \
    --name $sqlDatabaseName \
    --service-objective S0

# Configure the Web App to connect to the SQL Database
connstring=$(az sql db show-connection-string \
    --client sqlcmd \
    --name $sqlDatabaseName \
    --server $sqlServerName \
    --output tsv)

connstring=${connstring//<username>//$sqlUserName}
connstring=${connstring//<password>//$sqlPassword}

az webapp config connection-string set \
    --resource-group $resourceGroup \
    --name $webAppName \
    --settings SQLSRV_CONNSTR="$connstring" \
    --connection-string-type=SQLAzure

# Cleanup Resources
# echo "Deleting all resources"
# az group delete --name $resourceGroup -y
```