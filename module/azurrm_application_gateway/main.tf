resource "azurerm_application_gateway" "appgws" {
  for_each            = var.appgws
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = lookup(each.value, "sku_name", "Standard_v2")
    tier     = lookup(each.value, "sku_tier", "Standard_v2")
    capacity = lookup(each.value, "capacity", 2)
  }

  gateway_ip_configuration {
    name      = "appgw_ip_config"
    subnet_id = data.azurerm_subnet.subnet[each.key].id
  }

  frontend_port {
    name = "frontend_port_80"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "appgw_frontend_ip"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }

  backend_address_pool {
    name = "appgw_backend_pool"
  }

  backend_http_settings {
    name                  = "appgw_http_settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "appgw_listener"
    frontend_ip_configuration_name = "appgw_frontend_ip"
    frontend_port_name             = "frontend_port_80"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "appgw_routing_rule"
    rule_type                  = "Basic"
    http_listener_name         = "appgw_listener"
    backend_address_pool_name  = "appgw_backend_pool"
    backend_http_settings_name = "appgw_http_settings"
    priority                   = 1
  }
}
