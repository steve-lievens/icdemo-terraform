#####################################################
# logdna as a service
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

* tags = ["T1","T2"]

* default_receiver is set to false by default.
  Set to true to collect platform metrics automatically through this instance in a region.

* API_AUTH is set to the authorization model that is enabled to authenticate with the IBM Cloud Monitoring service when you use Python
  scripts or the REST API. Valid values are: ANY, and IAM_ONLY.

  parameters = {
  "service_supertenant"    = "<service_name>"
  "associated_logging_crn" = "<logdna_crn>"
  "provision_key"          = "<provision_key>"
}

******************************************************/

tags = ["T1", "T2"]
