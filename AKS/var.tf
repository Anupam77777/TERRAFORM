variable "location" {
  type    = string
  default = "East US"
}

variable "az_rg_name" {
  type    = string
  default = "example-resources"
}

variable "az_kc_name" {
  type    = string
  default = "example-aks1"
}

variable "az_kc_default_node_pool_name" {
  type    = string
  default = "default"
}

variable "az_kc_identity_type" {
  type    = string
  default = "SystemAssigned"
}