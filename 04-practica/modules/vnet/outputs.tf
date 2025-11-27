output "resourse_group_id" {
  description = "rg id"
  value = azurerm_resource_group.terraform_rg.id
  sensitive = true
}

output "resourse_group_location" {
  description = "rg location"
  value = azurerm_resource_group.terraform_rg.location
}

output "resourse_group_name" {
  description = "rg name"
  value = azurerm_resource_group.terraform_rg.name
}

#salidas vnet
output "virtual_network_name" {
  description = "vnet name"
  value = azurerm_virtual_network.terraform_vnet.name
}

output "virtual_network_id" {
  description = "vnet id"
  value = azurerm_virtual_network.terraform_vnet.id
  sensitive = true
}

output "virtual_network_address_space" {
  description = "vnet spaces"
  value = azurerm_virtual_network.terraform_vnet.address_space
}


# #salidas sub
# output "terraform_subnet_name" {
#   description = "name"
#   value = azurerm_subnet.subnet1.name
# }

# output "terraform_subnet_space" {
#   description = "spaces"
#   value = azurerm_subnet.subnet1.address_space
# }

# output "terraform_subnet_location" {
#   description = "id"
#   value = azurerm_subnet.subnet1.id
# }