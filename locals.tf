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
    "terraform.aws" : {
      description : "Terraform setup for Sudoblark AWS",
      topics : ["terraform", "aws", "iac"]
    },
    "aws.lambda.dynamoapi" : {
      description : "A generic Python lambda which supports CRUD operations on top of DynamoDB",
      topics : ["aws"]
    },
    "sudoblark.nginx": {
      description: "The central web tier for sudoblark.com"
      topics: ["nginx", "docker"]
    }
  }
}