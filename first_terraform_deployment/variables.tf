variable "compute_subnet_nsg_name" {
  type = string
  nullable = false
  description = "Compute subnet NSG name"
}

variable "location" {
  type = string
  nullable = false
  description = "NSG location"
}

variable "rg_name" {
  type = string
  nullable = false
  description = "RG name"
}

variable "compute_vnet_name" {
  type = string
  nullable = false
  description = "Compute Virtual Network Name"
}

variable "compute_vnet_address_space" {
  type = list(string)
  nullable = false
  description = "Address space for compute vnet"
}

variable "compute_subnet_name" {
  type = string
  nullable = false
  description = "Name for compute subnet"
}

variable "compute_subnet_address_prefixes" {
  type = list(string)
  nullable = false
  description = "Address prefixes for compute subnet"
}

variable "tags" {
  type = map(string)
  nullable = false
  description = "Tags for resource"
}