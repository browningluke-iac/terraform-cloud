variable "github_oauth_token" {
  type        = string
  sensitive   = true
  description = "PAT with scopes: admin:repo_hook, repo"
}

variable "project_config" {
  description = "data defining projects"
  type = list(object({
    name = string
  }))
}

variable "workspace_config" {
  description = "data defining workspaces"
  type = list(object({
    name              = string
    description       = optional(string, "")
    project           = optional(string, "")
    execution_mode    = optional(string, "local")
    auto_apply        = optional(bool, false)
    speculative_plans = optional(bool, true)
    queue_all_runs    = optional(bool, true)
    tags              = optional(list(string), [])
    vcs = optional(object({
      repo             = string
      working_dir      = optional(string, "/")
      branch           = optional(string, "")
      trigger_patterns = optional(list(string), [])
    }), null)
  }))
}
