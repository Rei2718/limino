variable "appServicePrincipalId" {}

resource "azurerm_role_assignment" "acrPullPermission" {
  scope                = azurerm_container_registry.acrRegistry.id
  role_definition_name = "AcrPull"
  principal_id         = var.appServicePrincipalId
}