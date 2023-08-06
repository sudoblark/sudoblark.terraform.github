resource "github_repository_file" "license" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = "LICENSE.txt"
  content             = var.open_source ? file("${path.module}/open_source.txt") : file("${path.module}/closed_source.txt")
  commit_message      = "license.txt - managed by sudoblark.terraform.github"
  overwrite_on_create = true
}

resource "github_repository_file" "repository_codeowners_file" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = ".github/CODEOWNERS"
  content             = <<EOT
# Default owners for all the things in the repo - managed by sudoblark.terraform.github
${local.default_codeowners_string}
%{if local.codeowners_string != null}
${local.codeowners_string}
%{endif~}
  EOT
  commit_message      = "CODEOWNERS - managed by sudoblark.terraform.github"
  overwrite_on_create = true
}