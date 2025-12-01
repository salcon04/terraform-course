variable "common_tags" {
  description = "common tags"
  type        = map(string)
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}