variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  type        = string
  default     = "rg-demo-westeurope-01"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
  default     = "westeurope"
}

variable "name" {
  description = "The name of the azure storage account"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the Private Endpoint will be created."
  type        = string
  default     = null
}

variable "resource_id" {
  description = "The ID of the resource that the new Private Endpoint will be assigned to."
  type        = string
  default     = null
}

variable "subresource_names" {
  description = "The name of the subresource that the new Private Endpoint will be assigned to."
  type        = list(string)
  default     = null
}

variable "dns_zone_name" {
  description = "The name of the privatelink DNS zone to register the Private Endpoint resource type."
  type        = string
  default     = "privatelink.azure.com"
}

variable "dns_zone_ids" {
  description = "The name and ID of the privatelink DNS zone in Azure to register the Private Endpoint resource type."
  type        = list(string)
  default     = ["privatelink.azure.com"]
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
