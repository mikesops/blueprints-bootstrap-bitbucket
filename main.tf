data "aws_region" "current" {}

resource "bitbucket_project" "main" {
  count = (length(local.workspaces[terraform.workspace].project_repos) > 0) ? 1 : 0
  key         = local.workspace.project_id
  name        = local.metadata.name
  owner       = local.bitbucket_workspace
  description = local.metadata.purpose

  provider = bitbucket
}

resource "bitbucket_repository" "main" {
  count = (length(local.workspaces[terraform.workspace].project_repos) > 0 ) ? length(local.workspaces[terraform.workspace].project_repos) : 0

  name              = "${local.metadata.name}-${local.workspaces[terraform.workspace].project_repos[count.index].name}"
  slug              = "${local.metadata.name}-${local.workspaces[terraform.workspace].project_repos[count.index].slug}" 
  owner             = local.bitbucket_workspace
  fork_policy       = "no_public_forks"
  project_key       = bitbucket_project.main[0].key
  pipelines_enabled = local.workspaces[terraform.workspace].project_repos[count.index].pipelines_enabled
}

resource "bitbucket_forked_repository" "main" {
  count = (length(local.workspaces[terraform.workspace].project_repos) > 0) ? length(local.workspaces[terraform.workspace].forked_project_repos) : 0
  
  name              = "${local.metadata.name}-${local.workspaces[terraform.workspace].forked_project_repos[count.index].name}"
  slug              = "${local.metadata.name}-${local.workspaces[terraform.workspace].forked_project_repos[count.index].slug}" 
  owner             = local.bitbucket_workspace
  fork_policy       = "no_public_forks"
  project_key       = bitbucket_project.main[0].key
  pipelines_enabled = local.workspaces[terraform.workspace].forked_project_repos[count.index].pipelines_enabled

  parent = {
    owner = local.bitbucket_workspace
    slug  = local.workspaces[terraform.workspace].forked_project_repos[count.index].fork_slug
  }
}