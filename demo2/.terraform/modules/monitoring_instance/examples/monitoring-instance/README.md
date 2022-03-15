# Module sysdig monitor instance

This module is used to create sysdig monitor instance.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "monitoring_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/monitoring-sysdig"

  source            = "../../modules/monitoring-sysdig"
  provision         = var.provision
  bind_key          = var.bind_key
  name              = var.name
  resource_group_id = data.ibm_resource_group.sysdig.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  enable_platform_metrics = var.enable_platform_metrics
  tags              = var.tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  key_name          = var.key_name
  key_tags          = var.key_tags
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs


| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| service\_name      | A descriptive name used to identify the resource instance        | string       | n/a     | yes      |
| bind_resource_key  | Indicating that instance key should be bind to logdna instance   | bool         | n/a     | no       |
| resource\_key\_name| A descriptive name used to identify the resource key             | string       | n/a     | yes      |
| role               | Name of the user role.                                           | string       | n/a     | yes      |
| plan               | The name of the plan type supported by service.                  | string       | n/a     | yes      |
| region             | Target location or environment to create the resource instance.  | string       | n/a     | yes      |
| resource\_group    | Name of the resource group                                       | string       | n/a     | yes      |
| service\_endpoints | Possible values are 'public', 'private', 'public-and-private'.   | string       | n/a     | no       |
| tags               | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| resource_key_tags  | Tags that should be applied to the service key                   | list(string) | n/a     | no       |
| create_timeout     | Timeout duration for create                                      | string       | n/a     | no       |
| update_timeout     | Timeout duration for update                                      | string       | n/a     | no       |
| delete_timeout     | Timeout duration for delete                                      | string       | n/a     | no       |
| default_receiver   | Set to true to collect platform metrics through this instance    | bool         | false   | no       |
| api_auth           | Authorization model to authenticate with the IBM Cloud Monitoring| string       | n/a     | no       |

## NOTE

To read an existing activity tracker, configure `provision` argument as `false` and give default value as empty string ("") for `plan` argument.

We can set the create, update and delete timeouts as string. For e.g say we want to set 15 minutes timeout then the value should be "15m".

## Bind a key to monitoring instance

To attach a key to monitoring instance enable it by setting `bind_key` argument to true (which is by default false). And set the `key_name` parameter accordingly (which is by default empty) in variables.tf file.


## Usage

To create an infrastructure run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to remove an infrastructure run the following command

   `terraform destroy -var-file="input.tfvars"`