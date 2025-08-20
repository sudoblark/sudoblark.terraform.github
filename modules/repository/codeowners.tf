locals {
  interpolated_codeowner_entries = flatten([
    for entry in var.codeowners_entries : {
      pattern = entry.pattern
      owners  = join(" ", entry.owners)
    }
  ])
}

resource "github_repository_file" "codeowners" {
  repository = github_repository.repository.name
  branch     = data.github_branch.main.branch
  file       = "docs/CODEOWNERS"
  content = templatefile("${path.module}/template_files/codeowners.tftpl", {
    codeowner_entries = local.interpolated_codeowner_entries
  })
  commit_message      = format("docs/CODEOWNERS - managed by sudoblark.terraform.github")
  overwrite_on_create = true

  depends_on = [
    data.github_branch.main,
    # Done to preserve linear commit history
  ]
}