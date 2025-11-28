
# variabler for fleksibilitet
variable "location" {
    description     = "Azure region"
    type            = string
    default         = "West Europe"
}

variable "resource_group_name" {
    deccription = "Name of the resource group"
    type        = string
    default     = "rg-demo"
}

variable "vm_size" {
    description = "VM size"
    type        = string
    default     = "Standard_DS1_v2"
}

variable "admin_password" {
    description = "Admin password"
    type        = string
}