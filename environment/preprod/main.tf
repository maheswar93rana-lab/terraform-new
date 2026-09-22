module "azurerm_resource_group" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../module/azurerm_virtual_network"
  vnets      = var.vnets
}

module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../module/azurerm_subnet"
  subnets    = var.subnets
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../module/azurerm_public_ip"
  pips       = var.pips
}

module "azurerm_nic_virtual_machine" {
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../module/azurerm_nic_virtual_machine"
  vms        = var.vms
}

module "azurerm_load_balance" {
  depends_on = [module.azurerm_public_ip]
  source     = "../../module/azurerm_load_balance"
  lbs        = var.lbs
}

module "azurrm_application_gateway" {
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../module/azurrm_application_gateway"
  appgws     = var.appgws
}

module "azurerm_azure_bastion" {
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../module/azurerm_azure_bastion"
  bastions   = var.bastions
}

module "azurerm_vnet_peering" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../module/azurerm_vnet_peering"
  peerings   = var.peerings
}
