locals {
  terraform_pre_commit_content = file("${path.module}/template_files/precommit/terraform_precommit.yaml")
}

# github_repository_file resources are created sequentially to preserve linear commit history
resource "github_repository_file" "precommit" {
  repository = github_repository.repository.name
  branch     = data.github_branch.main.branch
  file       = ".pre-commit-config.yaml"
  content = templatefile("${path.module}/template_files/precommit/precommit.tftpl", {
    TERRAFORM_REPO               = local.is_terraform_repo
    TERRAFORM_MODULE             = local.is_terraform_module_repo
    TERRAFORM_PRE_COMMIT_CONTENT = local.terraform_pre_commit_content

  })
  commit_message      = format("pre-commit-config.yaml - managed by sudoblark.terraform.github")
  overwrite_on_create = true

  depends_on = [
    data.github_branch.main,
    # Done to preserve linear commit history
    github_repository_file.codeowners,
    github_repository_file.license,
    github_repository_file.pull_request_template,
    github_repository_file.commit_to_pull_request_workflow
  ]

  lifecycle {
    ignore_changes = [
      # We only want to bootstrap the file, not manage it wholesale
      content
    ]
  }

}