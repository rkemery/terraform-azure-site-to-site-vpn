variable "rg_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_addr_space" {
  type = list
}
variable "subnet_name" {}
variable "addr_prefixes" {
  type = list
}
variable "local_network_gw_name" {}
variable "local_gw_addr" {}
variable "local_gw_addr_space" {
  type = list
}
variable "public_ip_name" {}
variable "public_ip_allocation" {}
variable "vnet_gw_name" {}
variable "vnet_gw_type" {}
variable "vnet_gw_vpn_type" {}
variable "vnet_gw_vpn_sku" {}
variable "vnet_gw_private_ip_addr_allocation" {}
variable "vnet_gw_connection_name" {}
variable "vnet_gw_connection_type" {}
variable "vnet_gw_connection_shared_key" {}
