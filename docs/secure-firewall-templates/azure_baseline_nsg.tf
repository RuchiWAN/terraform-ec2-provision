variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

resource "azurerm_network_security_group" "baseline_nsg" {
  name                = "baseline-nsg"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "YOUR_TRUSTED_IP/32"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.baseline_nsg.name
}

resource "azurerm_network_security_rule" "http" {
  name                        = "Allow-HTTP"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.baseline_nsg.name
}

resource "azurerm_network_security_rule" "egress_all" {
  name                        = "Allow-All-Egress"
  priority                    = 1000
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.baseline_nsg.name
}