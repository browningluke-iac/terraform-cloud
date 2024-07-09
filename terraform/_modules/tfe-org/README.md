# Terraform Enterprise/Cloud Organization Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.7 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_oauth_client.github](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/oauth_client) | resource |
| [tfe_project.projects](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_workspace.workspaces](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool_map"></a> [agent\_pool\_map](#input\_agent\_pool\_map) | map of agent pool names to ids | `map(string)` | n/a | yes |
| <a name="input_github_oauth_token"></a> [github\_oauth\_token](#input\_github\_oauth\_token) | PAT with scopes: admin:repo\_hook, repo | `string` | n/a | yes |
| <a name="input_project_config"></a> [project\_config](#input\_project\_config) | data defining projects | <pre>list(object({<br>    name = string<br>  }))</pre> | n/a | yes |
| <a name="input_workspace_config"></a> [workspace\_config](#input\_workspace\_config) | data defining workspaces | <pre>list(object({<br>    name              = string<br>    description       = optional(string, "")<br>    project           = optional(string, "")<br>    execution_mode    = optional(string, "local")<br>    agent_pool        = optional(string, null)<br>    auto_apply        = optional(bool, false)<br>    speculative_plans = optional(bool, true)<br>    queue_all_runs    = optional(bool, true)<br>    tags              = optional(list(string), [])<br>    remote_state = optional(object({<br>      global     = optional(bool, true)<br>      workspaces = optional(list(string), [])<br>    }), {})<br>    vcs = optional(object({<br>      repo             = string<br>      working_dir      = optional(string, "/")<br>      branch           = optional(string, "")<br>      trigger_patterns = optional(list(string), [])<br>    }), null)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
