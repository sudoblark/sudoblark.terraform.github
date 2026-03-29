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
    },
    {
      name : "ai.standards"
      description : "Repository for AI standards, guidelines, and best practices at Sudoblark."
      topics : ["ai", "standards", "guidelines", "best-practices"]
      visibility : "private"
      open_source : false
    },
    {
      name : "ai.skills"
      description : "Repository for AI operational skills and workflow automation at Sudoblark."
      topics : ["ai", "skills", "automation", "workflows", "productivity"]
      visibility : "private"
      open_source : false
    },
    {
      name : "zeitgeist"
      description : "A compiled list of research papers, documentation, and ways of working which may be utilised to inform agent and human decisions."
      topics : ["ai", "research", "reference"]
      visibility : "private"
      open_source : false
    },
    {
      name : "ai.tasks"
      description : "A dumping ground for AI assisted tasks, mainly created so I don't have to bother with managing SQS - though I may do that in the future."
      topics : ["ai"]
      visibility : "private"
      open_source : false
    }
  ]
}
