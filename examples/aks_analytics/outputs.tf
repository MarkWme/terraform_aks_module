output "aks_service_principal_display_name" {
  value = "${module.aks.aks_service_principal_display_name}"
}

output "aks_service_principal_client_id" {
  value = "${module.aks.aks_service_principal_client_id}"
}

output "aks_service_principal_client_secret" {
    value = "${module.aks.aks_service_principal_client_secret}"
}

output "aks_service_principal_object_id" {
    value = "${module.aks.aks_service_principal_object_id}"
}
