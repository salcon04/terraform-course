# Comandos utilies
# terraform state list, lista todos los recursos del proyecto
# terraform state show name1.name2, detalle de un recurso especifico
# terrafrom taint tiporecurso.nombrerecurso local, recrea/recontruye un recurso
# terrafrom untaint tiporecurso.nombrerecurso local, desmarca para la recreacion/recontruccion un recurso
# terrafrom plan -replace="tiporecurso.NombreRecursoLocal"
# terrafrom apply -replace="tiporecurso.NombreRecursoLocal"


resource "azurerm_resource_group" "rg_terraform" {
  name     = var.rg_name
  location = var.location
}

# terraform import
resource "azurerm_virtual_network" "manual-vnet" {
  name = "silvia-vnet"
  location = "eastus"
  resource_group_name = azurerm_resource_group.rg_terraform.name
  address_space = [ "10.0.0.0/16" ]
  tags = {
    Owner = "Silvia"
  }
}

