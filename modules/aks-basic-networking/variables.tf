
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

variable "linux_admin_user_name" {
  description = "Admin user name for the Linux virtual machines"
  default = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key for the Linux virtual machines"
}

variable "agent_pool_vm_size" {
  default = "Standard_DS2_v2"
  description = "The size of the virtual machines in the agent pool"
}

variable "agent_pool_vm_count" {
  default = 3
  description = "The number of virtual machines in the agent pool"
}

variable "agent_pool_vm_disk_size" {
  default = 30
  description = "The disk size for each virtual machine in the agent pool"
  
}

variable "client_id" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
  default = ""
}

variable "client_secret" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
  default = ""
}

variable "rbac_enabled" {
  description = "Enable role based access control on the Kubernetes cluster"
  default = "true"
}

variable "http_application_routing_enabled" {
  description = "Defines whether the AKS HTTP Application Routing feature should be enabled"
  default = "false"
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
    default = ""
}