variable "bkstrgrg" {
  type        = string
  description = "The name of the backend storage account resource group"
  default     = "MYFIRSTRG"
}

variable "bkstrg" {
  type        = string
  description = "The name of the backend storage account"
  default     = "backendstorageterra"
}

variable "bkcontainer" {
  type = string
  description = "The container name for the backend config"
  default = "terraformstate"
}

variable "bkstrgkey" {
  type = string
  description = "The access key for the storage account"
  default = "terraform.tfstate"
}

variable "resourcegroup_name" {
  type        = string
  description = "The name of the resource group"
  default     = "vnetrg"
}

variable "location" {
  type        = string
  description = "The region for the deployment"
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "Tags used for the deployment"
  default = {
    "Environment" = "Lab"
    "Owner"       = "Anupam"
  }
}

variable "vnet_name" {
  type        = string
  description = "The name of the vnet"
  default     = "Myfirstvnet"
}

variable "vnet_address_space" {
  type        = list(any)
  description = "the address space of the VNet"
  default     = ["10.211.0.0/16"]
}

variable "subnets" {
  type = map(any)
  default = {
    subnet_1 = {
      name             = "subnet_1"
      address_prefixes = ["10.211.1.0/24"]
    }
    subnet_2 = {
      name             = "subnet_2"
      address_prefixes = ["10.211.2.0/24"]
    }
    subnet_3 = {
      name             = "subnet_3"
      address_prefixes = ["10.211.3.0/24"]
    }
    # The name must be AzureBastionSubnet
  }
}

