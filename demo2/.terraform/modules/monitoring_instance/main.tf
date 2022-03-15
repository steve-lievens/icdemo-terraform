###################################################################
# Logging STR (Super Tenant Receiver) instance
###################################################################

module "logging_str_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-sts-instance"

  count  = var.str_provision ? 1 : 0
  source = "./modules/logging-instance"

  is_sts_instance      = false
  provision            = var.str_provision
  name                 = format("%s-logging-str", var.logging_name)
  bind_key             = var.str_logging_bind_key
  enable_platform_logs = var.enable_platform_logs
  resource_group_id    = var.resource_group_id
  plan                 = var.str_logging_plan
  region               = var.str_logging_region
  service_endpoints    = var.str_logging_service_endpoints
  tags                 = var.str_logging_tags
  key_name             = var.str_logging_key_name
  key_tags             = var.str_logging_key_tags
  create_timeout       = var.create_timeout
  update_timeout       = var.update_timeout
  delete_timeout       = var.delete_timeout
}

###################################################################
# Logging STS (Super Tenant Sender) instance
###################################################################

module "logging_sts_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-sts-instance"

  count     = (var.sts_provision || (var.ats_provision && var.use_existing_sts_crn == false)) ? 1 : 0
  source    = "./modules/logging-instance"
  provision = var.sts_provision

  //STS Specific parameters
  is_sts_instance     = true
  service_supertenant = var.sts_service_supertenant
  provision_key       = var.sts_provision_key

  //Logging instance parameters
  name              = format("%s-logging-sts", var.logging_name)
  bind_key          = var.sts_logging_bind_key
  resource_group_id = var.resource_group_id
  plan              = var.sts_logging_plan
  region            = var.sts_logging_region
  service_endpoints = var.sts_logging_service_endpoints
  tags              = var.sts_logging_tags
  key_name          = var.sts_logging_key_name
  key_tags          = var.sts_logging_key_tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
}

###################################################################
# Activity tracker ATR (Super Tenant Receiver) instance
###################################################################

module "activity-tracker-atr-instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  count = var.atr_provision ? 1 : 0

  source                = "./modules/activity-tracker-instance"
  provision             = var.atr_provision
  is_ats_instance       = false
  name                  = format("%s-monitoring-atr", var.activity_tracker_name)
  plan                  = var.atr_plan
  region                = var.atr_region
  bind_key              = var.atr_bind_key
  make_default_receiver = var.atr_make_default_receiver
  key_name              = var.atr_key_name
  key_tags              = var.atr_key_tags
  resource_group_id     = var.resource_group_id
  tags                  = var.atr_tags
  create_timeout        = var.create_timeout
  update_timeout        = var.update_timeout
  delete_timeout        = var.delete_timeout
}

###################################################################
# Activity tracker ATS (Super Tenant Sender) instance
###################################################################

module "activity-tracker-ats-instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  count = var.ats_provision ? 1 : 0

  source    = "./modules/activity-tracker-instance"
  provision = var.ats_provision

  //ATS specific parameters
  is_ats_instance        = true
  service_supertenant    = var.ats_service_supertenant
  associated_logging_crn = var.use_existing_sts_crn ? var.ats_associated_logging_crn : module.logging_sts_instance[0].id
  provision_key          = var.ats_provision_key

  //Actvity tracker
  name              = format("%s-monitoring-ats", var.activity_tracker_name)
  plan              = var.ats_plan
  region            = var.ats_region
  bind_key          = var.ats_bind_key
  key_name          = var.ats_key_name
  key_tags          = var.ats_key_tags
  resource_group_id = var.resource_group_id
  tags              = var.ats_tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
}

#####################################################
# Monitoring instance
#####################################################

module "monitoring_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/monitoring-sysdig"

  count = var.monitoring_provision ? 1 : 0

  source                  = "./modules/monitoring-sysdig"
  provision               = var.monitoring_provision
  bind_key                = var.monitoring_bind_key
  name                    = format("%s-monitoring", var.monitoring_name)
  resource_group_id       = var.resource_group_id
  plan                    = var.monitoring_plan
  region                  = var.monitoring_region
  service_endpoints       = var.monitoring_service_endpoints
  enable_platform_metrics = var.monitoring_enable_platform_metrics
  tags                    = var.monitoring_tags
  key_name                = var.monitoring_key_name
  key_tags                = var.monitoring_key_tags
  create_timeout          = var.create_timeout
  update_timeout          = var.update_timeout
  delete_timeout          = var.delete_timeout
}

