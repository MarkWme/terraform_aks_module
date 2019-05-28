provider "azurerm" {
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "aks" {
  name     = "x-rg-euw-aks-hack"
  location = "westeurope"
}