#####################################################
# Activity Tracker as a service
# Copyright 2020 IBM
#####################################################

variable "name" {
  type        = string
  description = "Enter The name for the service"
}

variable "plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "7-day"
}

variable "make_default_receiver" {
  type        = bool
  description = "Enable this to make this instance as default receiver"
  default     = true
}


variable "provision" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

variable "region" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "us-south"
}

variable "resource_group" {
  type        = string
  description = "Enter the name of the Resource group ."
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

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "bind_key" {
  description = "Enable this to bind key to instance (true/false)"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Name of the instance key"
  type        = string
  default     = null
}

variable "key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the key"
  default     = null
}
