## Build Switch Freeform Policy ##

resource "dcnm_policy" "freeform" {
  serial_number   =   var.serial_number
  template_name   =   "switch_freeform"
  template_props  =   {
                          "CONF" : var.content ## Multi-line string
                      }
  priority        =   var.priority
  source          =   null # ""
  entity_name     =   "SWITCH"
  entity_type     =   "SWITCH"
  description     =   "Freeform policy to deploy ACL to target switch from Terraform"
  template_content_type   =   "TEMPLATE_CLI"
}
