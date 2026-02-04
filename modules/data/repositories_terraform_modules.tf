locals {
  repositories_terraform_modules = [
    {
      name : "terraform.module.aws.s3_files"
      description : "Terraform module to upload N number of (optionally templated) local files to S3 with distinct keys.",
      topics : ["terraform", "aws", "iac", "module"],
      open_source : true,
      visibility : "public"
    },

    { name : "terraform.module.aws.api_gateway"
      description : "Terraform module to create N number of API Gateways, usage plans and usage keys.",
      topics : ["terraform", "aws", "iac"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.elastic_container_registry"
      description : "Terraform module to create N number of Elastic Container Registries with custom lifecycle rules.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.event_bridge_rule"
      description : "Terraform module to create N event bridge rules with targets and custom IAM policies.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.iam_role"
      description : "Terraform module to create N number of IAM roles.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.lambda"
      description : "Terraform module to create N number of lambdas from ZIPs or URIs.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.security_group"
      description : "Terraform module to create N number of security groups and their associated rules.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.sns"
      description : "Terraform module to create N number of SNS topics with appropriate subscriptions.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public",
      open_source : true
    },
    { name : "terraform.module.aws.state_machine"
      description : "Terraform module to create N number of state machines with custom IAM policies..",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.s3_bucket"
      description : "Terraform module to create N number of S3 buckets.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.s3_bucket_notifications"
      description : "Terraform module create N number of notifications on a given S3 bucket.",
      topics : ["terraform", "aws", "iac", "module"],
      visibility : "public"
      open_source : true
    },
    { name : "terraform.module.aws.dynamo_db"
      description : "Terraform module create N number of DynamoDB tables",
      topics : ["terraform", "aws", "iac", "module"],
      open_source : true
      visibility : "private"
    },
  ]
}
