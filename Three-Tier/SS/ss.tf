# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_linux_virtual_machine_scale_set" "terraform-ss" {
  name                = "terraform-ss"
  resource_group_name = "terraform-resources"
  location            = "westus"
  sku                 = "Standard_D2_v3"
  instances           = 1
  admin_username      = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "terraform"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.terraform_remote_state.main.outputs.subnet_id
        }
  }
}
  


resource "azurerm_traffic_manager_profile" "tm-profile" {
  name                = "tm-profile"
  resource_group_name = "terraform-resources"
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "tm-profile"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  resource "traffic_manager_azure_endpoint" "terraform" {
    target_resource_id = data.terraform_remote_state.outputs.recource_id
    name = "terraform_endpoint"
    profile_id = azurerm_traffic_manager_profile.tm-profile.id
    weight = 100
  }
}