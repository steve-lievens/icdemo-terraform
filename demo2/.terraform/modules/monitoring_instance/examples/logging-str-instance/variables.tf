#####################################################
# Logging-logdna  Instance
# Copyright 2020 IBM
#####################################################

variable "provision" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

variable "bind_key" {
  description = "Flag indicating that key should be bind to logdna hippa instance"
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the instance"
  type        = string
}

variable "plan" {
  description = "plan type (14-day, 30-day, 7-day, hipaa-30-day and lite)"
  type        = string
  default     = "7-day"
}

variable "enable_platform_logs" {
  type        = bool
  description = "Receive platform logs in LogDNA"
  default     = true
}

variable "region" {
  description = "Provisioning Region"
  type        = string
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

variable "service_endpoints" {
  description = "Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the key"
  default     = null
}

variable "key_name" {
  description = "Name of the instance key"
  type        = string
  default     = null
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}



