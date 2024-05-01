resource "azurerm_linux_virtual_machine" "gs-terra-vm1" {
  name                  = "gs-terra-vm1"
  location              = azurerm_resource_group.gs-terra-rg.location
  resource_group_name   = azurerm_resource_group.gs-terra-rg.name
  network_interface_ids = [azurerm_network_interface.ga-terra-vnic.id]
  size               = "Standard_DS1_v2"
  admin_username = "adminuser"
  admin_password = "Welcome123"
  disable_password_authentication = false

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

    os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Redhat"
    offer     = "RHEL"
    sku       = "84-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app.txt")
  
}
