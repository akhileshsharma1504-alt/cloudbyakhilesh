resource "azurerm_public_ip""public-ip"{
    for_each = var.pips
    name = each.value.pip-name
    location = each.value.location
    resource_group_name = each.value.rg
    allocation_method = "Static"
}