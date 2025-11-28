provider "azurerm" {
    features{}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name      # var.resource_group_name changed from hardcode value
    location = var.location             # var.location changed from hardcoded value
}

