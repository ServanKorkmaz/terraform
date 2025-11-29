
#### main.tf ####
provider "azurerm" {
features {}
}


# Resource Group
resource "azurerm_resource_group" "rg" {
name = azurerm_resource_group.rg.name       # changed
location = var.location                     # changed
}





#### networks.tf ####


# Virtual Network
resource "azurerm_virtual_network" "vnet" {
name = "my-vnet"
address_space = ["10.0.0.0/16"]
location = var.location                                     # changed
resource_group_name = azurerm_resource_group.rg.name        # changed
}


# Subnet
resource "azurerm_subnet" "subnet" {
name = "my-subnet"
resource_group_name = azurerm_resource_group.rg.name       # changed
virtual_network_name = "my-vnet"
address_prefixes = ["10.0.1.0/24"]
}

# Network Interface
resource "azurerm_network_interface" "nic" {
name = "my-nic"
location = var.location                                    # changed
resource_group_name = azurerm_resource_group.rg.name       # changed
}


# Security Group
resource "azurerm_network_security_group" "nsg" {
name = "my-nsg"
location = var.location
resource_group_name = azurerm_resource_group.rg.name      # changed


### adding security rules ###
security_rule {
    name =
    priority =
    
}




}





#### vms.tf ####


# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
name = "my-vm"
location = var.location                                         # changed
resource_group_name = "rg-demo"
network_interface_ids = [
    azurerm_network_interface.nic.id ]                          # changed

size = "Standard_DS1_v2"
admin_username = "adminuser"
admin_password = var.admin_password                             # changed
}


