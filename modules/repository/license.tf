locals {
  closed_source_license_template = "${path.module}/template_files/licenses/closed_source_license.tftpl"
  open_source_license_template   = "${path.module}/template_files/licenses/open_source_license.tftpl"
  current_year                   = formatdate("YYYY", timestamp())
}

# github_repository_file resources are created sequentially to preserve linear commit history
resource "github_repository_file" "license" {
  repository = github_repository.repository.name
  branch     = data.github_branch.main.branch
  file       = "LICENSE.txt"
  content = templatefile(var.open_source ? local.open_source_license_template : local.closed_source_license_template, {
    CURRENT_YEAR = local.current_year
  })
  commit_message      = format("license.txt - managed by sudoblark.terraform.github")
  overwrite_on_create = true

  depends_on = [
    data.github_branch.main,
    # Done to preserve linear commit history
    github_repository_file.codeowners
  ]
}
