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
  description = each.value.description
  project_id  = try(tfe_project.projects[each.value.project].id, null)
  tag_names   = concat(each.value.tags, ["managed-in-terraform"])

  # Execution
  execution_mode      = each.value.execution_mode
  speculative_enabled = each.value.speculative_plans
  auto_apply          = each.value.auto_apply

  agent_pool_id = each.value.execution_mode == "agent" ? var.agent_pool_map[each.value.agent_pool] : null

  queue_all_runs = each.value.queue_all_runs

  working_directory = try(each.value.vcs.working_dir, null)

  trigger_patterns = try(each.value.vcs.trigger_patterns, null)

  # Remote state
  global_remote_state       = each.value.remote_state.global
  remote_state_consumer_ids = each.value.remote_state.workspaces

  # VCS
  dynamic "vcs_repo" {
    for_each = each.value.vcs != null ? [each.value.vcs] : []

    content {
      identifier     = vcs_repo.value.repo
      branch         = vcs_repo.value.branch
      oauth_token_id = tfe_oauth_client.github.oauth_token_id
    }
  }

  depends_on = [
    tfe_project.projects,
    tfe_oauth_client.github
  ]
}
