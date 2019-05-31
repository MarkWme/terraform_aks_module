provider "azurerm" {
}

provider "azuread" {
  
}


terraform {
  backend "azurerm" {}
}

module "aks" {
  source = "../.."
  location = "westeurope"
  //client_id = "made-up-value"
  prefix = "k8scluster"
  network_type = "basic"
  }


