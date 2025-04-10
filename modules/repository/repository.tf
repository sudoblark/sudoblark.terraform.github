resource "github_repository" "repository" {
  name                   = var.name
  description            = format("%s%s", var.description, " - repo managed by sudoblark.terraform.github")
  allow_squash_merge     = true
  allow_rebase_merge     = false
  archived               = var.archived
  auto_init              = true
  delete_branch_on_merge = true
  topics                 = var.topics == null ? null : var.topics
  visibility             = var.visibility
  has_downloads          = true
  has_projects           = true
  has_issues             = true
  has_wiki               = true

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      pages
    ]
  }
}