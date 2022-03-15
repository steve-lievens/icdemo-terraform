# Module - Support for Observability Service.

This template is used to provision following observability instances

* Activity Tracker Super Tenant Receiver (ATR)
* Activity Tracker Super Tenant Sender (ATS)
* Logging Super Tenant Receiver (STR)
* Logging Super Tenant Sender (STS)
* Monitoring instance

##  Acronyms

| Acronym         | Full form                               |
|-----------------|-----------------------------------------|
| ATS             | Activity Tracker Super Tenant Sender    |
| ATR             | Activity Tracker Super Tenant Receiver  |
| STS             | Logging Super Tenant Sender             |
| STR             | Logging Super Tenant Receiver           |
| OB              | Observability                           |

## Provision activity tracker ATR instance

```
`atr_provision` = true
```

## Provision ATS activity tracker instance by creating logging STS insatnce
```
  ats_provision              = true
  ats_service_supertenant    = <Name_of_ats_service_supertenant>
  ats_provision_key          = <ats_provision_key>
  ats_associated_logging_crn = <ats_associated_logging_crn>
```

## Provision ATS instance with existing logging STS instance CRN then configure

```
  ats_provision              = true
  ats_service_supertenant    = <Name_of_ats_service_supertenant>
  ats_provision_key          = <ats_provision_key>
  use_existing_sts_crn       = true
```

## Provision Logging STR instance

```
  str_provision = true
```
## Provison Logging STS instance
```
  sts_provision           = true
  sts_service_supertenant = <sts_service_supertenant>
  sts_provision_key       = <sts_provision_key>
```

## Monitoring

To provision monitoring instance

```
`monitoring_provision` = true
```

## Example Usage
```
#####################################################
# Observability
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "rg" {
  name = var.resource_group
}

module "observability" {

  source = "../../"

  ################# Logging Super Tenant Receiver (STR) instance #######################

  str_provision = var.str_provision
  str_logging_bind_key  = var.str_logging_bind_key
  str_logging_plan  = var.str_logging_plan
  str_logging_region = var.str_logging_region
  str_logging_service_endpoints = var.str_logging_service_endpoints
  str_logging_tags = var.str_logging_tags
  str_logging_key_name = var.str_logging_key_name
  str_logging_key_tags = var.str_logging_key_tags

  ################## Logging Super Tenant Sender (STS) Instance ########################
  //STS
  sts_provision           = var.sts_provision
  sts_service_supertenant = var.sts_service_supertenant
  sts_provision_key       = var.sts_provision_key

  //Logging
  sts_logging_bind_key          = var.sts_logging_bind_key
  sts_logging_plan              = var.sts_logging_plan
  sts_logging_region            = var.sts_logging_region
  sts_logging_service_endpoints = var.sts_logging_service_endpoints
  sts_logging_tags              = var.sts_logging_tags
  sts_logging_key_name          = var.sts_logging_key_name
  sts_logging_key_tags          = var.sts_logging_key_tags

  ################# Activity Tracker ATR instance ##########

  atr_provision   = var.atr_provision
  atr_plan = var.atr_plan
  atr_region = var.atr_region
  atr_bind_key = var.atr_bind_key
  atr_key_name = var.atr_key_name
  atr_key_tags = var.atr_key_tags
  atr_tags = var.atr_tags

  ################# Activity Tracker ATS instance ##########

  //ATS
  ats_provision              = var.ats_provision
  ats_service_supertenant    = var.ats_service_supertenant
  ats_provision_key          = var.ats_provision_key
  ats_associated_logging_crn = var.ats_associated_logging_crn
  use_existing_sts_crn       = var.use_existing_sts_crn

  //Activity tracker
  ats_plan      = var.ats_plan
  ats_region    = var.ats_region
  ats_bind_key  = var.ats_bind_key
  ats_key_name  = var.ats_key_name
  ats_key_tags  = var.ats_key_tags
  ats_tags      = var.ats_tags

  ################# Monitoring ############################
  monitoring_provision               = var.monitoring_provision
  monitoring_bind_key                = var.monitoring_bind_key
  monitoring_name                    = var.monitoring_name
  monitoring_plan                    = var.monitoring_plan
  monitoring_region                  = var.monitoring_region
  monitoring_service_endpoints       = var.monitoring_service_endpoints
  monitoring_enable_platform_metrics = var.monitoring_enable_platform_metrics
  monitoring_tags                    = var.monitoring_tags
  monitoring_key_name                = var.monitoring_key_name
  monitoring_key_tags                = var.monitoring_key_tags


  ################ Generic Parameters ######################
  logging_name  = var.logging_name // common for STS and STR
  activity_tracker_name = var.activity_tracker_name //common for ATS and ATR
  resource_group_id = data.ibm_resource_group.rg.id
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
}



```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

##  Activity Tracker ATR Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| atr_provision             | Set this to true to provion Activity tracker ATR instance        | bool         | true    | yes      |
| activity_tracker_name     | Name of the activity tracker instance                            | string       | true    | yes      |
| atr_plan                  | Plan type                                                        | string       | n/a     | yes      |
| atr_region                | Location to create the activity tracker instance.                | string       | n/a     | yes      |
| atr_bind_key              | Indicating that  key should be bind to activity tracker instance | bool         | false   | no       |
| atr_key_name              | Name used to identify activity tracker resource key              | string       | empty   | no       |
| atr_tags                  | Tags that should be applied to the activity tracker              | list(string) | n/a     | no       |
| atr_key_tags              | Tags that should be applied to the activity tracker key          | list(string) | n/a     | no       |
| atr_make_default_receiver | Enable this to make this instance as default receiver            | bool         | true    | no       |


##  Activity Tracker ATS Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| ats_provision             | Set this to true to provion Activity tracker ATS instance        | bool         | true   | no       |
| ats_service_supertenant   | Name of service supertenant                                      | string       | Empty   | no       |
| ats_provision_key         | Service Provision key                                            | string       | Empty   | no       |
| use_existing_sts_crn      | Make true to use existing logging STS crn to attach to ATS instance| string       | Empty   | no       |
| ats_associated_logging_crn| CRN of STS logging instance                                      | string       | Empty   | no       |
| activity_tracker_name     | Used as prefix to observability instances                        | string       | n/a     | yes      |
| ats_plan                  | Plan type                                                        | string       | n/a     | yes      |
| ats_region                | Location to create the activity tracker instance.                | string       | n/a     | yes      |
| resource_group            | Name of the resource group                                       | string       | n/a     | yes      |
| ats_bind_key              | Indicating that instance key should be bind to activity tracker  | bool         | false   | no       |
|ats_key_name               | Name used to identify activity tracker resource key              | string       | empty   | no       |
| ats_tags                  | Tags that should be applied to the activity tracker              | list(string) | n/a     | no       |
|ats_key_tags               | Tags that should be applied to the activity tracker key          | list(string) | n/a     | no       |

##  Logging STR Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| str_provision             | Set this to true to provion logging STR instance                 | bool         | true    | no       |
| logging_name              | Name of the logging instance                                     | string       | n/a     | yes      |
| str_logging_plan          | The name of the plan type supported by logdna.                   | string       | n/a     | yes      |
| str_logging_region        | Location to create the logdna instance.                          | string       | n/a     | yes      |
| str_logging_bind_key      | Indicating that instance key should be bind to logdna            | bool         | false   | no       |
| str_logging_service_endpoints| Type of service endpoint                                      | string       | n/a     | no       |
| str_logging_key_name      | Name used to identify logdna resource key                        | string       | empty   | no       |
| str_logging_tags          | Tags that should be applied to the logdna                        | list(string) | n/a     | no       |
| str_logging_key_tags      | Tags that should be applied to the logdna key                    | list(string) | n/a     | no       |
| enable_platform_logs      | Enable this to make this instace as default receiver             | bool         | true    | no       |

##  Logging STS Inputs

| Name                          | Description                                                      | Type         | Default | Required |
|-------------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| sts_provision                 | Set this to true to provion logging STS instance                 | bool         | false   | no       |
| sts_service_supertenant       | Name of service supertenant                                      | string       | Empty   | no       |
| sts_provision_key             | Service Provision key                                            | string       | Empty   | no       |
| logging_name                  | Name of the logging instance                                     | string       | n/a     | yes      |
| sts_logging_plan              | The name of the plan type supported by logdna.                   | string       | n/a     | yes      |
| sts_logging_region            | Location to create the logdna instance.                          | string       | n/a     | yes      |
| sts_logging_bind_key          | Indicating that instance key should be bind to logdna            | bool         | false   | no       |
| sts_logging_service_endpoints | Type of service endpoint                                         | string       | n/a     | no       |
| sts_logging_key_name          | Name used to identify logdna resource key                        | string       | empty   | no       |
| sts_logging_role              | Name of the user role for logdna key.                            | string       | empty   | no       |
| sts_logging_tags              | Tags that should be applied to the logdna                        | list(string) | n/a     | no       |
| sts_logging_key_tags          | Tags that should be applied to the logdna key                    | list(string) | n/a     | no       |

##  Monitoring Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| monitoring_provision      | Set this to true to provion monitoring instance                  | bool         | true    | no       |
| name                      | Used as prefix to observability instances                        | string       | n/a     | yes      |
| monitoring_plan           | The name of the plan type supported by sysdig.                   | string       | n/a     | yes      |
| monitoring_region         | Location to create the sysdig instance.                          | string       | n/a     | yes      |
| monitoring_bind_key       | Indicating that instance key should be bind to sysdig            | bool         | false   | no       |
| monitoring_key_name       | Name used to identify sysdig resource key                        | string       | empty   | no       |
| monitoring_tags           | Tags that should be applied to the sysdig                        | list(string) | n/a     | no       |
| monitoring_key_tags       | Tags that should be applied to the sysdig key                    | list(string) | n/a     | no       |
| create_timeout            | Timeout duration for create                                      | string       | n/a     | no       |
| update_timeout            | Timeout duration for update                                      | string       | n/a     | no       |
| delete_timeout            | Timeout duration for delete                                      | string       | n/a     | no       |


## Usage

To create an infrastructure run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to remove an infrastructure run the following command

   `terraform destroy -var-file="input.tfvars"`

## Timeout block

Same set of timeout values (create, update & delete) are applicable to all the observability resources present in root module. For example, say we configure create timeout as 90 mins then for sysdig, logdna and activity tracker create time out will be 90 mins for each.

We can set the create, update and delete timeouts as string. For e.g say we want to set 15 minutes timeout then the value should be "15m".
