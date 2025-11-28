# Workflow
# Write -> init -> plan -> apply -> destroy
# terraform apply --auto-aprove, se utiliza para una confirmacion automatica
# terraform state refresh, refresca los cambios que pudieron haber hecho directamente desde el portal
# terraform plan -refresh-only, me muestra cambios manuales sin integrarlos al estado

resource "azurerm_resource_group" "rg" {
  name = "silvia-rg-${terraform.workspace}"
  #name     = var.rg_name
  location = "eastus"
  tags     = var.common_tags
  # tags = {
  #   Project    = "Terraform"
  #   Owner      = "Silvia"
  #   Enviroment = "Dev"
  # }
}

