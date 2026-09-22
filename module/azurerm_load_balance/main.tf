resource "azurerm_lb" "lbs" {
  for_each            = var.lbs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = lookup(each.value, "sku", "Standard")

  frontend_ip_configuration {
    name                 = lookup(each.value, "frontend_ip_name", "PublicIPAddress")
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}
