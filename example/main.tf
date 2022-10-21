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
  source  = "terraform-cisco-modules/freeform/dcnm"
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
  source  = "terraform-cisco-modules/freeform/dcnm"
  version = "1.0.0"

  content   = each.value.content
  switches  = each.value.switches
}


## Example 3 - Single ACL read from text file ##

module "file-acl" {
  source  = "terraform-cisco-modules/freeform/dcnm"
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
