locals {
  codeowners        = var.codeowners == null ? null : formatlist("# Codeowner managed by sudoblark.terraform.github\n* %s", var.codeowners)
  codeowners_string = var.codeowners == null ? null : join("\n", local.codeowners)

  default_codeowners = [
    "* @benjaminlukeclark"
  ]
  default_codeowners_string = join("\n", local.default_codeowners)
}