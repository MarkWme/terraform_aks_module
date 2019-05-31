provider "azurerm" {
}

provider "azuread" {
  
}
module "aks" {
  source = "../.."
  client_id = "something"
  }


