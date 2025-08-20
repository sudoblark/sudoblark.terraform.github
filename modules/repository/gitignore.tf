# github_repository_file resources are created sequentially to preserve linear commit history
resource "github_repository_file" "gitignore" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = ".gitignore"
  content             = templatefile("${path.module}/template_files/.gitignore", {})
  commit_message      = format(".gitignore- managed by sudoblark.terraform.github")
  overwrite_on_create = true

  depends_on = [
    data.github_branch.main,
    # Done to preserve linear commit history
    github_repository_file.codeowners,
    github_repository_file.license,
    github_repository_file.pull_request_template,
    github_repository_file.commit_to_pull_request_workflow,
    github_repository_file.precommit
  ]

  lifecycle {
    ignore_changes = [
      # We only want to bootstrap the file, not manage it wholesale
      content
    ]
  }

}