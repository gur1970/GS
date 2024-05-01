resource "azurerm_virtual_network" "gs-terra-vnet" {
  name                = "gs-terra-vnet"
  resource_group_name = azurerm_resource_group.gs-terra-rg.name
  location            = azurerm_resource_group.gs-terra-rg.location
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "gs-terra-subnet" {
  name                 = "gs-terra-subnet"
  resource_group_name  = azurerm_resource_group.gs-terra-rg.name
  virtual_network_name = azurerm_virtual_network.gs-terra-vnet.name
  address_prefixes     = ["10.0.1.0/24"]

}
resource "azurerm_public_ip" "gs-terra-pubip" {
  name                = "gs-terra-pubip"
  resource_group_name = azurerm_resource_group.gs-terra-rg.name
  location            = azurerm_resource_group.gs-terra-rg.location
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "ga-terra-vnic" {
  name                = "gs-terra-vnic"
  location            = azurerm_resource_group.gs-terra-rg.location
  resource_group_name = azurerm_resource_group.gs-terra-rg.name
  ip_configuration {
    name                          = "gs-terra-pubip"
    subnet_id                     = azurerm_subnet.gs-terra-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.gs-terra-pubip.id
  }


}