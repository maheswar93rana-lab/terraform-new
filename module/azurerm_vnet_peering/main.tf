resource "azurerm_virtual_network_peering" "peering_1_to_2" {
  for_each                     = var.peerings
  name                         = "${each.value.name}-1to2"
  resource_group_name          = data.azurerm_virtual_network.vnet_1[each.key].resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.vnet_1[each.key].name
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet_2[each.key].id
  allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", true)
  allow_forwarded_traffic      = lookup(each.value, "allow_forwarded_traffic", true)
}

resource "azurerm_virtual_network_peering" "peering_2_to_1" {
  for_each                     = var.peerings
  name                         = "${each.value.name}-2to1"
  resource_group_name          = data.azurerm_virtual_network.vnet_2[each.key].resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.vnet_2[each.key].name
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet_1[each.key].id
  allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", true)
  allow_forwarded_traffic      = lookup(each.value, "allow_forwarded_traffic", true)
}
