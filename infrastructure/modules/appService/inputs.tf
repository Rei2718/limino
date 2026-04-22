variable "resourceGroupName" {}
variable "location"          {}
variable "project"           {}
variable "environment"       {}
variable "acrLoginServer"    {}
variable "imageName"         {}
variable "imageVersion"      {}

// Database
variable "dbHost"              {}
variable "dbName"              {}
variable "dbAdminLogin"        {}
variable "dbPasswordSecretUri" {}