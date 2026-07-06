variable "spring_cloud_build_deployments" {
  description = <<EOT
Map of spring_cloud_build_deployments, attributes below
Required:
    - build_result_id
    - name
    - spring_cloud_app_id
Optional:
    - addon_json
    - application_performance_monitoring_ids
    - environment_variables
    - instance_count
    - quota (block):
        - cpu (optional)
        - memory (optional)
EOT

  type = map(object({
    build_result_id                        = string
    name                                   = string
    spring_cloud_app_id                    = string
    addon_json                             = optional(string)
    application_performance_monitoring_ids = optional(list(string))
    environment_variables                  = optional(map(string))
    instance_count                         = optional(number) # Default: 1
    quota = optional(object({
      cpu    = optional(string)
      memory = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_build_deployments : (
        length(v.build_result_id) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_build_deployments : (
        v.environment_variables == null || (length(v.environment_variables) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_build_deployments : (
        v.instance_count == null || (v.instance_count >= 1 && v.instance_count <= 500)
      )
    ])
    error_message = "must be between 1 and 500"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_build_deployments : (
        v.quota == null || (v.quota.cpu == null || (length(v.quota.cpu) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_build_deployments : (
        v.quota == null || (v.quota.memory == null || (length(v.quota.memory) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_spring_cloud_build_deployment's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.SpringCloudDeploymentName] !ok
  # path: name
  #   source:    [from validate.SpringCloudDeploymentName] !regexp.MustCompile(`^([a-z])([a-z\d-]{2,30})([a-z\d])$`).MatchString(v)
  # path: spring_cloud_app_id
  #   source:    [from validate.SpringCloudAppID] !ok
  # path: spring_cloud_app_id
  #   source:    [from validate.SpringCloudAppID] err != nil
  # path: application_performance_monitoring_ids[*]
  #   source:    [from appplatform2.ValidateApmID] !ok
  # path: application_performance_monitoring_ids[*]
  #   source:    [from appplatform2.ValidateApmID] err != nil
  # path: addon_json
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
}

