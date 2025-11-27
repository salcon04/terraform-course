
variable "rg_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "Recursos_Silvia"
}

variable "ubicacion" {
  description = "Ubicacion de mis recursos"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Nombre de la Red Virtual"
  type        = string
  default     = "vnet_Silvia"
}

variable "subnet_prefix" {
  description = "Nombre de la subnet"
  type        = string
  default     = "subnet"
}



# variable "subnet_uno" {
#   description = "Nombre de la subnet uno"
#   type        = string
#   default     = "subnet-1"
# }

# variable "subnet_dos" {
#   description = "Nombre de la subnet dos"
#   type        = string
#   default     = "subnet-2"
# }

variable "segmento_vnet" {
  description = "Segmento principal de la vnet"
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "segmento_subnets" {
  description = "Segmento de las diferentes subnets"
  type = list(string)
  default = ["10.0.0.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "common_tags" {
  description = "Esto es un mapa de valores de cadenas"
  type = map(string)
  default = {
    propietario = "Silvia"
    desplegado_desde = "terraform"
  }
}

variable "tags_enviroments" {
  description = "Esto es un mapa de valores de cadenas"
  type = map(string)
  default = {
    environment = "Laboratorio"
  }
}

variable "numeros" {
  description = "var de numeros"
  type = number
  default = 42
}

variable "booleano" {
  description = "Var de tipo Boleano"
  type = bool
  default = true
}

variable "lista_numeros" {
  description = "var de lista de numeros"
  type = list(number)
  default = [4,6,8,20,40]
}

variable "objeto" {
  description = "Variable de objetos"
  type = object({
    nombre = string
    edad = number
    casado = bool
    idioma = list(string)
    contacto_de_confianza = map(string)
  })
  default = {
    nombre = "Pedro"
    edad = 42
    casado = false
    idioma = [ "español","ingles","frances" ]
    contacto_de_confianza = {
      Esposa = "77778888"
      Hijo = "66668888"
    }
  }
}




variable "tupla" {
  description = "Variable de tipo tupla"
  type = tuple([ string, number, bool ])
  default = [ "cadena", 11, true ]
}

variable "securityGroup_name" {
  description = "Nombre del grupp de seguridad"
  type        = string
  default     = "GrupoSeguridad1"
}


variable "security_rule_nombre" {
  description = "Nombre del rol de seguridad"
  type = string
  default = "Rol1"
}

variable "security_rule_prioridad" {
  description = "Prioridad del rol de seguridad"
  type = number
  default = 100
}

variable "security_rule_direccion" {
  description = "Direccion del grupo de seguridad"
  type = string
  default = "Inbound"
}

variable "security_rule_accesso" {
  description = "Acceso del grupo de seguridad"
  type = string
  default = "Allow"
}

variable "security_rule_protocolo" {
  description = "Acceso del grupo de seguridad"
  type = string
  default = "Tcp"
}

variable "list_ports" {
  description = "Lista de puertos"
  type = list(string)
  default = ["*"]
}


