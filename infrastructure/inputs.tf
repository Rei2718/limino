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