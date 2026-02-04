# Terraform configuration
terraform {
  required_version = "~> 1.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }

  }

  backend "s3" {
    bucket = "terraform-sudoblark"
    key    = "github/tfstate"
    # Enable server side encryption for the state file
    encrypt = true
    region  = "eu-west-2"
  }
}

provider "aws" {
  region  = "eu-west-2"
  profile = "sudoblark"
}

provider "github" {
  owner = "sudoblark"
}
