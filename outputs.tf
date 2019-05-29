output "aks_service_principal_display_name" {
    value="${module.azuread_service_principal.display_name}"
}

output "aks_service_principal_client_id" {
  value = "${module.azuread_service_principal.client_id}"
}

output "aks_service_principal_client_secret" {
    value = "${module.azuread_service_principal.client_secret}"
}

output "aks_service_principal_object_id" {
    value = "${module.azuread_service_principal.object_id}"
}