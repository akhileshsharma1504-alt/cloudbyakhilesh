resource "azurerm_network_security_group" "n-sgs" {
    for_each = var.nsgs
   name = each.value.name
   location = each.value.location
   resource_group_name = each.value.rg

    security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "dev"
  }
}
