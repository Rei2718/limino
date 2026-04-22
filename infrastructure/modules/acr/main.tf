resource "azurerm_container_registry" "acrRegistry" {
  name                = "${var.project}registry${var.environment}"
  resource_group_name = var.resourceGroupName
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
}