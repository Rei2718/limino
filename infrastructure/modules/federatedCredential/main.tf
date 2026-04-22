resource "azuread_application_federated_identity_credential" "federatedCredentialMain" {
  application_id = "/applications/${var.servicePrincipalAppId}"
  display_name   = "${var.project}-federated-credential"
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:${var.githubRepo}:ref:refs/heads/main"
  audiences      = ["api://AzureADTokenExchange"]
}