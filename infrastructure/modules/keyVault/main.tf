resource "azurerm_key_vault" "keyVaultMain" {
  name                = "${var.project}-key-vault-${var.environment}"
  resource_group_name = var.resourceGroupName
  location            = var.location
  tenant_id           = var.tenantId
  sku_name            = "standard"

  access_policy {
    tenant_id = var.tenantId
    object_id = var.objectId

    secret_permissions = ["Get", "Set", "Delete", "List"]
  }
}

resource "azurerm_key_vault_secret" "dbPassword" {
  name         = "db-password"
  value        = var.dbAdminPassword
  key_vault_id = azurerm_key_vault.keyVaultMain.id
}