
variable "enabled" {
    type = "string"
    description = "Determine whether this module should be run or not."
    default = 0
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
  default     = "cluster"
}

variable "resource_group_name" {
    type = "string"
    description = "Resource group where the virtual network and subnet will be created"
}

variable "location" {
  default     = "eastus"
  description = "The location for the AKS deployment"
}