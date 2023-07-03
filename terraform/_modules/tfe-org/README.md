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
| <a name="input_github_oauth_token"></a> [github\_oauth\_token](#input\_github\_oauth\_token) | PAT with scopes: admin:repo\_hook, repo | `string` | n/a | yes |
| <a name="input_project_config"></a> [project\_config](#input\_project\_config) | yaml data defining projects | `string` | n/a | yes |
| <a name="input_workspace_config"></a> [workspace\_config](#input\_workspace\_config) | yaml data defining projects | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
