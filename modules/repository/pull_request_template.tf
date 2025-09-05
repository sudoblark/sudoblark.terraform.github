# github_repository_file resources are created sequentially to preserve linear commit history
resource "github_repository_file" "pull_request_template" {
  repository = github_repository.repository.name
  branch     = data.github_branch.main.branch
  file       = ".github/pull_request_template.md"
  content = templatefile("${path.module}/template_files/pull_request_template.tftpl", {
    PYTHON_REPO    = local.is_python_repo
    TERRAFORM_REPO = local.is_terraform_repo
  })
  commit_message      = format(".github/pull_request_template.md - managed by sudoblark.terraform.github")
  overwrite_on_create = true

  depends_on = [
    data.github_branch.main,
    # Done to preserve linear commit history
    github_repository_file.codeowners,
    github_repository_file.license
  ]
}