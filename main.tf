#-------------------------------
# Local Declarations
#-------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#---------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  #ts:skip=AC_AZURE_0389 RSG lock should be skipped for now.
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

resource "azurerm_management_lock" "main" {
  count      = var.create_resource_group ? 1 : 0
  name       = "resource-group-level"
  scope      = azurerm_resource_group.rg[0].id
  lock_level = "CanNotDelete"
  notes      = "This Resource Group Cannot be deleted"
}

#---------------------------------------------------------
# Private Endpoint Creation or selection
#----------------------------------------------------------
resource "azurerm_private_endpoint" "main" {
  name                = format("%s-pe", lower(var.name))
  resource_group_name = local.resource_group_name
  location            = local.location
  subnet_id           = var.subnet_id
  tags                = merge({ "ResourceName" = format("%s-pe", lower(var.name)) }, var.tags, )

  private_service_connection {
    name                           = format("%s-psc", lower(var.name))
    is_manual_connection           = false
    private_connection_resource_id = var.resource_id
    subresource_names              = var.subresource_names
  }

  private_dns_zone_group {
    name                 = var.dns_zone_name
    private_dns_zone_ids = var.dns_zone_ids
  }
}
