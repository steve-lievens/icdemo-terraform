#####################################################
# logdna resource Key attach
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logging_instance" {

  source               = "./../../modules/logging-instance"
  provision            = var.provision
  is_sts_instance      = false
  bind_key             = var.bind_key
  name                 = var.name
  resource_group_id    = data.ibm_resource_group.logdna.id
  plan                 = var.plan
  region               = var.region
  service_endpoints    = var.service_endpoints
  enable_platform_logs = var.enable_platform_logs
  tags                 = var.tags
  create_timeout       = var.create_timeout
  update_timeout       = var.update_timeout
  delete_timeout       = var.delete_timeout
  key_name             = var.key_name
  key_tags             = var.key_tags
}