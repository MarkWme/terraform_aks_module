output "display_name" {
    value="${azuread_service_principal.aks_service_principal.*.display_name}"
}

output "client_id" {
    value = "${azuread_application.aks_service_principal.*.application_id}"
}

output "client_secret" {
    value = "${azuread_service_principal_password.aks_service_principal.*.value}"
}

output "object_id" {
    value = "${azuread_service_principal.aks_service_principal.*.id}"
}