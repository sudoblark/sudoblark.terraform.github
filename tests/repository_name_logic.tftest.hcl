# Test repository name computation with prefix
run "repository_full_names_include_prefix_when_expected" {
  command = plan

  # Check that repositories get the prefix applied based on append_prefix
  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      repo.full_name == (try(repo.append_prefix, module.data.append_prefix) ?
        "${module.data.repository_prefix}${repo.name}" :
      repo.name)
    ])
    error_message = "Repository full_name should correctly apply prefix based on append_prefix setting"
  }
}

# Test repositories module uses full_name as key
run "repository_module_keys_match_full_names" {
  command = plan

  # Module keys should match the full_name from data
  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      contains(keys(module.repositories), repo.full_name)
    ])
    error_message = "All repository full_names should be used as module keys"
  }
}

# Test that repository count is preserved
run "repository_count_matches_input" {
  command = plan

  assert {
    condition     = length(keys(module.repositories)) == length(module.data.repositories)
    error_message = "Module repository count should match input repository count"
  }
}

# Test special repositories can opt out of prefix
run "special_repos_can_exclude_prefix" {
  command = plan

  # Check if .github repository exists and doesn't have prefix
  assert {
    condition = anytrue([
      for repo in module.data.repositories :
      repo.name == ".github" && repo.full_name == ".github"
      ]) || !anytrue([
      for repo in module.data.repositories :
      repo.name == ".github"
    ])
    error_message = ".github repository should not have prefix when append_prefix is false"
  }
}

# Test repository full_name is added to each repo object
run "data_module_adds_full_name_field" {
  command = plan

  assert {
    condition = alltrue([
      for repo in module.data.repositories :
      can(repo.full_name) && repo.full_name != ""
    ])
    error_message = "All repositories from data module must have a full_name field"
  }
}

# Test no duplicate repository names
run "repository_full_names_are_unique" {
  command = plan

  assert {
    condition = length([
      for repo in module.data.repositories : repo.full_name
      ]) == length(distinct([
        for repo in module.data.repositories : repo.full_name
    ]))
    error_message = "Repository full_name values must be unique across all repositories"
  }
}
