locals {
  terraform_module_readme_content = file("${path.module}/template_files/readme/terraform_module_readme.md")
}

# github_repository_file resources are created sequentially to preserve linear commit history
resource "github_repository_file" "readme" {
  repository = github_repository.repository.name
  branch     = data.github_branch.main.branch
  file       = "README.md"
  content = templatefile("${path.module}/template_files/readme/readme.tftpl", {
    REPO_NAME                = github_repository.repository.name
    REPO_DESCRIPTION         = github_repository.repository.description
    TERRAFORM_MODULE         = local.is_terraform_module_repo
    TERRAFORM_MODULE_CONTENT = local.terraform_module_readme_content
  })
  commit_message      = format("README.md - initial creation by sudoblark.terraform.github")
  overwrite_on_create = true

  depends_on = [
    data.github_branch.main,
    # Done to preserve linear commit history
    github_repository_file.codeowners,
    github_repository_file.license,
    github_repository_file.pull_request_template,
    github_repository_file.commit_to_pull_request_workflow,
    github_repository_file.precommit,
    github_repository_file.gitignore
  ]

  lifecycle {
    ignore_changes = [
      # We only want to bootstrap the file, not manage it wholesale
      content
    ]
  }

}