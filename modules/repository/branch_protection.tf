resource "github_branch_protection" "main" {
  repository_id                   = github_repository.repository.node_id
  allows_deletions                = false
  enforce_admins                  = false
  pattern                         = data.github_branch.main.branch
  require_conversation_resolution = true
  required_linear_history         = false

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}