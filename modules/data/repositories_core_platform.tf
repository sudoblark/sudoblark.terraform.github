locals {
  repositories_core_platform = [
    {
      name : "dns"
      description : "Terraform module to manage the Sudoblark internal DNS, including public and private hosted zones and records."
      topics : ["terraform", "aws", "iac", "dns"]
      visibility : "private"
      open_source : false
    },
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
      name : "terraform.aws.identity-management",
      description : "Terraform module to manage the Sudoblark AWS Organisation, inclusive of Identity Manager",
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
    },
    {
      name : "documentation"
      description : "Documentation repository for Sudoblark, containing all documentation related to the platform, including architecture decision records, design documents, and user guides."
      topics : ["documentation", "adrs", "design-documents", "user-guides"]
      visibility : "private"
      open_source : false
    }
  ]
}
