variable "content" {
  type = string
  description = "Switch CLI content as multiline string"
}

variable "switches" {
  type = map(object({
    name    = string
    fabric  = string
  }))
  description = "Map of switches to configure with freeform CLI policy"
}
