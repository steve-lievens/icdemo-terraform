#####################################################
# Sysdig instance key
# Copyright 2020 IBM
#####################################################

/***************************************************
NOTE: To source a particular version of IBM terraform provider version, configure the parameter `version`.

terraform {
  required_version = ">=0.13"
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = "0.5.10"
    }

    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.21.0"
    }
  }
}

If we dont configure the version parameter, it fetched latest provider version.
****************************************************/

terraform {
  required_version = ">=0.13"
  required_providers {
    sysdig = {
      source  = "sysdiglabs/sysdig"
      version = "0.5.10"
    }

    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}
