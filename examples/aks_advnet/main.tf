resource "azurerm_resource_group" "test" {
  name     = "${var.prefix}-aks-rg"
  location = "${var.location}"
}
#Uncomment below if you need a Route Table (UDR) to route to an Netwokr Virtual Appliamce (Palo Alto, F5, Barricuda, Cisco ASR, etc) in a peered VNET
# resource "azurerm_route_table" "test" {
#   name                = "${var.prefix}-routetable"
#   location            = "${azurerm_resource_group.test.location}"
#   resource_group_name = "${azurerm_resource_group.test.name}"

#   route {
#     name                   = "default"
#     address_prefix         = "10.100.0.0/14"
#     next_hop_type          = "VirtualAppliance"
#     next_hop_in_ip_address = "10.10.1.1"
#   }
# }

# resource "azurerm_log_analytics_workspace" "test" {
#   name                = "${var.prefix}-law"
#   location            = "${azurerm_resource_group.test.location}"
#   resource_group_name = "${azurerm_resource_group.test.name}"
#   sku                 = "Free"
# }

# resource "azurerm_log_analytics_solution" "test" {
#   solution_name         = "ContainerInsights"
#   location              = "${azurerm_resource_group.test.location}"
#   resource_group_name   = "${azurerm_resource_group.test.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.test.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.test.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/ContainerInsights"
#   }
# }

resource "azurerm_virtual_network" "test" {
  name                = "${var.prefix}-network"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  address_space       = ["${var.vnetIPCIDR}"]
}

resource "azurerm_subnet" "test" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  address_prefix       = "${var.subnetIPCIDR}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  #Uncomment if Route Table was created above. 
  # this field is deprecated and will be removed in 2.0 - but is required until then
#  route_table_id = "${azurerm_route_table.test.id}"
}

#Uncomment if Route Table was created above. 
# resource "azurerm_subnet_route_table_association" "test" {
#   subnet_id      = "${azurerm_subnet.test.id}"
#   route_table_id = "${azurerm_route_table.test.id}"
# }

resource "azurerm_kubernetes_cluster" "test" {
  name                = "${var.prefix}-aks"
  location            = "${azurerm_resource_group.test.location}"
  dns_prefix          = "${var.prefix}-aks"
  resource_group_name = "${azurerm_resource_group.test.name}"
  kubernetes_version = "${var.k8sVer}"

  linux_profile {
    admin_username = "${var.osAdminUser}"

    ssh_key {
      key_data = "${file(var.public_ssh_key_path)}"
    }
  }

  agent_pool_profile {
    name            = "agentpool"
    count           = "${var.nodeCount}"
    vm_size         = "${var.nodeSize}"
    os_type         = "Linux"
    os_disk_size_gb = 30

    # Required for advanced networking
    vnet_subnet_id = "${azurerm_subnet.test.id}"
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }

  role_based_access_control {
    enabled = true
  }

  # addon_profile {
  #   oms_agent {
  #     enabled                    = true
  #     log_analytics_workspace_id = "${azurerm_log_analytics_workspace.test.id}"
  #   }
  # }

  network_profile {
    network_plugin = "${var.netPlugin}"
    service_cidr = "${var.svc-cidr}"
    dns_service_ip = "${var.dns-ip}"
    docker_bridge_cidr = "${var.dockerbridge-cidr}"
    # pod_cidr = "${var.pod-cidr}"
  }
}
