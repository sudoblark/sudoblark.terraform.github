data "github_branch" "main" {
  # Get reference to main branch for repository, which should be created automatically.
  # So using this ensures we wait till repo is fully created before doing more things.
  repository = github_repository.repository.name
  branch     = "main"
}