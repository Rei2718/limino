// General
variable "project"     { default = "limino" }
variable "environment" { default = "dev" }
variable "location"    { default = "japaneast" }

// Container Registry
variable "imageName"    { default = "api" }
variable "imageVersion" { default = "v1.0.0" }

// Database - Password is not here
variable "dbAdminLogin"    { default = "liminoadmin" }
variable "dbAdminPassword" {}

// federation
variable "servicePrincipalAppId" { default = "98cf13a9-fa7d-46d8-8e54-19bba613efec" }
variable "githubRepo"            { default = "Rei2718/limino" }