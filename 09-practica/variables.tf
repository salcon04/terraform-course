variable "rg_name" {
  type    = string
  default = "silvia-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "common_tags" {
  description = "common tags"
  type = map(string)
}