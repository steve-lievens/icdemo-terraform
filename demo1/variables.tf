##############################################################################
# Account Variables
##############################################################################

variable "prefix" {
  description = "A unique identifier need to provision resources. Must begin with a letter"
  type        = string
  default     = "luxtrust"
}

variable "region" {
  description = "IBM Cloud region where all resources will be provisioned"
  default     = "eu-de"
}

variable "resource_group" {
  description = "Name of resource group where all infrastructure will be provisioned"
  default     = "tfdemo"

  validation {
    error_message = "Unique ID must begin and end with a letter and contain only letters, numbers, and - characters."
    condition     = can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$", var.resource_group))
  }
}

variable "tags" {
  description = "List of Tags"
  type        = list(string)
  default     = ["tf", "demo"]
}


##############################################################################
# VPC Variables
##############################################################################

variable "create_vpc" {
  description = "True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added"
  type        = bool
  default     = true
}

variable "vpc_classic_access" {
  description = "Classic Access to the VPC"
  type        = bool
  default     = false
}

variable "vpc_address_prefix_management" {
  description = "Default address prefix creation method"
  type        = string
  default     = "manual"
}

variable "vpc_acl_rules" {
  default = [
    {
      name        = "egress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "inbound"
    },
    {
      name        = "ingress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "outbound"
    }
  ]
}

variable "vpc_cidr_blocks_prefix" {
  description = "List of CIDR blocks for prefix"
  default = [
    "10.1.0.0/16",
    "10.2.0.0/16",
    "10.3.0.0/16"]
}

variable "vpc_cidr_blocks_subnets" {
  description = "List of CIDR blocks for subnets"
  default = [
    "10.1.0.0/24",
    "10.2.0.0/24",
    "10.3.0.0/24"]
}

variable "vpc_enable_public_gateway" {
  description = "Enable public gateways, true or false"
  default     = true
}

variable "floating_ip" {
  description = "Floating IP `id`'s or `address`'es that you want to assign to the public gateway"
  type        = map(any)
  default     = {}
}

variable "public_key" {
  description = "ssh key to assign to vsi"
  default     = "steve"
}

##############################################################################
# Compute variables
##############################################################################

variable "vpc_vsi_profile" {
  description = "vpc compute profile to use"
  type        = string
  default     = "cx2-2x4"
}

variable "vpc_vsi_image" {
  description = "vpc image to use"
  type        = string
  default     = "r010-eaebade7-d050-4e4d-b552-c45e53c9a893"
}