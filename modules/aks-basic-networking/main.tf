resource "azurerm_kubernetes_cluster" "aks" {
    count = "${var.enabled}"
    name = "${var.prefix}-aks"
    location  = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    dns_prefix = "${var.prefix}"

  linux_profile {
    admin_username = "${var.linux_admin_user_name}"

    ssh_key {
      key_data = "${var.ssh_public_key}"
    }
  }
  network_profile {
    network_plugin = "kubenet"
  }

  agent_pool_profile {
    name            = "nodepool01"
    count           = "${var.agent_pool_vm_count}"
    vm_size         = "${var.agent_pool_vm_size}"
    os_type         = "Linux"
    os_disk_size_gb = "${var.agent_pool_vm_disk_size}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  addon_profile {
    oms_agent {
      enabled                    = "${var.log_analytics_enabled}"
      log_analytics_workspace_id = "${var.log_analytics_workspace_id}"
    }
    http_application_routing {
      enabled = "${var.http_application_routing_enabled}"
    }
  }

  role_based_access_control {
    enabled = "${var.rbac_enabled}"
  }

  kubernetes_version = "${var.kubernetes_version}"
}