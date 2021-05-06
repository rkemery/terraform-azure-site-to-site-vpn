resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.vnet_addr_space
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.addr_prefixes
}

resource "azurerm_local_network_gateway" "onpremise" {
  name                = var.local_network_gw_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  gateway_address     = var.local_gw_addr
  address_space       = var.local_gw_addr_space
}

resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = var.public_ip_allocation
}

resource "azurerm_virtual_network_gateway" "example" {
  name                = var.vnet_gw_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  type     = var.vnet_gw_type
  vpn_type = var.vnet_gw_vpn_type

  active_active = false
  enable_bgp    = false
  sku           = var.vnet_gw_vpn_sku

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.example.id
    private_ip_address_allocation = var.vnet_gw_private_ip_addr_allocation
    subnet_id                     = azurerm_subnet.example.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "onpremise" {
  name                       = var.vnet_gw_connection_name
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name

  type                       = var.vnet_gw_connection_type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.example.id
  local_network_gateway_id   = azurerm_local_network_gateway.onpremise.id

  shared_key                 = var.vnet_gw_connection_shared_key
}
