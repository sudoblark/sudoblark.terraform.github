locals {
  repositories = merge(
    local.core_platform,
    local.terraform_modules,
    local.monsternames
  )
}