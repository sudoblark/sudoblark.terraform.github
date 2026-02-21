locals {
  repositories = concat(
    local.repositories_bookshelf,
    local.repositories_ci_cd,
    local.repositories_core_platform,
    local.repositories_demo,
    local.repositories_monsternames,
    local.repositories_packages,
    local.repositories_python,
    local.repositories_mobile
  )

  repositories_with_names = [
    for repository in local.repositories : merge(repository, {
      full_name = format(
        "%s%s",
        try(repository.append_prefix, local.append_prefix) ? local.repository_prefix : "",
        repository.name
      )
    })
  ]

}
