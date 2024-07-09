locals {
  env = "browningluke"

  data_path = "${path.module}/../../data/${local.env}"
}

module "tfe_org" {
  source = "../_modules/tfe-org"

  github_oauth_token = var.github_oauth_token

  project_config   = yamldecode(file("${local.data_path}/projects.yml"))
  workspace_config = yamldecode(file("${local.data_path}/workspaces.yml"))

  agent_pool_map = {
    "sol-homelab" = tfe_agent_pool.sol-homelab.id
  }
}

resource "tfe_agent_pool" "sol-homelab" {
  name         = "sol-homelab"
  organization = local.env
}
