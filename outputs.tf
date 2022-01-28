output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
}

output "resource_group_id" {
  description = "The id of the resource group in which resources are created"
  value       = element(coalescelist(data.azurerm_resource_group.rgrp.*.id, azurerm_resource_group.rg.*.id, [""]), 0)
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

output "private_endpoint_id" {
  description = "The id of the private endpoint"
  value       = azurerm_private_endpoint.main.id
}

output "private_endpoint_nic" {
  description = "The nic connected to the private endpoint"
  value       = azurerm_private_endpoint.main.network_interface
}

output "private_dns_zone_group" {
  description = "The ID of the Private DNS Zone Group."
  value       = azurerm_private_endpoint.main.private_dns_zone_group.*.id
}

output "custom_dns_configs" {
  description = "The custom DNS configurations."
  value       = azurerm_private_endpoint.main.custom_dns_configs
}

output "private_dns_zone_configs" {
  description = "The Private DNS Zone Configs"
  value       = azurerm_private_endpoint.main.private_dns_zone_configs
}

output "private_service_connection_ip" {
  description = "(Computed) The private IP address associated with the private endpoint, note that you will have a private IP address assigned to the private endpoint even if the connection request was Rejected"
  value       = azurerm_private_endpoint.main.private_service_connection.*.private_ip_address
}
