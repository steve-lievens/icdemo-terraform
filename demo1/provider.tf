##############################################################################
# IBM Cloud Provider
##############################################################################

terraform {
  required_version = ">=1.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.39.2"
    }
  }
}

provider "ibm" {
  region           = var.region
  ibmcloud_timeout = 180
}

##############################################################################