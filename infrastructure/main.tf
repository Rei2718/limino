terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resourceGroupMain" {
  name     = "${var.project}-rg-${var.environment}"
  location = var.location
}

data "azurerm_client_config" "current" {}



module "acr" {
  source            = "./modules/acr"
  resourceGroupName = azurerm_resource_group.resourceGroupMain.name
  location          = azurerm_resource_group.resourceGroupMain.location
  project           = var.project
  environment       = var.environment

  # ServicePrincipalId for ACR
  appServicePrincipalId = module.appService.principalId
}

module "appService" {
  source            = "./modules/appService"
  resourceGroupName = azurerm_resource_group.resourceGroupMain.name
  location          = azurerm_resource_group.resourceGroupMain.location
  project           = var.project
  environment       = var.environment
  acrLoginServer    = module.acr.loginServer
  imageName         = var.imageName
  imageVersion      = var.imageVersion

  dbHost              = module.database.fqdn
  dbName              = "${var.project}-db-${var.environment}"
  dbAdminLogin        = var.dbAdminLogin
  dbPasswordSecretUri = module.keyVault.dbPasswordSecretUri
}

module "database" {
  source            = "./modules/database"
  resourceGroupName = azurerm_resource_group.resourceGroupMain.name
  location          = azurerm_resource_group.resourceGroupMain.location
  project           = var.project
  environment       = var.environment
  dbAdminLogin      = var.dbAdminLogin
  dbAdminPassword   = var.dbAdminPassword
}

module "keyVault" {
  source                = "./modules/keyVault"
  resourceGroupName     = azurerm_resource_group.resourceGroupMain.name
  location              = azurerm_resource_group.resourceGroupMain.location
  project               = var.project
  environment           = var.environment
  tenantId              = data.azurerm_client_config.current.tenant_id
  objectId              = data.azurerm_client_config.current.object_id
  dbAdminPassword       = var.dbAdminPassword
  appServicePrincipalId = module.appService.principalId
}