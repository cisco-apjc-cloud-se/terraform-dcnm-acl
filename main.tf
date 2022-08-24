## Read Switch Inventory ##
data "dcnm_inventory" "switches" {
  for_each = var.switches

  fabric_name = each.value.fabric
  switch_name = each.value.name
}

## Build Local Dictionaries
# - serial_numbers: Switch Name -> Serial Number

locals {
  ## Name to Serial Number Lookup ##
  serial_numbers = {
      for switch in data.dcnm_inventory.switches :
          switch.switch_name => switch.serial_number
  }
  ## Serial Number to Content Map ##
  sn_content_map = {
    for switch in var.acl.switches :
      lookup(local.serial_numbers, switch) => var.acl.content
  }

}

output "serial_numbers" {
  value = local.serial_numbers
}


### DCNM Policy Module ###
module "freeform" {
  for_each = local.sn_content_map
  source = "./modules/dcnm_policy"

  serial_number = each.key
  content       = each.value
}
