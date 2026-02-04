locals {
  repositories_core_platform = [
    {
      name : "terraform.github"
      description : "Terraform configuration for managing GitHub repositories and configuration"
      topics : ["terraform", "github", "iac"],
      visibility : "public"
      open_source : true
    },
    {
      "name" : "terraform.github.organisation",
      "description" : "Terraform module to manage GitHub organisations, including teams, members and organisation-wide settings.",
      "topics" : ["terraform", "github", "iac", "module"],
      "open_source" : true
    },
    {
      name : "terraform.aws"
      description : "Terraform setup for Sudoblark AWS",
      topics : ["terraform", "aws", "iac"]
    },
    {
      name : ".github"
      description : "Magic GitHub repo for Sudoblark, containing templates for issues, the organisational README etc.",
      topics : ["github"]
      visibility : "public"
      open_source : true
      append_prefix : false
    },
    {
      name : "github.io"
      description : "GitHub Pages repository for sudoblark.com website"
      visibility : "private"
      topics : ["github", "website"]
    }
  ]
}
