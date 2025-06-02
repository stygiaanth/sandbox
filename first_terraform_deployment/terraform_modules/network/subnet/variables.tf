variable "vnet_name" {
  type = string
  nullable = false
  description = "Vnet name for subnet"
}

variable "subnet_name" {
  type = string
  nullable = false
  description = "Name for compute subnet"
}

variable "subnet_address_prefixes" {
  type = list(string)
  nullable = false
  description = "Address prefixes for compute subnet"
}

variable "rg_name" {
  type = string
  nullable = false
  description = "Resource group for vnet"
}

variable "nsg_id" {
  type = string
  nullable = false
  description = "NSG id for subnet"
}