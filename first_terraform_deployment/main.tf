terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg_first_terraform_deployment" {
  location = var.location
  name     = var.rg_name
}

module "compute_vnet" {
  source = "./terraform_modules/network/vnet"
  vnet_name = var.compute_vnet_name
  location = var.location
  rg_name = azurerm_resource_group.rg_first_terraform_deployment.name
  vnet_address_space = var.compute_vnet_address_space
  tags = var.tags
  depends_on = [ azurerm_resource_group.rg_first_terraform_deployment ]
}

module "compute_subnet_nsg" {
  source = "./terraform_modules/network/nsg"
  nsg_name = var.compute_subnet_nsg_name
  location = var.location
  rg_name = var.rg_name
  sec_rules = [ {
    name                         = "AllowSSH"
    description                  = "Allow ssh connection to compute recources"
    priority                     = 150
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "Tcp"
    source_port_range            = "*"
    destination_port_range       = "22"
    source_address_prefix        = "*"
    destination_address_prefix   = var.compute_subnet_address_prefixes[0]
    source_port_ranges           = []
    destination_port_ranges      = []
    source_address_prefixes      = []
    destination_address_prefixes = []
    source_application_security_group_ids = []
    destination_application_security_group_ids = []
  } ]
  tags = var.tags
  depends_on = [ azurerm_resource_group.rg_first_terraform_deployment ]
}

module "compute_subnet" {
    source = "./terraform_modules/network/subnet"
    subnet_name = var.compute_subnet_name
    subnet_address_prefixes = var.compute_subnet_address_prefixes
    nsg_id = module.compute_subnet_nsg.nsg_id
    vnet_name = var.compute_vnet_name
    rg_name = var.rg_name
    depends_on = [ module.compute_subnet_nsg, module.compute_vnet ]
}