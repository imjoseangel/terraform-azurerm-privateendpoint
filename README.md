# terraform-azurerm-privateendpoint

[![Terraform](https://github.com/imjoseangel/terraform-azurerm-privateendpoint/actions/workflows/terraform.yml/badge.svg)](https://github.com/imjoseangel/terraform-azurerm-privateendpoint/actions/workflows/terraform.yml)

## Deploys a Azure Private Endpoint in a given subnet for a given component

This Terraform module deploys a Private Endpoint on Azure.

### NOTES

* Name Convention specified as `sa<string><randomstring>. <randomstring>` is calculated with `random_string` resource.

## Usage in Terraform 1.0

```terraform
data "azurerm_resource_group" "main" {
  name = "network-rsg"
}

data "azurerm_virtual_network" "main" {
  name                = "global-vnet"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "azurerm_subnet" "main" {
  name                 = "privateendpoint-snet"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = data.azurerm_virtual_network.main.name
}

resource "azurerm_private_dns_zone" "main" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = "storage-rg"
}

module "privateendpoint" {
  source              = "github.com/imjoseangel/terraform-azurerm-privateendpoint"
  name                = "mystorage"
  resource_group_name = "storage-rg"
  location            = "westeurope"
  subnet_id           = data.azurerm_subnet.main.id
  resource_id         = azurerm_storage_account.main.id
  subresource_names   = ["blob", "file"]
}
```

## Authors

Originally created by [imjoseangel](http://github.com/imjoseangel)

## License

[MIT](LICENSE)
