- `main.tf`:

```hcl
data "azurerm_resource_group" "rg" {
  name = "RG_TERRAFORM"
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_container_registry_webhook" "acr_webhook" {
  name                = "webhookdockerhub"
  resource_group_name = data.azurerm_resource_group.rg.name
  registry_name       = azurerm_container_registry.acr.name
  location            = data.azurerm_resource_group.rg.location
  service_uri         = "https://registry.hub.docker.com"
  actions = [
    "push",
    "delete"
  ]
  scope = "hello-world:latest"
}
```

- `variables.tf`

```hcl
variable "acr_name" {
  type        = string
  description = "The name of the Azure Container Registry"
}
```

- `outputs.tf`:

```hcl
output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}
```