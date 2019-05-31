module "azurerm_network" {
  source = "../azurerm_network"
  enabled = "${var.enabled}"
  prefix = "${var.prefix}"
  resource_group_name = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "aks" {
    count = "${var.enabled}"
    name = "${var.prefix}-aks"
    location  = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    dns_prefix = "${var.prefix}"

  linux_profile {
    admin_username = "guvnor"

    ssh_key {
      key_data = "${var.ssh_public_key}"
    }
  }
  network_profile {
    network_plugin = "advanced"
  }

  agent_pool_profile {
    name            = "nodepool01"
    count           = 3
    vm_size         = "Standard_B2ms"
    os_type         = "Linux"
    os_disk_size_gb = 30
    //vnet_subnet_id = 
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
      enabled = false
    }
  }

  role_based_access_control {
    enabled = "${var.rbac_enabled}"
  }

  kubernetes_version = "${var.kubernetes_version}"
}