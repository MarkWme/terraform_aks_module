locals {
  service_principal_name = "aks-${var.prefix}-service-principal"
}

module "azuread_service_principal" {
  source = "./modules/azuread_service_principal"
  enabled = "${var.client_id == "" ? 1 : 0}"
  service_principal_name = "${local.service_principal_name}"  
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key" {
  //count    = "${var.public_ssh_key == "" ? 1 : 0}"
  content  = "${tls_private_key.ssh.private_key_pem}"
  filename = "./private_ssh_key"
}

resource "azurerm_resource_group" "aks" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_log_analytics_workspace" "aks" {
  name                = "${var.prefix}-log-analytics-workspace"
  location            = "${azurerm_resource_group.aks.location}"
  resource_group_name = "${azurerm_resource_group.aks.name}"
  sku                 = "Standalone"
  retention_in_days   = 30
  }

data "azurerm_kubernetes_service_versions" "current" {
  location = "${azurerm_resource_group.aks.location}"
}

module "aks-basic-networking" {
  source = "./modules/aks-basic-networking"
  enabled = "${var.network_type == "basic" ? 1: 0}"
  resource_group_name = "${azurerm_resource_group.aks.name}"
  client_id = "${var.client_id == "" ? element(module.azuread_service_principal.client_id,0) : var.client_id}"
  client_secret = "${var.client_secret == "" ? element(module.azuread_service_principal.client_secret,0) : var.client_secret}"
  ssh_public_key = "${replace(tls_private_key.ssh.public_key_openssh, "\n", "")}"
  kubernetes_version = "${data.azurerm_kubernetes_service_versions.current.latest_version}"
  log_analytics_enabled = "true"
  log_analytics_workspace_id = "${azurerm_log_analytics_workspace.aks.id}"
}

module "aks-advanced-networking" {
  source = "./modules/aks-advanced-networking"
  enabled = "${var.network_type == "advanced" ? 1: 0}"
resource_group_name = "${azurerm_resource_group.aks.name}"
  client_id = "${var.client_id == "" ? element(module.azuread_service_principal.client_id,0) : var.client_id}"
  client_secret = "${var.client_secret == "" ? element(module.azuread_service_principal.client_secret,0) : var.client_secret}"
  ssh_public_key = "${replace(tls_private_key.ssh.public_key_openssh, "\n", "")}"
  kubernetes_version = "${data.azurerm_kubernetes_service_versions.current.latest_version}"
  log_analytics_enabled = "true"
  log_analytics_workspace_id = "${azurerm_log_analytics_workspace.aks.id}"
}