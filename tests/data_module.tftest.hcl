# Test that all repositories have required fields
run "repositories_have_required_fields" {
  command = plan

  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      can(repo.name) && can(repo.description)
    ])
    error_message = "All repositories must have name and description fields"
  }
}

# Test that repository names follow naming convention
run "repository_names_follow_convention" {
  command = plan

  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      can(regex("^[a-zA-Z0-9._-]+$", repo.name))
    ])
    error_message = "Repository names must contain only alphanumeric characters, dots, hyphens, and underscores"
  }
}

# Test that topics are valid when present
run "repository_topics_are_valid_lists" {
  command = plan

  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      can(repo.topics) ? (can(tolist(repo.topics)) && alltrue([for topic in repo.topics : can(tostring(topic))])) : true
    ])
    error_message = "Repository topics must be a list of strings when present"
  }
}

# Test visibility values are valid when specified
run "repository_visibility_values_are_valid" {
  command = plan

  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      can(repo.visibility) ? contains(["public", "private"], repo.visibility) : true
    ])
    error_message = "Repository visibility must be either 'public' or 'private' when specified"
  }
}

# Test open_source is boolean when specified
run "open_source_is_boolean" {
  command = plan

  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      can(repo.open_source) ? can(tobool(repo.open_source)) : true
    ])
    error_message = "Repository open_source must be a boolean when specified"
  }
}

# Test archived is boolean when specified
run "archived_is_boolean" {
  command = plan

  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      can(repo.archived) ? can(tobool(repo.archived)) : true
    ])
    error_message = "Repository archived must be a boolean when specified"
  }
}

# Test default values are properly set
run "defaults_are_correct" {
  command = plan

  assert {
    condition     = module.data.repository_prefix == "sudoblark."
    error_message = "Repository prefix should be 'sudoblark.'"
  }

  assert {
    condition     = module.data.append_prefix == true
    error_message = "Append prefix should be true by default"
  }

  assert {
    condition     = module.data.visibility == "private"
    error_message = "Default visibility should be private"
  }

  assert {
    condition     = module.data.open_source == false
    error_message = "Default open_source should be false"
  }

  assert {
    condition     = module.data.archived == false
    error_message = "Default archived should be false"
  }
}

# Test codeowners structure
run "codeowners_entries_have_correct_structure" {
  command = plan

  assert {
    condition = alltrue([
      for entry in module.data.codeowners_entries :
      can(entry.pattern) && can(entry.owners) && can(tolist(entry.owners))
    ])
    error_message = "CODEOWNERS entries must have pattern and owners list"
  }
}

# Test that we have repositories defined
run "repositories_list_is_not_empty" {
  command = plan

  assert {
    condition     = length(module.data.repositories) > 0
    error_message = "Should have at least one repository defined"
  }
}

# Test repository categorization
run "repositories_include_multiple_categories" {
  command = plan

  assert {
    condition = anytrue([
      for repo in module.data.repositories :
      can(regex("python", repo.name))
    ])
    error_message = "Should have at least one Python repository"
  }

  assert {
    condition = anytrue([
      for repo in module.data.repositories :
      can(regex("terraform", repo.name))
    ])
    error_message = "Should have at least one Terraform repository"
  }
}
