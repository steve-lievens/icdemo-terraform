# Module logging-logdna-hippa-instance

This module is used to create a logging-logdna service for HIPPA instance on IBM Cloud.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logging_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"

  source            = "./../../modules/logging-instance"
  provision         = var.provision
  is_sts_instance   = false
  bind_key          = var.bind_key
  name              = var.name
  resource_group_id = data.ibm_resource_group.logdna.id
  plan              = "hipaa-30-day"
  region            = var.region
  service_endpoints = var.service_endpoints
  service_supertenant    = ""
  provision_key          = ""
  enable_platform_logs = var.enable_platform_logs
  tags              = var.tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  key_name = var.key_name
  key_tags = var.key_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs


| Name                 | Description                                                      | Type         | Default | Required |
|----------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| name                 | A descriptive name used to identify the resource instance        | string       | n/a     | yes      |
| bind_key             | Indicating that instance key should be bind to logging instance  | bool         | n/a     | no       |
| key_name             | A descriptive name used to identify the resource key             | string       | n/a     | yes      |
| plan                 | The name of the plan type supported by service.                  | string       | n/a     | yes      |
| region               | Target location or environment to create the resource instance.  | string       | n/a     | yes      |
| resource\_group      | Name of the resource group                                       | string       | n/a     | yes      |
| service\_endpoints   | Possible values are 'public', 'private', 'public-and-private'.   | string       | n/a     | no       |
| tags                 | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| key_tags             | Tags that should be applied to the resource key                  | list(string) | n/a     | no       |
| service_supertenant  | Name of your supertenant service                                 | string       | n/a     | no       |
| provision_key        | Provision key                                                    | string       | n/a     | no       |

## Bind a key to logging instance

To attach a key to logging instance enable it by setting `bind_key` argument to true (which is by default false). And set the `key_name` parameter accordingly (which is by default empty) in variables.tf file.

## Usage

To create an infrastructure run the following command

  `terraform apply`

Similarly to remove an infrastructure run the following command

   `terraform destroy`