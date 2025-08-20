locals {
  repositories = concat(
    local.repositories_ci_cd,
    local.repositories_core_platform,
    local.repositories_demo,
    local.repositories_monsternames,
    local.repositories_python,
    local.repositories_terraform_modules
  )
}

module "repositories" {
  for_each    = { for repository in local.repositories : format("%s%s", try(repository.append_prefix, local.append_prefix) ? local.repository_prefix : "", repository.name) => repository }
  source      = "./modules/repository"
  name        = format("%s%s", try(each.value.append_prefix, local.append_prefix) ? local.repository_prefix : "", each.value.name)
  description = each.value.description
  topics      = try(each.value.topics, [])
  visibility  = try(each.value.visibility, local.visibility)
  archived    = try(each.value.archived, local.archived)
  codeowners  = try(each.value.codeowners, null)
  open_source = try(each.value.open_source, local.open_source)
  providers = {
    github = github
  }
}