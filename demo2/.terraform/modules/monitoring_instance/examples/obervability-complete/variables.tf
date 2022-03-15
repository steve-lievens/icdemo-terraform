variable "logging_name" {
  description = "Logging Enter the instance name "
  type        = string
  validation {
    error_message = "Logging instance name must begin and end with a letter and contain only letters, numbers, and - characters."
    condition     = can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$", var.logging_name))
  }
}

variable "activity_tracker_name" {
  description = "activity tracker Enter the instance name "
  type        = string
  validation {
    error_message = "Activity tracker instance name must begin and end with a letter and contain only letters, numbers, and - characters."
    condition     = can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$", var.activity_tracker_name))
  }
}

variable "monitoring_name" {
  description = "monitoring Enter the instance name "
  type        = string
  validation {
    error_message = "Activity tracker instance name must begin and end with a letter and contain only letters, numbers, and - characters."
    condition     = can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$", var.monitoring_name))
  }
}

#####################################################
# Set up a Logging Super Tenant Receiver (STR) instance
# Copyright 2020 IBM
#####################################################

variable "str_provision" {
  type        = bool
  description = "Logging STR: Disable this, not to provision logging STR instance"
  default     = true
}

variable "str_logging_bind_key" {
  description = "Logging STR: Enable this flag to attach a key to STR instance."
  type        = bool
  default     = false
}

variable "str_logging_plan" {
  description = "Logging STR: plan type (14-day, 30-day, 7-day, hipaa-30-day and lite)"
  type        = string
  default     = "7-day"
  validation {
    error_message = "Plan type should be one of the following (14-day, 30-day, 7-day, hipaa-30-day and lite)."
    condition = can(
      contains([
        "14-day",
        "30-day",
        "7-day",
        "hipaa-30-day",
        "lite"
      ], var.str_logging_plan)
    )
  }
}

variable "str_logging_region" {
  description = "Logging STR: Provisioning Region"
  type        = string
  default     = "us-south"
}

variable "str_logging_service_endpoints" {
  description = "Logging STR: Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "str_logging_tags" {
  type        = list(string)
  description = "Logging STR: Tags that should be applied to the service"
  default     = null
}

variable "str_logging_key_tags" {
  type        = list(string)
  description = "Logging STR: Tags that should be applied to the key"
  default     = null
}

variable "str_logging_key_name" {
  description = "Logging STR: Name of the instance key"
  type        = string
  default     = null
}

#####################################################
# Set up a Logging Super Tenant Sender (STS) instance
# Copyright 2020 IBM
#####################################################

variable "sts_logging_provision" {
  type        = bool
  description = "Logging STS: Disable this to read the existing logging sts instance"
  default     = true
}

variable "sts_logging_bind_key" {
  description = "Logging STS: Flag indicating that key should be bind to logdna sts instance"
  type        = bool
  default     = false
}

############## STS Parameters start ######################

variable "sts_provision" {
  type        = bool
  description = "Activity Tracker ATS: Disable this to read the existing activity tracker instance"
  default     = true
}

variable "sts_service_supertenant" {
  type        = string
  description = "Logging STS: Name of your supertenant service"
  default     = "" //provide valid value here
}

variable "sts_provision_key" {
  type        = string
  description = "Logging STS: Provision key"
  default     = "" //provide valid value here
}

############## STS Parameters End ######################

variable "sts_logging_plan" {
  description = "Logging STS: plan type (14-day, 30-day, 7-day, hipaa-30-day and lite)"
  type        = string
  default     = "7-day"
}


variable "sts_logging_region" {
  description = "Logging STS: Provisioning Region"
  type        = string
  default     = "us-south"
}

variable "sts_logging_service_endpoints" {
  description = "Logging STS: Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "sts_logging_tags" {
  type        = list(string)
  description = "Logging STS: Tags that should be applied to the service"
  default     = null
}

variable "sts_logging_key_tags" {
  type        = list(string)
  description = "Logging STS: Tags that should be applied to the key"
  default     = null
}

variable "sts_logging_key_name" {
  description = "Logging STS: Name of the instance key"
  type        = string
  default     = null
}

#####################################################
# Set up Activity Tracker Super Tenant Receiver (ATR) instance
#####################################################

variable "atr_provision" {
  type        = bool
  description = "Activity Tracker ATR: Disable this not provision ATR instance"
  default     = true
}

variable "atr_region" {
  type        = string
  description = "Activity Tracker ATS: Geographic location of the resource (e.g. us-south, us-east)"
  default     = "us-south"
}

variable "atr_plan" {
  type        = string
  description = "Activity Tracker ATS: The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "7-day"
  validation {
    error_message = "Plan type should be one of the following (14-day, 30-day, 7-day, hipaa-30-day and lite)."
    condition = can(
      contains([
        "14-day",
        "30-day",
        "7-day",
        "hipaa-30-day",
        "lite"
      ], var.atr_plan)
    )
  }
}

variable "atr_tags" {
  type        = list(string)
  description = "Activity Tracker ATS:  Tags that should be applied to the service"
  default     = null
}

variable "atr_bind_key" {
  description = "Activity Tracker ATS:  Enable this to bind key to instance (true/false)"
  type        = bool
  default     = false
}

variable "atr_key_name" {
  description = "Activity Tracker ATS:  Name of the instance key"
  type        = string
  default     = null
}

variable "atr_key_tags" {
  type        = list(string)
  description = "Activity Tracker ATS: Tags that should be applied to the key"
  default     = null
}

#####################################################
# Set up Activity Tracker Super Tenant Sender (ATS) instance
#####################################################

############## ATS Parameters Start ######################

variable "use_existing_sts_crn" {
  type        = bool
  description = "Enable this to attach existing logging STS instance to activity tracket ATS instance"
  default     = false
}

variable "ats_provision" {
  type        = bool
  description = "Activity Tracker ATS: Disable this to read the existing activity tracker instance"
  default     = true
}

variable "ats_service_supertenant" {
  type        = string
  description = "Activity Tracker ATS: Name of your supertenant service"
  default     = "" //provide valid values here
}

variable "ats_provision_key" {
  type        = string
  description = "Activity Tracker ATS: Provision key"
  default     = "" //provide valid values here
}

variable "ats_associated_logging_crn" {
  type        = string
  description = "Logging: Enter the associated logging crn"
  default     = "" //provide valid value here
}

############## ATS Parameters End ######################

variable "ats_region" {
  type        = string
  description = "Activity Tracker ATS: Geographic location of the resource (e.g. us-south, us-east)"
  default     = "us-east"
}

variable "ats_plan" {
  type        = string
  description = "Activity Tracker ATS: The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "7-day"
}

variable "ats_tags" {
  type        = list(string)
  description = "Activity Tracker ATS:  Tags that should be applied to the service"
  default     = null
}

variable "ats_bind_key" {
  description = "Activity Tracker ATS:  Enable this to bind key to instance (true/false)"
  type        = bool
  default     = false
}

variable "ats_key_name" {
  description = "Activity Tracker ATS:  Name of the instance key"
  type        = string
  default     = null
}

variable "ats_key_tags" {
  type        = list(string)
  description = "Activity Tracker ATS: Tags that should be applied to the key"
  default     = null
}

#####################################################
# Monitoring Instance
# Copyright 2020 IBM
#####################################################

variable "monitoring_provision" {
  type        = bool
  description = "Monitoring: Disable this read the existing monitoring instance"
  default     = true
}

variable "monitoring_bind_key" {
  description = "Monitoring: Flag indicating that key should be bind to logdna hippa instance"
  type        = bool
  default     = false
}

variable "monitoring_plan" {
  description = "Monitoring: plan type (graduated-tier, graduated-tier-sysdig-secure-plus-monitor and lite)"
  type        = string
  default     = "graduated-tier"
}

variable "monitoring_enable_platform_metrics" {
  type        = bool
  description = "Monitoring: Receive platform metrics in Sysdig"
  default     = true
}

variable "monitoring_region" {
  description = "Monitoring: Provisioning Region"
  type        = string
  default     = "us-south"
}


variable "monitoring_service_endpoints" {
  description = "Monitoring: Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "monitoring_tags" {
  type        = list(string)
  description = "Monitoring: Tags that should be applied to the service"
  default     = null
}

variable "monitoring_key_name" {
  description = "Monitoring: Name of the instance key"
  type        = string
  default     = null
}

variable "monitoring_key_tags" {
  type        = list(string)
  description = "Monitoring: Tags that should be applied to the key"
  default     = null
}

################ Generic parameters ####################

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}


variable "create_timeout" {
  type        = string
  description = "Timeout duration for create."
  default     = null
}

variable "update_timeout" {
  type        = string
  description = "Timeout duration for update."
  default     = null
}

variable "delete_timeout" {
  type        = string
  description = "Timeout duration for delete."
  default     = null
}

