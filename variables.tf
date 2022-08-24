variable "acl" {
  type = object({
    name = string
    content = map(string) # 10 permit ....  # string?
    switches = list(string) # names or serial numbers?
  })
}
