variable "content" {
  type = string
  description = "ACL content as multiline string"
}

variable "switches" {
  type = map(object({
    name    = string
    fabric  = string
  }))
  description = "Map of switches to configure with ACL policy"
}
