module "azurerm_resource_group" {
    source = "../../module/azurerm_resource_group"
    rgs = var.rgs
}
module "azurerm_virtual_network" {
  depends_on = [ module.azurerm_resource_group ]
    source = "../../module/azurerm_virtual_network"
    vnets = var.vnets
}

module "azurerm_subnet" {
  depends_on = [ module.azurerm_virtual_network ]
    source = "../../module/azurerm_subnet"
    subnets = var.subnets
  }
  module "azurerm_public_ip" {
    depends_on = [ module.azurerm_resource_group ]
    source = "../../module/azurerm_public_ip"
   pips = var.pips
  }
module "azurerm_network_interface" {
  depends_on = [ module.azurerm_subnet ]
    source = "../../module/azurerm_network_interface"
    nics = var.nics
  
}

module "azurerm_network_security_group" {
  depends_on = [ module.azurerm_network_interface ]
source = "../../module/azurerm_network_security_group"

nsgs = var.nsgs
  
}

