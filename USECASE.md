# terraform-dcnm-freeform
Terraform module for deploying freeform CLi configuration to one or more switches.  This uses the `dcnm_policy` resource to deploy `switch_freeform` type templates. This should not be used for interface-level freeform CLI.  

* Access control lists (ACLs)
* Prefix lists
* Route-maps

*Note:* Please be careful in the use of `switch_freeform` template instances.  These should be used when no other options for freefrom configuration exists.  There are already options in NDFC for freeform configuration at the following locations and these should be used instead if appropriate:

- Fabric (All Leaf role switches, All Spine role switches, All ToR role switches)
- Interfaces (inc. vPC interfaces)
- VRFs (per VRF attachment/switch, not for all switches/attachments)
- VRF-lite Peering/Link Templates (both source & destination switches)
- Networks (per Network attachmen/switch, not for all networks/attachments)

## Usage Examples
The example code belows shows various options for using this module to deploy an ACL across selected switches.  Please see the `example` directory in the GitHub repository for more information on these files.


### main.tf ###
```hcl
terraform {
  required_providers {
    dcnm = {
      source = "CiscoDevNet/dcnm"
    }
  }
}

provider "dcnm" {
  username = var.dcnm_user
  password = var.dcnm_password
  url      = var.dcnm_url
  insecure = true
  platform = "nd" # "dcnm" or "nd"
}

## Example 1 - Single ACL Inline ##

module "test-acl" {
  source = "terraform-cisco-modules/dcnm/freeform"
  version = "1.0.0"

  content = <<-EOT
  ip access-list TF-TEST-ACL
    10 permit ip any any
    20 permit ip 1.1.1.1/32 2.2.2.2/32
  EOT
  switches  = {
    DC1-LEAF-1 = {
      name = "DC1-LEAF-1"
      fabric = "CML2-DC1"
    }
    DC1-LEAF-2 = {
      name = "DC1-LEAF-2"
      fabric = "CML2-DC1"
    }
  }
}

## Example 2 - Multiple ACLs from Input Variable ##

module "acls" {
  for_each = var.acls
  source = "terraform-cisco-modules/dcnm/freeform"
  version = "1.0.0"

  content   = each.value.content
  switches  = each.value.switches
}


## Example 3 - Single ACL read from text file ##

module "file-acl" {
  source = "terraform-cisco-modules/dcnm/freeform"
  version = "1.0.0"

  content = file("example_acl.txt")
  switches  = {
    DC1-LEAF-1 = {
      name = "DC1-LEAF-1"
      fabric = "CML2-DC1"
    }
    DC1-LEAF-2 = {
      name = "DC1-LEAF-2"
      fabric = "CML2-DC1"
    }
  }
}
```

### variables.tf ###
```hcl
### DCNM/NDFC Variables - Provided from TFCB Workspace ###
variable "dcnm_user" {
  type = string
}

variable "dcnm_password" {
  type = string
}

variable "dcnm_url" {
  type = string
}

variable "platform" {
  type = string
}


### ACL Content ###

# Example 2 - Multiple ACLs #
variable "acls" {
  type = map(object({
    content   = string
    switches  = map(object({
      name    = string
      fabric  = string
    }))
  }))
}
```

### acl.auto.tfvars ###
```hcl
### Multiple ACL Input Variable ###

acls = {
  test-acl-1 = {
    content = <<-EOT
    ip access-list TF-MULTI-ACL-1
      10 permit ip any any
      20 permit ip 1.1.1.1/32 2.2.2.2/32
    EOT
    switches = {
      DC1-LEAF-1 = {
        name = "DC1-LEAF-1"
        fabric = "CML2-DC1"
      }
      DC1-LEAF-2 = {
        name = "DC1-LEAF-2"
        fabric = "CML2-DC1"
      }
    }
  }
  test-acl-2 = {
    content = <<-EOT
    ip access-list TF-MULTI-ACL-2
      10 permit ip any any
      20 permit ip 3.3.3.3/32 4.4.4.4/32
    EOT
    switches = {
      DC1-LEAF-1 = {
        name = "DC1-LEAF-1"
        fabric = "CML2-DC1"
      }
      DC1-LEAF-2 = {
        name = "DC1-LEAF-2"
        fabric = "CML2-DC1"
      }
      DC1-ABGW-1 = {
        name = "DC1-ABGW-1"
        fabric = "CML2-DC1"
      }
      DC1-ABGW-2 = {
        name = "DC1-ABGW-2"
        fabric = "CML2-DC1"
      }
    }
  }
}
```

### example.acl.txt ###
```
ip access-list TF-FILE-ACL
  10 permit ip any any
  20 permit ip 5.5.5.5/32 6.6.6.6/32

```
