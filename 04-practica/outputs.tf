
#Grupo de recursos
output "resourse_group_id" {
  description = "ID"
  value       = module.vnet_module_terraform.resourse_group_id
  sensitive   = true
}

output "resourse_group_name" {
  description = "name"
  value       = module.vnet_module_terraform.resourse_group_name
}

output "resourse_group_location" {
  description = "location"
  value       = module.vnet_module_terraform.resourse_group_location
}


#salidas vnet
output "virtual_network_name" {
  description = "vnet name"
  value       = module.vnet_module_terraform.virtual_network_name
}

output "virtual_network_id" {
  description = "vnet id"
  value       = module.vnet_module_terraform.virtual_network_id
  sensitive   = true
}

output "virtual_network_address_space" {
  description = "vnet spaces"
  value       = module.vnet_module_terraform.virtual_network_address_space
}


#salidas subnet
output "subnet1_id" {
  description = "The ID of subnet1"
  value       = azurerm_subnet.subnet1.id
  sensitive   = true
}

output "subnet1_name" {
  description = "The name of subnet1"
  value       = azurerm_subnet.subnet1.name
}

output "subnet1_id_address_prefixes" {
  description = "The address prefixes of subnet1"
  value       = azurerm_subnet.subnet1.address_prefixes
}

# salidas nsg
output "network_security_group_name" {
  description = "vnet name"
  value       = azurerm_network_security_group.terraform_nsg.name
}

#ip
output "public_ip_address" {
  description = "value"
  value       = azurerm_public_ip.terraform_public_ip.ip_address
}

output "public_ip_name" {
  description = "value"
  value       = azurerm_public_ip.terraform_public_ip.name
}

#nic
output "nic_public_ip_id" {
  description = "value"
  value       = azurerm_network_interface.terraform_nic.ip_configuration[0].public_ip_address_id
  sensitive   = true
}

output "nic_name" {
  description = "value"
  value       = azurerm_network_interface.terraform_nic.name
}

#Vm
output "vm_name" {
  description = "name"
  value = azurerm_virtual_machine.main.name
}

output "vm_size" {
  description = "size"
  value = azurerm_virtual_machine.main.vm_size
}