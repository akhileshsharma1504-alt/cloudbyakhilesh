data"azurerm_public_ip""pub-ip"{
    for_each = var.nics
    name = each.value.dpips
    resource_group_name = each.value.rg
}

data"azurerm_subnet""s-nets"{
    for_each = var.nics
    name = each.value.dsub
    virtual_network_name = each.value.dvnets
    resource_group_name = each.value.rg
}
