
variable "enabled" {
    description = "Determine whether this module should be run or not."
    default = 0
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
  default     = "cluster"
}

variable "location" {
  default     = "eastus"
  description = "The location for the AKS deployment"
}

variable "resource_group_name" {
  description = "The resource group where the AKS cluster will be deployed"
}

variable "ssh_public_key" {
  description = "SSH public key for the Linux VM nodes"
}

variable "client_id" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
  default = ""
}

variable "client_secret" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
  default = ""
}

variable "rbac-enabled" {
  description = "Enable role based access control on the Kubernetes cluster"
  default = "true"
}

variable "kubernetes_version" {
    description = "The version of Kubernetes to be deployed"
}

variable "log_analytics_enabled" {
    description = "Should Log Analytics be enabled as part of this deployment"
    default = "true"
}
variable "log_analytics_workspace_id" {
    description = "ID for the Log Analytics workspace"
}