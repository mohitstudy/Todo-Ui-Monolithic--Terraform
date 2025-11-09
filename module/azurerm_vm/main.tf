resource "azurerm_network_interface" "nic" {
  for_each = var.vms

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations
    content {
      name                          = ip_configuration.value.name
      subnet_id                     = data.azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.vms
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_assoc" {
  for_each                  = var.vms
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_virtual_machine" "vmveer" {
  for_each = var.vms

  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  vm_size               = each.value.vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  
  storage_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }

  storage_os_disk {
    name              = "${each.value.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.value.vm_name
    admin_username = data.azurerm_key_vault_secret.username[each.key].value
    admin_password = data.azurerm_key_vault_secret.password[each.key].value
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}



