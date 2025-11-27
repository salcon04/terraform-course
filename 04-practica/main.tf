module "vnet_module_terraform" {
  source = "./modules/vnet"
  #requeridos
  location           = var.location
  vnet_address_space = var.vnet_address_space
  prefix_name        = "Silvia"
  #Opcionales
  project_name = "tf-project"
  enviroment   = "qa"
}


# module "vnet_module_terraform" {
#   source = "./modules/vnet"
#   #requeridos
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   vnet_name           = var.vnet_name
#   vnet_address_space  = var.vnet_address_space
#   owner               = var.owner
#   #Opcionales
#   project_name = "tf-project"
#   enviroment   = "qa"
# }




#Opcion1
# data "azurerm_virtual_network" "vnet_data" {
#   name                = "terraform-vnet-Silvia"
#   resource_group_name = "terraform-rg-Silvia"
#   # depends_on = [ module.vnet_module_terraform ]
# }

# resource "azurerm_subnet" "subnet1" {
#   name                 = "subnet1"
#   resource_group_name  = data.azurerm_virtual_network.vnet_data.resource_group_name
#   virtual_network_name = data.azurerm_virtual_network.vnet_data.name
#   address_prefixes     = ["10.0.1.0/24"]
# }
#Opcion1

#Opcion 2
# resource "azurerm_subnet" "subnet1" {
#   name                 = "subnet1"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.vnet_name
#   address_prefixes     = ["10.0.1.0/24"]
#   depends_on = [ module.vnet_module_terraform ]
# }
#Opcion 2

#Opcion 3
resource "azurerm_subnet" "subnet1" {
  name                 = "${var.prefix_name}-${var.enviroment}-subnet1" #"subnet1"
  resource_group_name  = module.vnet_module_terraform.resourse_group_name
  virtual_network_name = module.vnet_module_terraform.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
}
#Opcion 3


resource "azurerm_network_security_group" "terraform_nsg" {
  name                = "${var.prefix_name}-${var.enviroment}-nsg"
  location            = var.location
  resource_group_name = module.vnet_module_terraform.resourse_group_name

  # tags = {
  #   environment = "Production"
  # }
}

resource "azurerm_network_security_rule" "terraform_nsg_rule_ssh_inbound_1" {
  name                        = "allow-ssh-inbound1"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.allowed_ssh_cidr
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resourse_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}

##80,443

resource "azurerm_network_security_rule" "terraform_nsg_rule_ssh_inbound_2" {
  name                        = "allow-ssh-inbound2"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = var.allowed_ssh_cidr
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resourse_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}

resource "azurerm_network_security_rule" "terraform_nsg_rule_ssh_inbound_3" {
  name                        = "allow-ssh-inbound3"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.allowed_ssh_cidr
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resourse_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}


resource "azurerm_public_ip" "terraform_public_ip" {
  name                = "${var.prefix_name}-${var.enviroment}-public-ip"
  resource_group_name = module.vnet_module_terraform.resourse_group_name
  location            = var.location
  sku                 = "Standard"
  allocation_method   = "Static"

  # tags = {
  #   environment = "Production"
  # }
}


resource "azurerm_network_interface" "terraform_nic" {
  name                = "${var.prefix_name}-${var.enviroment}-nic"
  location            = var.location
  resource_group_name = module.vnet_module_terraform.resourse_group_name

  ip_configuration {
    name                          = "${var.prefix_name}-${var.enviroment}-nic-ip"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_public_ip.id
  }
}


#asociation
resource "azurerm_network_interface_security_group_association" "terraform_sg_association" {
  network_interface_id      = azurerm_network_interface.terraform_nic.id
  network_security_group_id = azurerm_network_security_group.terraform_nsg.id
}

#Virtual machine
resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix_name}-${var.enviroment}-vm"
  location              = var.location
  resource_group_name   = module.vnet_module_terraform.resourse_group_name
  network_interface_ids = [azurerm_network_interface.terraform_nic.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix_name}-${var.enviroment}-myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "salcon"
    admin_password = "PasswordSalcon1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  # tags = {
  #   environment = "staging"
  # }
}