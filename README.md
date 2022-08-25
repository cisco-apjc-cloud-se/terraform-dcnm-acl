# terraform-dcnm-freeform
Terraform module for deploying freeform CLi configuration to one or more switches.  This uses the `dcnm_policy` resource to deploy `switch_freeform` type templates. This should not be used for interface-level freeform CLI.  

* Access control lists (ACLs)
* Prefix lists
* Route-maps

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dcnm"></a> [dcnm](#requirement\_dcnm) | 1.2.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dcnm"></a> [dcnm](#provider\_dcnm) | 1.2.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_freeform"></a> [freeform](#module\_freeform) | ./modules/dcnm_policy | n/a |

## Resources

| Name | Type |
|------|------|
| [dcnm_inventory.switches](https://registry.terraform.io/providers/CiscoDevNet/dcnm/1.2.3/docs/data-sources/inventory) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content"></a> [content](#input\_content) | Switch CLI content as multiline string | `string` | n/a | yes |
| <a name="input_switches"></a> [switches](#input\_switches) | Map of switches to configure with freeform CLI policy | <pre>map(object({<br>    name    = string<br>    fabric  = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_serial_numbers"></a> [serial\_numbers](#output\_serial\_numbers) | n/a |
<!-- END_TF_DOCS -->
