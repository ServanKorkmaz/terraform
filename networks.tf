
# Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name = "my-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = var.location         # variabel for fleksibilitet
    resource_group_name = azurem.resource_group_name.rg.name    # variabel for fleksibilitet
}

# Subnet
resource "azurerm_subnet" "subnet" {
    name = "my-subnet"
    resource_group_name     = azurerm_resource_group.rg.name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    address_prefixes        = ["10.0.1.0/24"]
}


# Security Group
resource "azurerm_network_security_group" "nsg" {
    name                = "my-nsg"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name

    # adding security Rules
    security_rule {
        name                        = "SSH"
        priority                    = 100
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_port_range           = "*"
        destination_port_range      = "22"
        source_address_prefix       = "*"
        destination_address_prefix  = "*"
    }
}


# Network Interface - nå koblet til subnet
resource "azurerm_network_interface" "nic" {
name                = "my-nic"
location            = var.location
resource_group_name = azurerm_resource_group.rg.name

ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subent.id        # <- nytt
    private_ip_address_allocation = "Dynamic"
}
}
