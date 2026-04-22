output "appServiceName" {
  value = module.appService.appServiceName
}

output "resourceGroupName" {
  value = azurerm_resource_group.resourceGroupMain.name
}

output "registryUrl" {
  value = module.acr.loginServer
}

output "imageVersion" {
  value = var.imageVersion
}