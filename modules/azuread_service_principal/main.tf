resource "azuread_application" "aks_service_principal" {
    count = "${var.enabled}"
    name = "${var.service_principal_name}"
}

resource "azuread_service_principal" "aks_service_principal" {
    count = "${var.enabled}"
    application_id = "${azuread_application.aks_service_principal.application_id}"
}

resource "random_string" "password" {
    count = "${var.enabled}"
    length  = 32
    special = true
}

resource "azuread_service_principal_password" "aks_service_principal" {
    count = "${var.enabled}"
    service_principal_id = "${azuread_service_principal.aks_service_principal.id}"
    value = "${random_string.password.result}"
    end_date_relative = "17520h" #password expires in 2 years
}