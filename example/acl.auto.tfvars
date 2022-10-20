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
