#####################################################
# Observability
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "rg" {
  name = var.resource_group
}

module "observability" {

  source = "../../"

  ################# Logging Super Tenant Receiver (STR) instance #######################

  str_provision                 = var.str_provision
  str_logging_bind_key          = var.str_logging_bind_key
  str_logging_plan              = var.str_logging_plan
  str_logging_region            = var.str_logging_region
  str_logging_service_endpoints = var.str_logging_service_endpoints
  str_logging_tags              = var.str_logging_tags
  str_logging_key_name          = var.str_logging_key_name
  str_logging_key_tags          = var.str_logging_key_tags

  ################## Logging Super Tenant Sender (STS) Instance ########################
  //STS
  sts_provision           = var.sts_provision
  sts_service_supertenant = var.sts_service_supertenant
  sts_provision_key       = var.sts_provision_key

  //Logging
  sts_logging_bind_key          = var.sts_logging_bind_key
  sts_logging_plan              = var.sts_logging_plan
  sts_logging_region            = var.sts_logging_region
  sts_logging_service_endpoints = var.sts_logging_service_endpoints
  sts_logging_tags              = var.sts_logging_tags
  sts_logging_key_name          = var.sts_logging_key_name
  sts_logging_key_tags          = var.sts_logging_key_tags

  ################# Activity Tracker ATR instance ##########

  atr_provision = var.atr_provision
  atr_plan      = var.atr_plan
  atr_region    = var.atr_region
  atr_bind_key  = var.atr_bind_key
  atr_key_name  = var.atr_key_name
  atr_key_tags  = var.atr_key_tags
  atr_tags      = var.atr_tags

  ################# Activity Tracker ATS instance ##########

  //ATS
  ats_provision              = var.ats_provision
  ats_service_supertenant    = var.ats_service_supertenant
  ats_provision_key          = var.ats_provision_key
  ats_associated_logging_crn = var.ats_associated_logging_crn
  use_existing_sts_crn       = var.use_existing_sts_crn

  //Activity tracker
  ats_plan     = var.ats_plan
  ats_region   = var.ats_region
  ats_bind_key = var.ats_bind_key
  ats_key_name = var.ats_key_name
  ats_key_tags = var.ats_key_tags
  ats_tags     = var.ats_tags

  ################# Monitoring ############################
  monitoring_provision               = var.monitoring_provision
  monitoring_bind_key                = var.monitoring_bind_key
  monitoring_name                    = var.monitoring_name
  monitoring_plan                    = var.monitoring_plan
  monitoring_region                  = var.monitoring_region
  monitoring_service_endpoints       = var.monitoring_service_endpoints
  monitoring_enable_platform_metrics = var.monitoring_enable_platform_metrics
  monitoring_tags                    = var.monitoring_tags
  monitoring_key_name                = var.monitoring_key_name
  monitoring_key_tags                = var.monitoring_key_tags


  ################ Generic Parameters ######################
  logging_name          = var.logging_name          // common for STS and STR
  activity_tracker_name = var.activity_tracker_name //common for ATS and ATR
  resource_group_id     = data.ibm_resource_group.rg.id
  create_timeout        = var.create_timeout
  update_timeout        = var.update_timeout
  delete_timeout        = var.delete_timeout
}

