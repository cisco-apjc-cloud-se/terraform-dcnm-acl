variable "name" {
  type = string
  description = "ACL Name"
}

variable "content" {
  type = string
  description = "ACL content as multiline string"
}

variable "switches" {
  type = map(object({
    name    = string
    fabric  = string
  }))
  description = "map of switches to configure with ACL policy"
}
