
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.15.00"
    }
  }
  backend "azurerm" {
    resource_group_name = var.bkstrgrg
    storage_account_name = var.bkstrg
    container_name = var.bkcontainer
    key = var.bkstrgkey
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az_rg" {
  name     = var.az_rg_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "az_kc" {
  name                = var.az_kc_name
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name
  dns_prefix          = "exampleaks1"

  

  agent_pool_profile {
    name       = var.az_kc_default_node_pool_name
    count      = 2
    vm_size    = "Standard_D4s_v3"
    os_type    = "Linux"
    vm_set_type = "VirtualMachines"
  }
  
  identity {
    type = var.az_kc_identity_type
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.az_kc.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.az_kc.kube_config_raw
  sensitive = true
}