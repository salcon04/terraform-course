# WorkSpaces

# terraform workspace list, lista los workspaces
# terraform workspace show, muestra el actual donde me encuentro
# terraform workspace show NombreWorkSpace, lista uno especifico
# terraform workspace new NombreWorkSpace, crea un nuevo workspace
# terraform workspace select NombreWorkSpace, redirige al workspace seleccionado
# terraform workspace rename Primernombre NuevoNombreWorkSpace, (NO SIRVE)
# terraform workspace delete NombreWorkSpace, borra un workspace

resource "azurerm_resource_group" "rg" {
  name     = "silvia-rg-${terraform.workspace}"
  #name     = var.rg_name-terraform.workspace
  location = var.location
}