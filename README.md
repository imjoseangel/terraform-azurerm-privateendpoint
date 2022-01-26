# terraform-azurerm-privateendpoint

[![Terraform](https://github.com/imjoseangel/terraform-azurerm-privateendpoint/actions/workflows/terraform.yml/badge.svg)](https://github.com/imjoseangel/terraform-azurerm-privateendpoint/actions/workflows/terraform.yml)

## Deploys a Azure Private Endpoint in a given subnet for a given component

This Terraform module deploys a Private Endpoint on Azure.

### NOTES

* Name Convention specified as `sa<string><randomstring>. <randomstring>` is calculated with `random_string` resource.

## Usage in Terraform 1.0

```terraform
module "privateendpoint" {
  source = "github.com/imjoseangel/terraform-azurerm-privateendpoint"
}
```

## Authors

Originally created by [imjoseangel](http://github.com/imjoseangel)

## License

[MIT](LICENSE)
