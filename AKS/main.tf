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

  default_node_pool {
    name       = var.az_kc_default_node_pool_name
    node_count = 1
    vm_size    = "Standard_D2_v2"
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