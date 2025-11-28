
# Virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
    name                = "my-vm"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    size                = var.vm_size



    network_interface_ids = [
        azurerm_network_interface.nic.id        # <- riktig referanse
    ]       

    admin_username = "adminuser"
    admin_password = var.admin_password     # <- ikke hardkodet


    # spesifisere OS-image og disk-instillinger
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest" 
    }
}
