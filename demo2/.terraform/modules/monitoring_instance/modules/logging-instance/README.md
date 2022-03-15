# Module logging-logdna

This module is used to create both logging-logdna instance and logging STS instance on IBM Cloud.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logging_sts_instance" {

  source            = "./../../modules/logging-instance"
  provision         = var.provision
  is_sts_instance   = true
  bind_key          = var.bind_key
  name              = var.name
  resource_group_id = data.ibm_resource_group.logdna.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  service_supertenant    = var.service_supertenant
  provision_key          = var.provision_key
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


| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| is_sts_instance           | Set this to true to provision logging STS instance                 | bool         | false   | no       |
| service_supertenant       | Name of service supertenant                                      | string       | Empty   | no       |
| provision_key             | Service Provision key                                            | string       | Empty   | no       |
| name                      | Used as prefix to observability instances                        | string       | n/a     | yes      |
| plan                      | Plan type                                                        | string       | n/a     | yes      |
| region                    | Location to create the logging instance.                         | string       | n/a     | yes      |
| resource_group_id         | ID of the resource group                                         | string       | n/a     | yes      |
| bind_key                  | Indicating that instance key should be bind to logging           | bool         | false   | no       |
| sts_provision             | Set this to provision logging instance                           | bool         | true    | yes      |
| key_name                  | Name used to identify logging resource key                       | string       | empty   | no       |
| tags                      | Tags that should be applied to the logging                       | list(string) | n/a     | no       |
| key_tags                  | Tags that should be applied to the logging key                   | list(string) | n/a     | no       |


## Outputs

| Name            | Description                            |
|-----------------|----------------------------------------|
| id              | ID of the logging instance              |
| guid            | GUID of the logging instance            |
| key_id          | ID of the logging instance key          |
| key_guid        | ID of the logging instance key          |
| key_credentials | ID of the logging instance key          |
