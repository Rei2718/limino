output "dbPasswordSecretUri" {
  value = azurerm_key_vault_secret.dbPassword.versionless_id
}