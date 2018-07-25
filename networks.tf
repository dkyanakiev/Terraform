# Configure the Azure Provider

# Create a resource group
resource "azurerm_resource_group" "rg-tccc-poc-rds-sofia-yanakiev" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"

  tags {
    user = "${var.tag}"
  }

  #  subscription_id = "a0646149-4324-4cd8-9285-65529749461c"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "yanakiev-vnet"
  address_space       = "${var.vnet_space}"
  location            = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.location}"
  resource_group_name = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.name}"

  tags {
    user = "${var.tag}"
  }

  depends_on = ["azurerm_network_security_group.yanakiev-scg"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "yanakiev-subnet"
  resource_group_name  = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.subnet_prefix}"
}

resource "azurerm_public_ip" "yanakiev-ip1" {
  name                         = "yanakiev-pip1"
  location                     = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.location}"
  resource_group_name          = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.name}"
  public_ip_address_allocation = "Dynamic"
  idle_timeout_in_minutes      = 30

  tags {
    user = "${var.tag}"
  }
}

resource "azurerm_public_ip" "yanakiev-ip2" {
  name                         = "yanakiev-pip2"
  location                     = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.location}"
  resource_group_name          = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.name}"
  public_ip_address_allocation = "Dynamic"
  idle_timeout_in_minutes      = 30

  tags {
    user = "${var.tag}"
  }
}

resource "azurerm_network_interface" "yanakiev-ni1" {
  name                      = "yanakiev-ni1"
  location                  = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.location}"
  resource_group_name       = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.name}"
  network_security_group_id = "${azurerm_network_security_group.yanakiev-scg.id}"

  ip_configuration {
    name                          = "yanakiev-ip-config1"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.yanakiev-ip1.id}"
  }

  tags {
    user = "${var.tag}"
  }

  depends_on = ["azurerm_network_security_group.yanakiev-scg"]
}

resource "azurerm_network_interface" "yanakiev-ni2" {
  name                      = "yanakiev-ni2"
  location                  = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.location}"
  resource_group_name       = "${azurerm_resource_group.rg-tccc-poc-rds-sofia-yanakiev.name}"
  network_security_group_id = "${azurerm_network_security_group.yanakiev-scg.id}"

  ip_configuration {
    name                          = "yanakiev-ip-config2"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.yanakiev-ip2.id}"
  }

  tags {
    user = "${var.tag}"
  }

  depends_on = ["azurerm_network_security_group.yanakiev-scg"]
}
