resource "azurerm_postgresql_flexible_server" "databaseServer" {
  name                   = "${var.project}-postgresql-${var.environment}"
  resource_group_name    = var.resourceGroupName
  location               = var.location
  version                = "16"
  administrator_login    = var.dbAdminLogin
  administrator_password = var.dbAdminPassword
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  zone                   = "1"

  authentication {
    active_directory_auth_enabled = false
    password_auth_enabled         = true
  }
}

resource "azurerm_postgresql_flexible_server_database" "databaseMain" {
  name      = "${var.project}-db-${var.environment}"
  server_id = azurerm_postgresql_flexible_server.databaseServer.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allowAzureServices" {
  name             = "allow-azure-services"
  server_id        = azurerm_postgresql_flexible_server.databaseServer.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}