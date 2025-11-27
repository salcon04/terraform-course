resource "azurerm_resource_group" "terraform_rm" {
  name     = "silvia-rg"
  location = var.location
}

#consumo desde modules de terraform (3ros)
module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "5.0.1"
  # insert the 2 required variables here
  resource_group_name = azurerm_resource_group.terraform_rm.name
  vnet_location       = var.location
  subnet_names        = ["subnet1", "subnet2"]
  subnet_prefixes     = ["10.0.10.0/24", "10.0.20.0/24"]
  vnet_name           = "silvia-vnet"
}

#https://github.com/Azure/terraform-azurerm-vnet
# module "vnet-github" {
#   source              = "github.com/Azure/terraform-azurerm-vnet"
#   vnet_location       = var.location
#   resource_group_name = azurerm_resource_group.terraform_rm.name

# }

#Comentarios de una linea
//Comentarios de una linea
/*
Bloque de comentarios
*/