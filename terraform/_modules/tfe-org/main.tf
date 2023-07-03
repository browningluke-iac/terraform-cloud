resource "tfe_oauth_client" "github" {
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  service_provider = "github"
  oauth_token      = var.github_oauth_token
}

resource "tfe_project" "projects" {
  for_each = {
    for project in var.project_config : project.name => project
  }

  name = each.key
}

resource "tfe_workspace" "workspaces" {
  for_each = {
    for workspace in var.workspace_config : workspace.name => workspace
  }

  # Meta
  name        = each.key
  description = lookup(each.value, "description", "")
  project_id  = can(each.value.project) ? tfe_project.projects[each.value.project].id : null
  tag_names   = concat(lookup(each.value, "tags", []), ["managed-in-terraform"])

  # Execution
  execution_mode      = lookup(each.value, "execution_mode", "local")
  speculative_enabled = lookup(each.value, "speculative_plans", true)
  auto_apply          = lookup(each.value, "auto_apply", false)

  queue_all_runs = lookup(each.value, "queue_all_runs", true)

  working_directory = can(each.value.vcs.working_dir) ? each.value.vcs.working_dir : null

  trigger_patterns = try(each.value.vcs.trigger_patterns, null)

  # VCS
  dynamic "vcs_repo" {
    for_each = can(each.value.vcs.repo) ? [each.value.vcs] : []

    content {
      identifier     = vcs_repo.value.repo
      branch         = lookup(vcs_repo.value, "branch", "")
      oauth_token_id = tfe_oauth_client.github.oauth_token_id
    }
  }

  depends_on = [
    tfe_project.projects,
    tfe_oauth_client.github
  ]
}
