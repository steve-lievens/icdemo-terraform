#####################################################
# activity tracker as a service
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

###################################################################
# Activity tracket ATS instance
###################################################################

module "activity_tracker_instance" {

  source                = "./../../modules/activity-tracker-instance"
  provision             = var.provision
  is_ats_instance       = false
  name                  = var.name
  plan                  = var.plan
  region                = var.region
  bind_key              = var.bind_key
  key_name              = var.key_name
  key_tags              = var.key_tags
  resource_group_id     = data.ibm_resource_group.res_group.id
  tags                  = var.tags
  make_default_receiver = var.make_default_receiver
  create_timeout        = var.create_timeout
  update_timeout        = var.update_timeout
  delete_timeout        = var.delete_timeout
}

