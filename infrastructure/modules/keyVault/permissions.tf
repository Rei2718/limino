resource "azurerm_key_vault_access_policy" "appServicePolicy" {
  key_vault_id = azurerm_key_vault.keyVaultMain.id
  tenant_id    = var.tenantId
  object_id    = var.appServicePrincipalId

  secret_permissions = ["Get"]
}