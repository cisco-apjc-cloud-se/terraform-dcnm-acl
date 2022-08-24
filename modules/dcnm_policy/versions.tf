terraform {
  required_providers {
    dcnm = {
      source = "CiscoDevNet/dcnm"
      version = "1.2.3"
    }
  }
  experiments = [module_variable_optional_attrs]
}
