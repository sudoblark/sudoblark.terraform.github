locals {
  demo_repositories = {
    "sudoblark.terraform.modularised-demo" : {
      description : "An example Terraform setup using modularised components to fulfill a use-case",
      topics : ["terraform", "aws", "iac", "demo"]
      open_source : true,
      visibility : "public"
    },
    "sudoblark.terraform.module.aws.s3_files" : {
      description : "Terraform module to upload N number of (optionally templated) local files to S3 with distinct keys.",
      topics : ["terraform", "aws", "iac", "module"],
      open_source : true,
      visibility : "public"
    },
  }

  core_platform = {
    "sudoblark.terraform.github" : {
      description : "Terraform setup for Sudoblark GitHub",
      topics : ["terraform", "github", "iac"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.aws" : {
      description : "Terraform setup for Sudoblark AWS",
      topics : ["terraform", "aws", "iac"]
    },
  }

  monsternames = {
    "sudoblark.monsternames.open-api" : {
      description : "OpenAPI definition for the monsternames RESTAPI",
      topics : ["open-api"],
      open_source : true,
      visibility = "public"
    },
    "sudoblark.monsternames.api" : {
      description : "Lambda container for the monsternames-api RESTAPI backend.",
      topics : ["aws", "python", "docker"],
      open_source : true,
    }
  }

  python = {
    "sudoblark.python.bitbucket-cli" : {
      description : "A CLI application created to manage BitBucket resources.",
      topics : ["python", "bitbucket", "cli"],
      open_source : true,
    },
  }

  terraform_modules = {
    "sudoblark.terraform.module.aws.api_gateway" : {
      description : "Terraform module to create N number of API Gateways, usage plans and usage keys.",
      topics : ["terraform", "aws", "iac"]
    },
    "sudoblark.terraform.module.aws.elastic_container_registry" : {
      description : "Terraform module to create N number of Elastic Container Registries with custom lifecycle rules.",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.event_bridge_rule" : {
      description : "Terraform module to create N event bridge rules with targets and custom IAM policies.",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.iam_role" : {
      description : "Terraform module to create N number of IAM roles.",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.lambda" : {
      description : "Terraform module to create N number of lambdas from ZIPs or URIs.",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.security_group" : {
      description : "Terraform module to create N number of security groups and their associated rules.",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.sns" : {
      description : "Terraform module to create N number of SNS topics with appropriate subscriptions.",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.state_machine" : {
      description : "Terraform module to create N number of state machines with custom IAM policies..",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.s3_bucket" : {
      description : "Terraform module to create N number of S3 buckets.",
      topics : ["terraform", "aws", "iac", "module"]
    },
    "sudoblark.terraform.module.aws.s3_bucket_notifications" : {
      description : "Terraform module create N number of notifications on a given S3 bucket.",
      topics : ["terraform", "aws", "iac", "module"]
    },
  }


  repositories = merge(
    local.core_platform,
    local.terraform_modules,
    local.monsternames,
    local.python,
    local.demo_repositories
  )
}