resource "azuread_application" "aks_service_principal" {
  name = "${var.service_principal_name}"
}

resource "azuread_service_principal" "aks_service_principal" {
  application_id = "${azuread_application.aks_service_principal.application_id}"
}

resource "azuread_service_principal_password" "aks_service_principal" {
  service_principal_id = "${azuread_service_principal.aks_service_principal.id}"
  value = "somereallycomplexpasswordnoreallythisishardtoguess99!"
  end_date_relative = "8760h"
}