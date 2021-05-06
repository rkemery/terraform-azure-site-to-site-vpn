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
variable "nic_name" {}
variable "nic_ip_config_name" {}
variable "nic_private_ip_addr_allocation" {}
variable "vm_name" {}
variable "vm_size" {}
variable "vm_admin_username" {}
variable "vm_admin_password" {}
variable "image_publisher" {}
variable "image_offer" {}
variable "image_sku" {}
variable "image_version" {}
variable "vm_subnet_name" {}
variable "vm_subnet_service_endpoints" {
  type = list
}
variable "vm_address_prefixes" {
  type = list
}
variable "sql_server_name" {}
variable "sql_server_version" {}
variable "sql_server_admin_login" {}
variable "sql_server_admin_password" {}
variable "sql_server_tags" {}
variable "sql_server_storage_account_name" {}
variable "sql_server_storage_account_tier" {}
variable "sql_server_storage_account_type" {}
variable "sql_db_name" {}
variable "sql_db_tags" {}
variable "sql_vnet_rule_name" {}
variable "private_endpoint_name" {}
variable "private_endpoint_connection_name" {}
