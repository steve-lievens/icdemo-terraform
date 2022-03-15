
##############################################################################
# Create a VPC
##############################################################################

resource "ibm_is_vpc" "vpc" {
  name                        = "${var.prefix}-vpc"
  resource_group              = ibm_resource_group.resource_group.id
  default_security_group_name = "${var.prefix}-sg-default"
  default_network_acl_name    = "${var.prefix}-acl-default"
  address_prefix_management   = var.vpc_address_prefix_management
  classic_access              = var.vpc_classic_access
  tags                        = var.tags
}

output "vpc_id" {
  description = "ID of VPC created"
  value       = ibm_is_vpc.vpc.id
}

##############################################################################
# Prefixes and subnets 
##############################################################################

resource "ibm_is_vpc_address_prefix" "vpc_prefix" {

  count = 3
  name  = "${var.prefix}-prefix-zone-${count.index + 1}"
  zone  = "${var.region}-${(count.index % 3) + 1}"
  vpc   = ibm_is_vpc.vpc.id
  cidr  = element(var.vpc_cidr_blocks_prefix, count.index)
}


##############################################################################
# Public Gateways
##############################################################################

resource "ibm_is_public_gateway" "pgw" {

  count = var.vpc_enable_public_gateway ? 3 : 0
  name  = "${var.prefix}-pgw-${count.index + 1}"
  vpc   = ibm_is_vpc.vpc.id
  zone  = "${var.region}-${count.index + 1}"

}

# Security Groups
##############################################################################

# Allow incoming ICMP packets (pings).
resource "ibm_is_security_group_rule" "sg-rule-inbound-icmp" {
  group     = ibm_is_vpc.vpc.default_security_group
  direction = "inbound"
  remote    = "0.0.0.0/0"

  icmp {
    type = 8
  }
}

# Ingress listening on TCP/443
resource "ibm_is_security_group_rule" "sg-rule-inbound-https" {
  group     = ibm_is_vpc.vpc.default_security_group
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 443
    port_max = 443
  }
}

# Allow SSH
resource "ibm_is_security_group_rule" "sg-rule-inbound-ssh" {
  group     = ibm_is_vpc.vpc.default_security_group
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}


# Network ACLs
##############################################################################
resource "ibm_is_network_acl" "multizone_acl" {

  name = "${var.prefix}-multizone-acl"
  vpc  = ibm_is_vpc.vpc.id
  resource_group = ibm_resource_group.resource_group.id

  dynamic "rules" {

    for_each = var.vpc_acl_rules

    content {
      name        = rules.value.name
      action      = rules.value.action
      source      = rules.value.source
      destination = rules.value.destination
      direction   = rules.value.direction
    }
  }
}

output "acl_id" {
  description = "ID of ACL created"
  value       = ibm_is_network_acl.multizone_acl.id
}

##############################################################################
# Create Subnets
##############################################################################

resource "ibm_is_subnet" "subnet" {

  count           = 3
  name            = "${var.prefix}-subnet-${count.index + 1}"
  vpc             = ibm_is_vpc.vpc.id
  zone            = "${var.region}-${count.index + 1}"
  ipv4_cidr_block = element(var.vpc_cidr_blocks_subnets, count.index)
  network_acl     = ibm_is_network_acl.multizone_acl.id
  public_gateway  = var.vpc_enable_public_gateway ? element(ibm_is_public_gateway.pgw.*.id, count.index) : null
}