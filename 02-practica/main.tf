provider "azurerm" {
  # Configuration options
  subscription_id = "62cdd463-fc5c-4eb4-9a1a-139e02f0e84e"
  features {}
}


resource "azurerm_resource_group" "rg_terraform" {
  name     = var.rg_name
  location = var.ubicacion
  tags = var.common_tags
#   tags = {
#     propietario      = "Silvia"
#     desplegado_desde = "terraform"
#   }
}

resource "azurerm_virtual_network" "vnet_terraform" {
  name = var.vnet_name
  #   name                = "vnet_Silvia"
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
  address_space       = var.segmento_vnet
  tags = var.common_tags
  #   depends_on = [ azurerm_resource_group.rg_terraform ]
}

resource "azurerm_subnet" "subnet_1_terraform" {
    name = "${var.subnet_prefix}-1"
    resource_group_name = azurerm_resource_group.rg_terraform.name
    virtual_network_name = azurerm_virtual_network.vnet_terraform.name
    address_prefixes = [var.segmento_subnets[0]]

#    address_prefixes     = ["10.0.1.0/24"]
#   name                 = var.subnet_name
#   resource_group_name  = var.rg_name
#   virtual_network_name = var.vnet_name
# depends_on = [ 
#     azurerm_virtual_network.vnet_terraform, 
#     azurerm_resource_group.rg_terraform ]
}

resource "azurerm_subnet" "subnet_2_terraform" {
    name = "${var.subnet_prefix}-2"
    resource_group_name = azurerm_resource_group.rg_terraform.name
    virtual_network_name = azurerm_virtual_network.vnet_terraform.name
    address_prefixes = [var.segmento_subnets[1]]
}

resource "azurerm_network_security_group" "sg_1_terraform" {
  name                = var.securityGroup_name
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name

  security_rule {
    name                       = var.security_rule_nombre
    priority                   = var.security_rule_prioridad
    direction                  = var.security_rule_direccion
    access                     = var.security_rule_accesso
    protocol                   = var.security_rule_protocolo
    source_port_range          = var.list_ports[0]
    destination_port_range     = var.list_ports[0]
    source_address_prefix      = var.list_ports[0]
    destination_address_prefix = var.list_ports[0]
  }

  tags = var.tags_enviroments
}