# Module activity tracker instance

This module is used to provision both activity tracker and activity tracket ATS instances.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

###################################################################
# Logging STS instance - required for activity tracker ATS instance
###################################################################

module "logging_sts_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"
  count             = (var.is_ats_instance && var.use_existing_sts_crn == false) ? 1 : 0
  source            = "./../../modules/logging-instance"
  provision         = var.sts_provision
  is_sts_instance   = true                //logging sts is required only if ATS instance is provisioned
  bind_key          = var.sts_bind_key
  name              = var.sts_name
  resource_group_id = data.ibm_resource_group.res_group.id
  plan              = var.sts_plan
  region            = var.sts_region
  service_endpoints = var.sts_service_endpoints
  service_supertenant    = var.sts_service_supertenant
  provision_key          = var.sts_provision_key
  tags              = var.sts_tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  key_name = var.sts_key_name
  key_tags = var.sts_key_tags
}

###################################################################
# Activity tracker ATS instance
###################################################################

module "activity_tracker_ats_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  source                 = "./../../modules/activity-tracker-instance"
  provision              = var.ats_provision
  is_ats_instance        = var.is_ats_instance
  name                   = var.ats_name
  plan                   = var.ats_plan
  region                 = var.ats_region
  bind_key               = var.ats_bind_key
  key_name               = var.ats_key_name
  key_tags               = var.ats_key_tags
  resource_group_id      = data.ibm_resource_group.res_group.id
  service_supertenant    = var.ats_service_supertenant
  associated_logging_crn = var.is_ats_instance ? (var.use_existing_sts_crn ? var.ats_associated_logging_crn : module.logging_sts_instance[0].id) : ""
  provision_key          = var.ats_provision_key
  tags                   = var.ats_tags
  create_timeout         = var.create_timeout
  update_timeout         = var.update_timeout
  delete_timeout         = var.delete_timeout
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

##  Activity Tracker Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| is_ats_instance           | Set this to true to provision Activity tracker ATS instance        | bool         | false   | no       |
| use_existing_sts_crn      | Set this to true to use existing logging STS crn                 | string       | Empty   | no       |
| service_supertenant       | Name of service supertenant                                      | string       | Empty   | no       |
| provision_key             | Service Provision key                                            | string       | Empty   | no       |
| associated_logging_crn    | CRN of STS logging instance                                      | string       | Empty   | no       |
| name                      | Used as prefix to observability instances                        | string       | n/a     | yes      |
| plan                      | Plan type                                                        | string       | n/a     | yes      |
| region                    | Location to create the activity tracker instance.                | string       | n/a     | yes      |
| resource_group_id         | ID of the resource group                                         | string       | n/a     | yes      |
| bind_key                  | Indicating that instance key should be bind to activity tracker  | bool         | false   | no       |
| ats_provision             | Set this to provision activity tracker instance                  | bool         | true    | yes      |
| key_name                  | Name used to identify activity tracker resource key              | string       | empty   | no       |
| tags                      | Tags that should be applied to the activity tracker              | list(string) | n/a     | no       |
| key_tags                  | Tags that should be applied to the activity tracker key          | list(string) | n/a     | no       |


## Outputs

| Name            | Description                                      |
|-----------------|--------------------------------------------------|
| id              | ID of the activity tracker instance              |
| guid            | GUID of the activity tracker instance            |
| key_id          | ID of the activity tracker instance key          |
| key_guid        | ID of the activity tracker instance key          |
| key_credentials | ID of the activity tracker instance key          |

## NOTE:

 We can set the create, update and delete timeouts as string. For e.g say we want to set 15 minutes timeout then the value should be "15m".

## Bind a key to activity tracker instance

To attach a key to activity tracker instance enable it by setting `bind_key` argument to true (which is by default false). And set the `key_name` parameter accordingly (which is by default empty) in variables.tf file.


## Usage

To create an infrastructure run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to remove an infrastructure run the following command

   `terraform destroy -var-file="input.tfvars"`
