variable "vnet_name" {
  type = string
  nullable = false
  description = "Virtual Network Name"
}

variable "vnet_address_space" {
  type = list(string)
  nullable = false
  description = "Address space for vnet"
}

variable "location" {
  type = string
  nullable = false
  description = "Location of the vnet"
}

variable "rg_name" {
  type = string
  nullable = false
  description = "Resource group for vnet"
}

variable "subnet" {
  type = set(object({
    name = string
    address_prefix = string
    security_group = string
  }))
  nullable = false
  description = "Subnet for vnet"
}

variable "tags" {
  type = map(string)
  nullable = false
  description = "Tags for resource"
}