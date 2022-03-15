#####################################################
# Activity Tracker as a service
# Copyright 2020 IBM
#####################################################

variable "ats_provision" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

############# ATS specific parameters start ####################

variable "ats_service_supertenant" {
  type        = string
  description = "ATS: Name of your supertenant service"
  default     = "" //provide valid values here
}

variable "ats_provision_key" {
  type        = string
  description = "ATS: activity_tracker Provision key"
  default     = "" //provide valid values here
}

variable "ats_associated_logging_crn" {
  type        = string
  description = "Logging: Enter the associated logging crn"
  default     = "" //provide valid value here
}

variable "is_ats_instance" {
  type        = bool
  description = "Set this to provison ATS instance"
  default     = true
}

variable "use_existing_sts_crn" {
  type        = bool
  description = "Enable this to attach existing logging STS instance to activity tracket ATS instance"
  default     = false
}

############# ATS specific parameters end ####################

variable "ats_name" {
  type        = string
  description = "Enter The name of the activity tracker ATS instance"
}

variable "ats_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "7-day"
}

variable "ats_region" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "us-south"
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

variable "ats_tags" {
  type        = list(string)
  description = "activity_tracker Tags that should be applied to the service"
  default     = null
}

variable "ats_bind_key" {
  description = "activity_tracker Enable this to bind key to instance (true/false)"
  type        = bool
  default     = false
}

variable "ats_key_name" {
  description = "activity_tracker Name of the instance key"
  type        = string
  default     = null
}

variable "ats_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the key"
  default     = null
}

###############################################
# Logging STS instance
###############################################

variable "sts_provision" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

############### STS Specific parameters start ##################

variable "sts_service_supertenant" {
  type        = string
  description = "Logging: Name of your supertenant service"
  default     = "" //provide valid value here
}

variable "sts_provision_key" {
  type        = string
  description = "Logging: Provision key"
  default     = "" //provide valid value here
}

############### STS Specific parameters end #####################

variable "sts_bind_key" {
  description = "Flag indicating that key should be bind to logdna hippa instance"
  type        = bool
  default     = false
}

variable "sts_name" {
  description = "Name of the STS instance"
  type        = string
}

variable "sts_plan" {
  description = "plan type (14-day, 30-day, 7-day, hipaa-30-day and lite)"
  type        = string
  default     = "7-day"
}

variable "sts_region" {
  description = "Provisioning Region"
  type        = string
  default     = "us-south"
}

variable "sts_service_endpoints" {
  description = "Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "sts_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "sts_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the key"
  default     = null
}

variable "sts_key_name" {
  description = "Name of the instance key"
  type        = string
  default     = null
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}




