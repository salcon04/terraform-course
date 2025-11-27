locals {
  common_tags = {
    project_name = var.project_name
    environment  = var.environment
    owner        = "Silvia"
    manage_by    = "Terraform"
  }
  prefix = "${var.project_name}-${var.environment}-${local.common_tags.owner}"
  #   nombre = "Nombre"
  #   apellido = "Apellido"
  #   nombre_completo = "${local.nombre}-${local.apellido}"
}