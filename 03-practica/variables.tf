variable "rg_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "rg_terraform_Silvia"
}

variable "rg_location" {
  description = "Lugar o zona donde se despliega la infraestructura"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Entorno o ambiente"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "TFCourse"
}

variable "vnet_name_data" {
  description = "Nombre de la subnet"
  type        = string
  default     = "vnet_Silvia"
}

variable "subnet_name_data" {
  description = "Nombre de la subnet"
  type        = string
  default     = "subnet-1"
}