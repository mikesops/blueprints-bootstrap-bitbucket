variable "ci" {
  type        = bool
  default     = false
  description = "Indicate if the terraform command was ran on a CI server."
}

locals {
  workspaces = {
    nonprod = {
      project_repos         = local.project_repos
      forked_project_repos  = local.forked_project_repos
    }

    prod = {
      project_repos         = local.project_repos
      forked_project_repos  = local.forked_project_repos
    }
  }
  
  metadata  = module.config.metadata
  workspace = merge(module.config.workspace, local.workspaces[module.config.workspace.account_env])

  bitbucket_workspace = "hubcitymedia"

  project_repos = [{
      name = "01-common-config"
      slug = "01-common-config"
      pipelines_enabled = "false"      
  }]

  forked_project_repos = [{
      name = "10-project"
      slug = "10-project"
      fork_slug = "blueprints-aws-bootstrap-project"
      pipelines_enabled = "false"
  },{
      name = "11-network"
      slug = "11-network"
      fork_slug = "blueprints-aws-bootstrap-network"
      pipelines_enabled = "false"
  },{
      name = "12-eks"
      slug = "12-eks"
      fork_slug = "blueprints-aws-bootstrap-eks"
      pipelines_enabled = "false"
  },{
      name = "13-kubernetes"
      slug = "13-kubernetes"
      fork_slug = "blueprints-aws-bootstrap-kubernetes"  
      pipelines_enabled = "false"
  },{
      name = "20-forgerock"
      slug = "20-forgerock"
      fork_slug = "blueprints-bootstrap-forgerock"  
      pipelines_enabled = "false"
  }]

  tags      = merge(local.workspace.tags, { "ops/module-framework" = "blueprints/${local.metadata.name}-02-bitbucket" })
}