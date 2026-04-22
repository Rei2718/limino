resource "azurerm_service_plan" "appServicePlan" {
  name                = "${var.project}-service-plan-${var.environment}"
  resource_group_name = var.resourceGroupName
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "appServiceMain" {
  name                = "${var.project}-app-service-${var.environment}"
  resource_group_name = var.resourceGroupName
  location            = var.location
  service_plan_id     = azurerm_service_plan.appServicePlan.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    container_registry_use_managed_identity = true
    application_stack {
      docker_registry_url = "https://${var.acrLoginServer}"
      docker_image_name   = "${var.imageName}:${var.imageVersion}"
    }
  }

  app_settings = {
    DB_HOST     = var.dbHost
    DB_NAME     = var.dbName
    DB_USER     = var.dbAdminLogin
    DB_PORT     = "5432"
    DB_PASSWORD = "@Microsoft.KeyVault(SecretUri=${var.dbPasswordSecretUri})"
  }
}