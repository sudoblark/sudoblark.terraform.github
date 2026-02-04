locals {
  # The root namespace utilised by all repositories
  repository_prefix = "sudoblark."
  # Boolean which controls if the prefix is appended or not
  append_prefix = true

  # The default visibility for new repositories
  visibility = "private"

  # By default, new repositories are closed source
  open_source = false

  # By default, repositories obviously aren't archived
  archived = false

  # Default codeowner entries applied before unique repository codeowners entries
  codeowners_entries = [
    {
      pattern = "*"
      owners = [
        "@benjaminlukeclark"
      ]
    }
  ]
}
