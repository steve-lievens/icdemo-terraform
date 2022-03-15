
######################################################
# activity tracker
######################################################

output "atr_id" {
  description = "Activity tracker id"
  value       = concat(module.activity-tracker-atr-instance.*.id, [""])[0]
}

output "ats_id" {
  description = "Activity tracker id"
  value       = concat(module.activity-tracker-ats-instance.*.id, [""])[0]
}

output "atr_guid" {
  description = "The GUID of the activity tracker"
  value       = concat(module.activity-tracker-atr-instance.*.guid, [""])[0]
}

output "ats_guid" {
  description = "The GUID of the activity tracker"
  value       = concat(module.activity-tracker-ats-instance.*.guid, [""])[0]
}


output "atr_key_id" {
  description = "Activity tracker key id"
  value       = concat(module.activity-tracker-atr-instance.*.key_id, [""])[0]
}

output "ats_key_id" {
  description = "Activity tracker key id"
  value       = concat(module.activity-tracker-ats-instance.*.key_id, [""])[0]
}

output "atr_key_guid" {
  description = "Activity tracker key guid"
  value       = concat(module.activity-tracker-atr-instance.*.key_guid, [""])[0]
}

output "ats_key_guid" {
  description = "Activity tracker key guid"
  value       = concat(module.activity-tracker-ats-instance.*.key_guid, [""])[0]
}

output "atr_key_credentials" {
  description = "Activity tracker key credentials"
  value       = concat(module.activity-tracker-atr-instance.*.key_credentials, [""])[0]
}

output "ats_key_credentials" {
  description = "Activity tracker key credentials"
  value       = concat(module.activity-tracker-ats-instance.*.key_credentials, [""])[0]
}


######################################################
# Logging
######################################################

output "str_logdna_id" {
  description = "logdna id"
  value       = concat(module.logging_str_instance.*.id, [""])[0]
}

output "sts_logdna_id" {
  description = "logdna id"
  value       = concat(module.logging_sts_instance.*.id, [""])[0]
}

output "str_logdna_guid" {
  description = "The GUID of the logdna"
  value       = concat(module.logging_str_instance.*.guid, [""])[0]
}

output "sts_logdna_guid" {
  description = "The GUID of the logdna"
  value       = concat(module.logging_sts_instance.*.guid, [""])[0]
}

output "str_logdna_key_id" {
  description = "logdna key id"
  value       = concat(module.logging_str_instance.*.key_id, [""])[0]
}

output "sts_logdna_key_id" {
  description = "logdna key id"
  value       = concat(module.logging_sts_instance.*.key_id, [""])[0]
}

output "str_logdna_key_guid" {
  description = "logdna key guid"
  value       = concat(module.logging_str_instance.*.key_guid, [""])[0]
}

output "sts_logdna_key_guid" {
  description = "logdna key guid"
  value       = concat(module.logging_sts_instance.*.key_guid, [""])[0]
}

output "str_logdna_key_credentials" {
  description = "logdna key credentials"
  value       = concat(module.logging_str_instance.*.key_credentials, [""])[0]
}

output "sts_logdna_key_credentials" {
  description = "logdna key credentials"
  value       = concat(module.logging_sts_instance.*.key_credentials, [""])[0]
}

######################################################
#  monitoring
######################################################

output "monitoring_id" {
  description = "monitoring id"
  value       = concat(module.monitoring_instance.*.id, [""])[0]
}

output "monitoring_guid" {
  description = "The GUID of the monitoring"
  value       = concat(module.monitoring_instance.*.guid, [""])[0]
}

output "monitoring_key_id" {
  description = "monitoring key id"
  value       = concat(module.monitoring_instance.*.key_id, [""])[0]
}

output "monitoring_key_guid" {
  description = "monitoring key guid"
  value       = concat(module.monitoring_instance.*.key_guid, [""])[0]
}

output "monitoring_key_credentials" {
  description = "monitoring key credentials"
  value       = concat(module.monitoring_instance.*.key_credentials, [""])[0]
}
