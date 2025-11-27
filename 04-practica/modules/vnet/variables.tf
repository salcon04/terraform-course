variable "location" {
  description = "Ubicacion del grupo de recursos"
  type        = string
  #default     = "terraform-rg-Silvia"
}

# variable "resource_group_name" {
#   description = "Nombre de mis recursos"
#   type        = string
#   #default     = "East US"
# }

# variable "vnet_name" {
#   description = "Nombre de la Red Virtual"
#   type        = string
#   #default     = "terraform-vnet-Silvia"
# }

variable "prefix_name" {
  description = "prefix para recursos"
  type = string
}



variable "vnet_address_space" {
  description = "Nombre de la subnet"
  type        = list(string)
  #default     = ["10.0.1.0/16"]
}

variable "enviroment" {
  description = "env"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "nombre de proyecto"
  type        = string
  default     = "terraform-project"
}

# variable "owner" {
#   description = "owner del proyecto"
#   type        = string
#   #default     = "Silvia"
# }

# variable "subnet_name" {
#   description = "subnet1"
#   type        = string
#   #default     = "terraform-vnet-Silvia"
# }

