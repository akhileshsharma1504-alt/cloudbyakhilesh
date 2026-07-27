resource "azurerm_network_interface" "nic-name" {
for_each = var.nics
name = each.value.nic-name
location = each.value.location
resource_group_name = each.value.rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.s-nets[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pub-ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.nics
  name                = each.value.vm-name
  resource_group_name = each.value.rg
  location            = each.value.location
  size                = "Standard_D2s_v3"
  admin_username      = each.value.user
  admin_password      =each.value.password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic-name[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}