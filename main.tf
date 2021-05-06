module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "4.0.0"

  azure_region = var.location
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "4.0.0"
  location     = module.azure-region.location
  client_name  = var.client_name
  environment  = var.environment
  stack        = var.stack
}

module "azure-network-vnet" {
  source  = "claranet/vnet/azurerm"
  version = "4.0.0"

  environment      = var.environment
  location         = module.azure-region.location
  location_short   = module.azure-region.location-short
  client_name      = var.client_name
  stack            = var.stack
  custom_vnet_name = var.custom_vnet_name

  resource_group_name = module.rg.resource_group_name
  vnet_cidr           = var.vnet_cidr
}

module "vpn-gw" {
  source  = "claranet/vpn/azurerm"
  version = "4.0.0"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short

  # You can set either a prefix for generated name or a custom one for the resource naming
  custom_name = var.custom_vpn_gw_name

  virtual_network_name = module.azure-network-vnet.virtual_network_name
  subnet_gateway_cidr  = var.subnet_gw_cidr

  on_prem_gateway_subnets_cidrs = var.on_prem_gateway_subnets
  on_prem_gateway_ip            = var.on_prem_gateway_ip

  vpn_ipsec_shared_key = var.shared_key

  vpn_gw_connection_name = "azure_to_${var.client_name}_on-prem"
}
