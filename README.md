# terraform-dcnm-acl
Terraform module for deploying ACLs to DCNM/NDFC

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
| <a name="input_content"></a> [content](#input\_content) | ACL content as multiline string | `string` | n/a | yes |
| <a name="input_switches"></a> [switches](#input\_switches) | Map of switches to configure with ACL policy | <pre>map(object({<br>    name    = string<br>    fabric  = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_serial_numbers"></a> [serial\_numbers](#output\_serial\_numbers) | n/a |
<!-- END_TF_DOCS -->