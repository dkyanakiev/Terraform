provider "azurerm" {
  subscription_id = "${var.subscription_id}"
}

variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "resource_group_name" {
  description = "Enter resource_group_name to create and use"
}

variable "location" {
  description = "Enter location for the resources"
}

variable "tag" {
  description = "Enter tag that will be used"
}

variable "vnet_space" {
  default     = []
  description = "Enter vnet space to use for the vnets"
}

variable "subnet_prefix" {
  description = "Subnet prefix that will be used"
}

variable "vm_username" {
  description = "Username for the VMs that will be created"
}

variable "vm_ssh_key" {
  description = "Location of the ssh key to be used fo login"
}
