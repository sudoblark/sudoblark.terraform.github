locals {
  is_python_repo    = can(regex("python", github_repository.repository.name))
  is_terraform_repo = can(regex("terraform", github_repository.repository.name))
}

data "github_branch" "main" {
  # Get reference to main branch for repository, which should be created automatically.
  # So using this ensures we wait till repo is fully created before doing more things.
  repository = github_repository.repository.name
  branch     = "main"
}