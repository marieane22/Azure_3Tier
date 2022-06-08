provider "azurerm" {
  features {}
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}


data "terraform_remote_state" "main" {
  backend = "azurerm"
  config = {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "team2project"
    container_name       = "tfstate"
    key                  = "path/to/my/key/prod.terraform.tfstate"
    access_key           = "0GCZCi57ChyFgG7WEFixbUBWpx72dUefChftkqSS9fhcUB1WhlvTed09zSrePjRB1lsj4aX7KdDX+ASt65cvTw=="
  }
}

terraform  {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "team2project"
    container_name       = "tfstate"
    key                  = "path/to/my/db/prod.terraform.tfstate"
    access_key = "0GCZCi57ChyFgG7WEFixbUBWpx72dUefChftkqSS9fhcUB1WhlvTed09zSrePjRB1lsj4aX7KdDX+ASt65cvTw=="
  }
}


resource "azurerm_mysql_server" "project" {
  name                = "project-mysqlserver"
  location            = "westus"
  resource_group_name = data.terraform_remote_state.main.outputs.resource_group_name

  administrator_login          = "mysqladmin"  
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                = true
  backup_retention_days            = 7
  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_mysql_database" "project" {
  name                = "projectdb"
  resource_group_name = data.terraform_remote_state.main.outputs.resource_group_name
  server_name         = azurerm_mysql_server.project.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

output "fqdn" {
  value = azurerm_mysql_server.project.fqdn
}

output "recource_id" {
  value = azurerm_mysql_database.project.id
}