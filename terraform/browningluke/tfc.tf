locals {
  env = "browningluke"
}

module "tfe_org" {
  source = "../_modules/tfe-org"

  github_oauth_token = var.github_oauth_token

  project_config = yamldecode(
    file("${path.module}/../../data/${local.env}/projects.yml")
  )
  workspace_config = yamldecode(
    file("${path.module}/../../data/${local.env}/workspaces.yml")
  )
}
