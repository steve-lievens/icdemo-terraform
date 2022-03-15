# Module monitoring instance

This module is used to create monitoring instance.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "monitoring_instance" {

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
| name               | A descriptive name used to identify the resource instance        | string       | n/a     | yes      |
| bind_key           | Indicating that instance key should be bind to logdna instance   | bool         | n/a     | no       |
| key\_name          | A descriptive name used to identify the resource key             | string       | n/a     | yes      |
| plan               | The name of the plan type supported by service.                  | string       | n/a     | yes      |
| region             | Target location or environment to create the resource instance.  | string       | n/a     | yes      |
| resource_group_id    | ID of the resource group                                       | string       | n/a     | yes      |
| service\_endpoints | Possible values are 'public', 'private', 'public-and-private'.   | string       | n/a     | no       |
| tags               | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| key_tags           | Tags that should be applied to the service key                   | list(string) | n/a     | no       |
| create_timeout     | Timeout duration for create                                      | string       | n/a     | no       |
| update_timeout     | Timeout duration for update                                      | string       | n/a     | no       |
| delete_timeout     | Timeout duration for delete                                      | string       | n/a     | no       |

## Outputs

| Name            | Description                                |
|-----------------|--------------------------------------------|
| id              | ID of the monitoring instance              |
| guid            | GUID of the monitoring instance            |
| key_id          | ID of the monitoring instance key          |
| key_guid        | ID of the monitoring instance key          |
| key_credentials | ID of the monitoring instance key          |