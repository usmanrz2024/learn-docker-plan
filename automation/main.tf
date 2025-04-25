
provider "azurerm" {
    features {}
    skip_provider_registration = true
  
}

provider "random" {
  
}

resource "random_pet" "name"{
    length = 2
    separator = "-"
}

resource "azurerm_resource_group" "rg" {
  name = "${random_pet.name.id}-rg"
  location = var.location  
}
 

 resource "azurerm_container_registry" "acr" {
    name = "${substr(lower(replace(random_pet.name.id, "-", "")), 0, 16)}registry"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    sku = "Basic"

 }