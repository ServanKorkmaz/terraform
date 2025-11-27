
# Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name = "my-vnet"
    address_space = ["10.0.0.0/16"]
    location = "West Europe"
    resource_group_name = "rg-demo"
}

# Subnet
resource "azurerm_subnet" "subnet" {
    name = "my-subnet"
    resource_group_name = "rg-demo"
    virtual_network_name = "my-vnet"
    address_prefixes = ["10.0.1.0/24"]
}

# Network Interface
resource "azurerm_network_interface" "nic" {
name = "my-nic"
location = "West Europe
resource_group_name = "rg-demo"
}

# Security Group
resource "azurerm_network_security_group" "nsg" {
IIKG3005 Infrastructure as Code
7/9
name = "my-nsg"
location = "West Europe"
resource_group_name = "rg-demo"
}
