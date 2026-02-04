module "data" {
  source = "./modules/data"
}

module "repositories" {
  for_each           = { for repo in module.data.repositories : repo.full_name => repo }
  source             = "./modules/repository"
  name               = each.value.full_name
  description        = each.value.description
  topics             = try(each.value.topics, [])
  visibility         = try(each.value.visibility, module.data.visibility)
  archived           = try(each.value.archived, module.data.archived)
  codeowners_entries = concat(try(each.value.codeowners_entries, []), module.data.codeowners_entries)
  open_source        = try(each.value.open_source, module.data.open_source)
  providers = {
    github = github
  }
}
