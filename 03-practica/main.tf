resource "azurerm_resource_group" "rg_terraform" {
  name     = "${local.prefix}-rg"
  location = var.rg_location
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "vnet_terraform" {
  name                = "${local.prefix}-vnet"
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
  address_space       = ["10.0.0.0/16"]
}

data "azurerm_resource_group" "data_rg_terraform" {
  name = "Recursos_Silvia"
}

resource "azurerm_virtual_network" "vnet_terraform_two" {
  name                = "${local.prefix}-vnet"
  location            = data.azurerm_resource_group.data_rg_terraform.location
  resource_group_name = data.azurerm_resource_group.data_rg_terraform.name
  address_space       = ["10.1.0.0/16"]
}

# output "id" {
#   #value = data.azurerm_resource_group.data_rg_terraform.id
#   value = data.azurerm_resource_group.data_rg_terraform.name
# }


data "azurerm_virtual_network" "data_vnet_1_terraform" {
  name                = "vnet_Silvia"
  resource_group_name = "Recursos_Silvia"
  #   name                = var.vnet_name_data
  #  resource_group_name = data.azurerm_resource_group.data_rg_terraform.name
}

resource "azurerm_subnet" "data_subnet_1_terraform" {
  name                 = "${local.prefix}-subnet"
  virtual_network_name = data.azurerm_virtual_network.data_vnet_1_terraform.name
  resource_group_name  = data.azurerm_virtual_network.data_vnet_1_terraform.resource_group_name
  address_prefixes     = ["10.0.3.0/24"]
}

# output "virtual_network_id" {
#   value = data.azurerm_virtual_network.example.id
# }