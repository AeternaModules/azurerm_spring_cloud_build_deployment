output "spring_cloud_build_deployments" {
  description = "All spring_cloud_build_deployment resources"
  value       = azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments
}
output "spring_cloud_build_deployments_addon_json" {
  description = "List of addon_json values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.addon_json]
}
output "spring_cloud_build_deployments_application_performance_monitoring_ids" {
  description = "List of application_performance_monitoring_ids values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.application_performance_monitoring_ids]
}
output "spring_cloud_build_deployments_build_result_id" {
  description = "List of build_result_id values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.build_result_id]
}
output "spring_cloud_build_deployments_environment_variables" {
  description = "List of environment_variables values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.environment_variables]
}
output "spring_cloud_build_deployments_instance_count" {
  description = "List of instance_count values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.instance_count]
}
output "spring_cloud_build_deployments_name" {
  description = "List of name values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.name]
}
output "spring_cloud_build_deployments_quota" {
  description = "List of quota values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.quota]
}
output "spring_cloud_build_deployments_spring_cloud_app_id" {
  description = "List of spring_cloud_app_id values across all spring_cloud_build_deployments"
  value       = [for k, v in azurerm_spring_cloud_build_deployment.spring_cloud_build_deployments : v.spring_cloud_app_id]
}

