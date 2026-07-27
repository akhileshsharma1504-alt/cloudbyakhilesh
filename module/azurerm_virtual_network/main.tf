resource"azurerm_virtual_network" "v-nets" {
for_each = var.vnets
name = each.value.name
location = each.value.location
resource_group_name = each.value.rg
address_space = each.value.space
}