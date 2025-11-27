variable "resourse_group_name" {
  type = string
  default = "rg-tf-state-silvia"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "container_name" {
  description = "Container name"
  type = string
  default = "tf-state"
}