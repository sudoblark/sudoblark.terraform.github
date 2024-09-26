locals {
  commit_to_pr_template = anytrue([
    can(regex("terraform", github_repository.repository.name)),
    ]
  )

}

resource "github_repository_file" "license" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = "LICENSE.txt"
  content             = var.open_source ? file("${path.module}/template_files/open_source_license_template") : file("${path.module}/template_files/closed_source_license_template")
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

resource "github_repository_file" "readme" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = "README.md"
  content             = <<EOT
# ${github_repository.repository.name}
${github_repository.repository.description}
%{if can(regex("terraform.module", github_repository.repository.name))}
${file("${path.module}/template_files/terraform_module_readme_template.md")}
%{endif~}
  EOT
  commit_message      = "README.md - initial creation by sudoblark.terraform.github"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      # We only want to bootstrap the file, not manage it wholesale
      content
    ]
  }
}

resource "github_repository_file" "gitignore" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = ".gitignore"
  content             = file("${path.module}/template_files/.gitignore")
  commit_message      = ".gitignore - managed by sudoblark.terraform.github"
  overwrite_on_create = true
}

resource "github_repository_file" "precommit" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = ".pre-commit-config.yaml"
  content             = <<EOT
%{if can(regex("terraform.module", github_repository.repository.name))}
${file("${path.module}/template_files/terraform_module_pre_commit.yaml")}
%{endif~}

%{if can(regex("terraform", github_repository.repository.name)) && !(can(regex("terraform.module", github_repository.repository.name)))}
${file("${path.module}/template_files/terraform_pre_commit.yaml")}
%{endif~}
  EOT
  commit_message      = ".pre-commit-config.yaml - managed by sudoblark.terraform.github"
  overwrite_on_create = true
}

resource "github_repository_file" "commit-to-pr" {
  # Only populate the template if we have a templated file to populate.
  count               = local.commit_to_pr_template == true ? 1 : 0
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = ".github/workflows/commit-to-pr.yaml"
  content             = <<EOT
%{if can(regex("terraform", github_repository.repository.name))}
${file("${path.module}/template_files/terraform_commit_to_pr_template.yaml")}
%{endif~}
  EOT
  commit_message      = "commit-to-pr.yaml - managed by sudoblark.terraform.github"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      # We only want to bootstrap the file, not manage it wholesale
      content
    ]
  }
}

resource "github_repository_file" "pull-request-template" {
  repository          = github_repository.repository.name
  branch              = data.github_branch.main.branch
  file                = ".github/pull_request_template.md"
  content             = <<EOT
${file("${path.module}/template_files/pull_request_template.md")}
%{if can(regex("python", github_repository.repository.name))}
${file("${path.module}/template_files/python_pull_request_checklist.md")}
%{endif~}
%{if can(regex("terraform", github_repository.repository.name))}
${file("${path.module}/template_files/terraform_pull_request_checklist.md")}
%{endif~}
  EOT
  commit_message      = "pull_request_template.md - managed by sudoblark.terraform.github"
  overwrite_on_create = true
}