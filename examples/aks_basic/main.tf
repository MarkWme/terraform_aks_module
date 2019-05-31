provider "azurerm" {
}

provider "azuread" {
  
}
module "aks" {
  source = "../.."
  }


