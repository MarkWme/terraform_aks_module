output "aks_service_principal_display_name" {
    value="${element(module.azuread_service_principal.display_name,0)}"
}

output "aks_service_principal_client_id" {
  value = "${element(module.azuread_service_principal.client_id,0)}"
}

output "aks_service_principal_client_secret" {
    value = "${element(module.azuread_service_principal.client_secret,0)}"
}

output "aks_service_principal_object_id" {
    value = "${element(module.azuread_service_principal.object_id,0)}"
}