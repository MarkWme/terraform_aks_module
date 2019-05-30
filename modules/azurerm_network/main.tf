resource "azurerm_virtual_network" "vnet" {
    count = "${var.enabled}"
    name = "${var.prefix}-vnet"
    resource_group_name = "${var.resource_group_name}"
    address_space = ["10.0.0.0/8"]
    location      = "${var.location}"
}

resource "azurerm_subnet" "subnet" {
    count = "${var.enabled}"
    name = "${var.prefix}-subnet"
    address_prefix = "10.240.0.0/16"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    resource_group_name = "${var.resource_group_name}"
}