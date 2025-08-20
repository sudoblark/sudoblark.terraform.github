locals {
  terraform_pull_request_workflow = file("${path.module}/template_files/workflows/terraform_commit_to_pull_request.yaml")
}

# github_repository_file resources are created sequentially to preserve linear commit history
resource "github_repository_file" "commit_to_pull_request_workflow" {
  repository = github_repository.repository.name
  branch     = data.github_branch.main.branch
  file       = ".github/workflows/commit_to_pull_request.yaml"
  content = templatefile("${path.module}/template_files/workflows/commit_to_pull_request.tftpl", {
    TERRAFORM_REPO                  = local.is_terraform_repo
    TERRAFORM_PULL_REQUEST_WORKFLOW = local.terraform_pull_request_workflow
  })
  commit_message      = format(".github/workflows/commit_to_pull_request.yaml - managed by sudoblark.terraform.github")
  overwrite_on_create = true

  depends_on = [
    data.github_branch.main,
    # Done to preserve linear commit history
    github_repository_file.codeowners,
    github_repository_file.license,
    github_repository_file.pull_request_template
  ]

  lifecycle {
    ignore_changes = [
      # We only want to bootstrap the file, not manage it wholesale
      content
    ]
  }

}