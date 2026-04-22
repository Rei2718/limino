output "principalId" {
  value = azurerm_linux_web_app.appServiceMain.identity[0].principal_id
}

output "hostname" {
  value = azurerm_linux_web_app.appServiceMain.default_hostname
}

output "appServiceName" {
  value = azurerm_linux_web_app.appServiceMain.name
}