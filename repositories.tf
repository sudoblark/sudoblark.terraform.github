module "repositories" {
  for_each           = local.repositories
  source             = "./modules/repository"
  name               = each.key
  description        = each.value.description
  topics             = each.value.topics

  providers = {
    github = github
  }
}