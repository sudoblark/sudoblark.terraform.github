locals {
  demo_repositories = {
    "sudoblark.terraform.modularised-demo" : {
      description : "An example Terraform setup using modularised components to fulfill a use-case",
      topics : ["terraform", "aws", "iac", "demo"]
      open_source : true,
      visibility : "public"
    },
    "sudoblark.ai-ml.demos" : {
      description : "A collection of AI/ML demos, showcasing various use-cases and technologies.",
      topics : ["ai", "ml", "demo"],
      open_source : true,
      visibility : "private"
    },
  }

  ci_cd = {
    "sudoblark.terraform.ci-cd-observability-monitoring" : {
      description : "Terraform, and application code, showcasing an event-driven architecture for monitoring of: GitLab, GitHub, Azure DevOps, CircleCI.",
      topics : ["terraform", "aws", "iac", "python"]
      visibility : "private"
    },
    "sudoblark.azure-devops.library" : {
      description : "Template library of re-usable components for usage in Azure DevOps Pipelines.",
      topics : ["yaml", "azure-devops-pipelines", "library"]
      visibility : "private"
      open_source : true
    },
    "sudoblark.azure-devops.workflows" : {
      description : "Template library of re-usable, end-to-end, workflows for Azure DevOps Pipelines.",
      topics : ["yaml", "azure-devops-pipelines"]
      visibility : "private"
      open_source : true
    },
    "sudoblark.github-actions.library" : {
      description : "Template library of re-usable components for usage in GitHub Actions.",
      topics : ["yaml", "github-actions", "library"]
      visibility : "public"
      open_source : true
    },
    "sudoblark.github-actions.agent" : {
      description : "An example custom CI/CD agent for GitHub Actions, complete with localised kubernetes deployment.",
      topics : ["github-actions", "docker", "kubernetes"]
      visibility : "private"
      open_source : true
    },
    "sudoblark.github-actions.workflows" : {
      description : "Template library of re-usable, end-to-end, workflows for GitHub Actions.",
      topics : ["yaml", "github-actions", "workflows"]
      visibility : "private"
      open_source : true
    },
    "sudoblark.python.ci-cli" : {
      description : "CLI application intended to be used in CI/CD operations within Sudoblark."
      topics : ["python", "cli"]
      open_source : true
      visibility : "private"
    }
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
    ".github" : {
      description : "Magic GitHub repo for Sudoblark, containing templates for issues, the organisational README etc.",
      topics : ["github"]
      visibility : "public"
      open_source : true
    },
    "sudoblark.github.io" : {
      description : "GitHub Pages repository for sudoblark.com website"
      visibility : "private"
      topics : ["github", "website"]
    }
  }


  monsternames = {
    "sudoblark.monsternames.open-api" : {
      description : "OpenAPI definition for the monsternames RESTAPI",
      topics : ["open-api"],
      open_source : true,
      visibility = "private"
    },
    "sudoblark.monsternames.api" : {
      description : "Open-source RESTAPI realised via data-structure and algorithm driven Terraform principles.",
      topics : ["aws", "python", "docker"],
      open_source : true,
      visibility = "public"
    }
  }

  python = {
    "sudoblark.python.bitbucket-cli" : {
      description : "A CLI application created to manage BitBucket resources.",
      topics : ["python", "bitbucket", "cli"],
      open_source : true,
      visibility : "private"
    },
    "sudoblark.python.github-cli" : {
      description : "A CLI application created to interact with GitHub",
      topics : ["python", "github", "cli"],
      open_source : true,
      visibility : "public"
    },
    "sudoblark.python.core" : {
      description : "Core Python library for Sudoblark."
      topics : ["python", "library"]
      open_source : true
      visibility : "public"
    },
    "sudoblark.python.scripts" : {
      description : "A collection of Python scripts for various tasks.",
      topics : ["python", "scripts"],
      open_source : false,
      visibility : "private"
    },
  }

  terraform_modules = {
    "sudoblark.terraform.module.aws.s3_files" : {
      description : "Terraform module to upload N number of (optionally templated) local files to S3 with distinct keys.",
      topics : ["terraform", "aws", "iac", "module"],
      open_source : true,
      visibility : "public"
    },

    "sudoblark.terraform.module.aws.api_gateway" : {
      description : "Terraform module to create N number of API Gateways, usage plans and usage keys.",
      topics : ["terraform", "aws", "iac"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.elastic_container_registry" : {
      description : "Terraform module to create N number of Elastic Container Registries with custom lifecycle rules.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.event_bridge_rule" : {
      description : "Terraform module to create N event bridge rules with targets and custom IAM policies.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.iam_role" : {
      description : "Terraform module to create N number of IAM roles.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.lambda" : {
      description : "Terraform module to create N number of lambdas from ZIPs or URIs.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.security_group" : {
      description : "Terraform module to create N number of security groups and their associated rules.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.sns" : {
      description : "Terraform module to create N number of SNS topics with appropriate subscriptions.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public",
      open_source : true
    },
    "sudoblark.terraform.module.aws.state_machine" : {
      description : "Terraform module to create N number of state machines with custom IAM policies..",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.s3_bucket" : {
      description : "Terraform module to create N number of S3 buckets.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.s3_bucket_notifications" : {
      description : "Terraform module create N number of notifications on a given S3 bucket.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    "sudoblark.terraform.module.aws.dynamo_db" : {
      description : "Terraform module create N number of DynamoDB tables",
      topics : ["terraform", "aws", "iac", "module"],
      open_source : true
      visibility : "private"
    },
  }

  repositories = merge(
    local.core_platform,
    local.terraform_modules,
    local.monsternames,
    local.python,
    local.demo_repositories,
    local.ci_cd
  )
}