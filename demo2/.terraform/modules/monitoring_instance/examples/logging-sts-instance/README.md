# Module logging-logdna

This template by default provision a logging instance alone (by default `is_sts_instance` = false). If you want to set up Logging Super Tenant Sender (STS) instance configure following parameters

## Provison a normal logging instance

```
`provision` = true
`is_sts_instance` = false
`service_supertenant` = null
`provision_key` = null
```

## Provison STS logging instance

```
`provision` = true
`is_sts_instance` = true
`service_supertenant` = <Name of logging sts service supertenant>
`provision_key` = <Logging provision key>
```

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logging_sts_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"

  source            = "./../../modules/logging-sts-instance"
  provision         = var.provision
  bind_key          = var.bind_key
  sts_instance_name      = var.sts_instance_name
  resource_group_id = data.ibm_resource_group.logdna.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  service_supertenant    = var.service_supertenant
  provision_key          = var.provision_key
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


| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| service\_name      | A descriptive name used to identify the resource instance        | string       | n/a     | yes      |
| bind_key           | Indicating that instance key should be bind to logdna instance   | bool         | n/a     | no       |
| resource\_key\_name| A descriptive name used to identify the resource key             | string       | n/a     | yes      |
| role               | Name of the user role.                                           | string       | n/a     | yes      |
| plan               | The name of the plan type supported by service.                  | string       | n/a     | yes      |
| region             | Target location or environment to create the resource instance.  | string       | n/a     | yes      |
| resource\_group    | Name of the resource group                                       | string       | n/a     | yes      |
| service\_endpoints | Possible values are 'public', 'private', 'public-and-private'.   | string       | n/a     | no       |
| tags               | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| resource_key_tags  | Tags that should be applied to the resource key                  | list(string) | n/a     | no       |
| parameters         | Arbitrary parameters to pass                                     | map(string)  | n/a     | no       |
| create_timeout     | Timeout duration for create                                      | string       | n/a     | no       |
| update_timeout     | Timeout duration for update                                      | string       | n/a     | no       |
| delete_timeout     | Timeout duration for delete                                      | string       | n/a     | no       |
| service_supertenant| Name of your supertenant service                                 | string       | n/a     | no       |
| provision_key      | Provision key                                                    | string       | n/a     | no       |


## NOTE

To read an existing activity tracker, configure `provision` argument as `false` and give default value as empty string ("") for `plan` argument.

To attach a key to logdna instance enable it by setting `bind_key` argument to true (which is by default false). And set the `key_name` parameter accordingly (which are by deafult null) in variables.tf file.

We can set the create, update and delete timeouts as string. For e.g say we want to set 15 minutes timeout then the value should be "15m".

## NOTE

To attach a key to logdna instance enable it by setting `bind_key` argument to true (which is by default false). And set the `resource_key_name` and `role` parameters accordingly (which are by deafult empty) in variables.tf file.

## Usage

To create an infrastructure run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to remove an infrastructure run the following command

   `terraform destroy -var-file="input.tfvars"`