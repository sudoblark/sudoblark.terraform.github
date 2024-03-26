locals {
  repositories = {
    "sudoblark.terraform.github" : {
      description : "Terraform setup for Sudoblark GitHub",
      topics : ["terraform", "github", "iac"]
    },
    "monsternames.open-api" : {
      description : "OpenAPI definition for the monsternames RESTAPI",
      topics : ["open-api"],
      open_source: true,
      visibility = "public"
    },
    "monsternames.api" : {
      description: "Lambda container for the monsternames-api RESTAPI backend.",
      topics: ["aws", "python", "docker"],
      open_source: true,
    }
    "terraform.aws" : {
      description : "Terraform setup for Sudoblark AWS",
      topics : ["terraform", "aws", "iac"]
    },
  }
}