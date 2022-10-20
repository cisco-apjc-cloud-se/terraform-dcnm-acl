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
