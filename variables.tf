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
