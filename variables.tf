variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
  default     = "cluster"
}

variable "location" {
  default     = "eastus"
  description = "The location for the AKS deployment"
}

variable "client_id" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
  default = ""
}

variable "client_secret" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
  default = ""
}

