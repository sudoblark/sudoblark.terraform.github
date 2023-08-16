module "repositories" {
  for_each    = local.repositories
  source      = "./modules/repository"
  name        = each.key
  description = each.value.description
  topics      = try(each.value.topics, [])
  visibility  = try(each.value.visibility, "private")
  archived    = try(each.value.archived, false)
  codeowners  = try(each.value.codeowners, null)
  open_source = try(each.value.open_source, false)
  providers = {
    github = github
  }
}