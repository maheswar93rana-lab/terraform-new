data "azurerm_virtual_network" "vnet_1" {
  for_each            = var.peerings
  name                = each.value.vnet1_name
  resource_group_name = each.value.vnet1_rg_name
}

data "azurerm_virtual_network" "vnet_2" {
  for_each            = var.peerings
  name                = each.value.vnet2_name
  resource_group_name = each.value.vnet2_rg_name
}
