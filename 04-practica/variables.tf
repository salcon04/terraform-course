variable "location" {
  description = "location"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "terraform-rg-Silvia"
}

variable "vnet_name" {
  description = "Nombre de la Red Virtual"
  type        = string
  default     = "terraform-vnet-Silvia"
}

variable "vnet_address_space" {
  description = "Nombre de la subnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "owner" {
  description = "Nombre de la subnet"
  type        = string
  default     = "Silvia"
}




variable "prefix_name" {
  description = "prefix para recursos"
  type        = string
  default     = "silvia"
}

variable "enviroment" {
  description = "prefix para recursos"
  type        = string
  default     = "qa"
}

variable "allocation_method" {
  description = "value"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "value"
  type        = string
  default     = "Standard"
}


variable "allowed_ssh_cidr"{
  description = "value"
  type = string
  default = "181.188.160.90/32"
}