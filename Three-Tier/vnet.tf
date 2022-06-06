resource "azurerm_virtual_network" "vnet" {
  name                = "virtual-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

#Subnet
resource "azurerm_subnet" "private1" {
  name                 = "private1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.0.1.0/24"
}
resource "azurerm_subnet" "private22" {
  name                 = "private2"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "private3" {
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = "private3"
  address_prefix       = "10.0.3.0/24"
}
