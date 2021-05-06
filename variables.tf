variable "location" {
}

variable "version" {
}

variable "client_name" {
}

variable "environment" {
}

variable "stack" {
}

variable "custom_vnet_name" {
}

variable "vnet_cidr" {
  type = list
}

variable "custom_vpn_gw_name" {
}

variable "subnet_gw_cidr" {
}

variable "on_prem_gw_subnets" {
  type = list
}

variable "on_prem_gw_ip" {
}

variable "shared_key" {
}
