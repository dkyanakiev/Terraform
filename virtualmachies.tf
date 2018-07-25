resource "azurerm_virtual_machine" "yanakiev-vm1" {
  name                  = "zltdimitar001"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.yanakiev-ni1.id}"]
  vm_size               = "Standard_D2_v3"

  storage_os_disk {
    name              = "zltdimitar001disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "7.3"
    version   = "latest"
  }

  os_profile {
    computer_name  = "zltdimitar001"
    admin_username = "${var.vm_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.vm_username}/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBqSBtoy1sJ+RhftrH+HWu4hrQ3PW5Sf8G1CtwS8fxVNNCYasDVi5bCRMSNNzPj87vNID+lJ4AqV7mvzybR7/TdJjrOHvTns1H6hxEs72AfP1gY68iVBR2eWZz+5ec42FDQoEDSGWFZfc6sJ3/d8n5k7isoSQYhfz4RjFpTpQj8zw== rsa-key-20180516"
    }
  }

  tags {
    user = "${var.tag}"
  }
}

resource "azurerm_virtual_machine" "yanakiev-vm2" {
  name                  = "zltdimitar002"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.yanakiev-ni2.id}"]
  vm_size               = "Standard_D2_v3"

  storage_os_disk {
    name              = "zltdimitar002disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "7.3"
    version   = "latest"
  }

  os_profile {
    computer_name  = "zltdimitar002"
    admin_username = "${var.vm_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.vm_username}/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBqSBtoy1sJ+RhftrH+HWu4hrQ3PW5Sf8G1CtwS8fxVNNCYasDVi5bCRMSNNzPj87vNID+lJ4AqV7mvzybR7/TdJjrOHvTns1H6hxEs72AfP1gY68iVBR2eWZz+5ec42FDQoEDSGWFZfc6sJ3/d8n5k7isoSQYhfz4RjFpTpQj8zw== rsa-key-20180516"
    }
  }

  tags {
    user = "${var.tag}"
  }
}
