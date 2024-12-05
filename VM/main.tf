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
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_network_interface" "main" {
  for_each = var.vms
  name                = "${var.prefix}-nic-${each.value.name}"
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name

  ip_configuration {
    name                          = "ipconfig-${each.value.name}"
    subnet_id                     = data.azurerm_subnet.example_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  for_each = var.vms

  name                  = "${var.prefix}-${each.value.name}"
  location              = azurerm_resource_group.az_rg.location
  resource_group_name   = azurerm_resource_group.az_rg.name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  vm_size               = each.value.sku

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-${each.value.name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.value.name
    admin_username = "testadmin"
    admin_password = "P@ssw0rd1234!"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_updates  = true
    time_zone                 = "Pacific Standard Time"
  }

  tags = {
    environment = "staging"
  }
}

data "azurerm_virtual_network" "example_vnet" {
  name                = var.existing_virtual_network_name
  resource_group_name = var.existing_resource_group_name
}

data "azurerm_subnet" "example_subnet" {
  name                 = var.existing_subnet_name
  virtual_network_name = data.azurerm_virtual_network.example_vnet.name
  resource_group_name  = var.existing_resource_group_name
}