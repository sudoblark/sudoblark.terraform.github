# Integration test - validates resource creation logic with actual data
run "creates_expected_resources_with_actual_data" {
  command = plan

  # This test validates that the resource creation logic works correctly
  # It runs against the actual data defined in modules/data/

  assert {
    condition     = length(keys(module.repositories)) > 0
    error_message = "Should create at least one repository"
  }

  assert {
    condition     = length(module.data.repositories) > 0
    error_message = "Data module should provide at least one repository definition"
  }
}

# Test that all repositories from data module get created as resources
run "all_repositories_are_created_as_resources" {
  command = plan

  assert {
    condition     = length(keys(module.repositories)) == length(module.data.repositories)
    error_message = "All repositories defined in data module should be created as repository resources"
  }
}

# Test repository name computation with prefix
run "repository_names_computed_correctly" {
  command = plan

  # Verify repositories with append_prefix get the prefix applied (check keys)
  assert {
    condition = alltrue([
      for key in keys(module.repositories) :
      can(regex("^sudoblark\\.", key)) || can(regex("^\\.github$", key))
    ])
    error_message = "Repository names should have 'sudoblark.' prefix or be special repos like '.github'"
  }
}

# Test that defaults are applied when repository doesn't specify values
run "defaults_are_applied_to_repositories" {
  command = plan

  # Repositories should use defaults when values aren't explicitly set
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

# Test codeowners entries are merged correctly
run "codeowners_have_at_least_defaults" {
  command = plan

  # Data module should provide default codeowners
  assert {
    condition     = length(module.data.codeowners_entries) > 0
    error_message = "Should have at least one default codeowners entry"
  }
}

# Test resource naming consistency
run "repository_resource_keys_match_full_names" {
  command = plan

  # Repository resource keys should match full_name values from data module
  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      contains(keys(module.repositories), repo.full_name)
    ])
    error_message = "Repository resource keys should match the full_name values from data module"
  }
}
