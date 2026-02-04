output "repositories" {
  description = "All repositories from config data"
  value       = local.repositories_with_names
}

output "repository_prefix" {
  description = "Root namespace used by all repositories"
  value       = local.repository_prefix
}

output "append_prefix" {
  description = "Whether to append the repository prefix by default"
  value       = local.append_prefix
}

output "visibility" {
  description = "Default visibility for new repositories"
  value       = local.visibility
}

output "open_source" {
  description = "Default open_source flag"
  value       = local.open_source
}

output "archived" {
  description = "Default archived flag"
  value       = local.archived
}

output "codeowners_entries" {
  description = "Default CODEOWNERS entries"
  value       = local.codeowners_entries
}
