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
/*
output "aks_kube_config" {
    value = "${azurerm_kubernetes_cluster.aks.kube_config_raw}"
}
/*
output "id" {
  value = "${azurerm_kubernetes_cluster.aks.id}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config_raw}"
}

output "client_key" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config.0.client_key}"
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate}"
}

output "cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate}"
}

output "host" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config.0.host}"
}

/*
output "http_application_routing_zone_name" {
  value = "${azurerm_kubernetes_cluster.aks.addon_profile.0.http_application_routing.0.http_application_routing_zone_name}"
}
*/