variable "github_oauth_token" {
  type        = string
  sensitive   = true
  description = "PAT with scopes: admin:repo_hook, repo"
}

variable "project_config" {
  description = "yaml data defining projects"
  type        = string
}

variable "workspace_config" {
  description = "yaml data defining projects"
  type        = string
}
