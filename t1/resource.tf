# Create a resource group
resource "azurerm_resource_group" "gs-terra-rg" {
  name     = "gs-terra-rg"
  location = "eastus"
}