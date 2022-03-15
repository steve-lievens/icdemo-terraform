##############################################################################
# Use an existing ssh key
##############################################################################
data "ibm_is_ssh_key" "vpc_ssh_key" {
  name = var.public_key
}

resource "ibm_is_instance" "vsi_instance" {
  count   = 3
  name    = "${var.prefix}-instance-${count.index + 1}"
  image   = "r010-eaebade7-d050-4e4d-b552-c45e53c9a893"
  profile = "cx2-2x4"

  primary_network_interface {
    subnet          = element(ibm_is_subnet.subnet.*.id, count.index)
  }

  vpc  = ibm_is_vpc.vpc.id
  zone = "${var.region}-${count.index + 1}"
  keys = [data.ibm_is_ssh_key.vpc_ssh_key.id]

  tags = var.tags
}

