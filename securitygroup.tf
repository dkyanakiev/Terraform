resource "azurerm_network_security_group" "yanakiev-scg" {
  name                = "yanakiev-NSG"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    user = "${var.tag}"
  }

  depends_on = ["azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev"]
}
