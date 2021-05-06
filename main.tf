resource "azurerm_resource_group" "vpn" {
  name     = var.rg_name
  location = var.location
}

module "vpn-gateway" {
  source  = "kumarvna/vpn-gateway/azurerm"
  version = "1.0.0"

  # Resource Group, location, VNet and Subnet details
  # IPSec Site-to-Site connection configuration requirements
  resource_group_name  = azurerm_resource_group.vpn.name
  virtual_network_name = var.vnet_name
  vpn_gateway_name     = var.vpn_gw_name
  gateway_type         = var.vpn_gw_type

  # local network gateway connection
  local_networks = [
    {
      local_gw_name         = var.local_gw_name
      local_gateway_address = var.local_gw_addr
      local_address_space   = var.local_addr_space
      shared_key            = var.local_shared_key
    },
  ]

  # Adding TAG's to your Azure resources (Required)
  tags = {
    ProjectName  = var.project_name
    Env          = var.env
    Owner        = var.owner
    BusinessUnit = var.bu
    ServiceClass = var.service_class
  }
}
