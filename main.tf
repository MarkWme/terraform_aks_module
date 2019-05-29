locals {
  service_principal_name = "aks-${var.prefix}-service-principal"
}

module "azuread_service_principal" {
  source = "./modules/azuread_service_principal"
  enabled = "${var.client_id == "" ? 1 : 0}"
  service_principal_name = "${local.service_principal_name}"  
}



/*resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}
*/

