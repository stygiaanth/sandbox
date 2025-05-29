variable "nsg_name" {
  type = string
  nullable = false
  description = "NSG name"
}

variable "location" {
  type = string
  nullable = false
  description = "NSG location"
}

variable "rg_name" {
  type = string
  nullable = false
  description = "NSG rg name"
}

variable "sec_rules" {
  type = set(object({
    name                       = string
    description                = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    source_address_prefix      = string
    destination_address_prefix = string
    destination_port_range     = string
    source_port_ranges         = list(string)
    destination_port_ranges    = list(string)
    source_address_prefixes    = list(string)
    destination_address_prefixes = list(string)
    source_application_security_group_ids = list(string)
    destination_application_security_group_ids = list(string)
  }))
  nullable = true
  description = "NSG security rules"
}

variable "tags" {
  type = map(string)
  nullable = false
  description = "Tags for resource"
}