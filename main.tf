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
    bucket  = "aws-sudoblark-management-terraform-state"
    key     = "github/repositories/terraform.tfstate"
    encrypt = true
    region  = "eu-west-2"
    assume_role = {
      role_arn     = "arn:aws:iam::741139166799:role/aws-sudoblark-management-github-cicd-role"
      session_name = "sudoblark.terraform.aws.identity-management"
      external_id  = "CI_CD_PLATFORM"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  assume_role {
    role_arn     = "arn:aws:iam::741139166799:role/aws-sudoblark-management-github-cicd-role"
    session_name = "sudoblark.terraform.aws.identity-management"
    external_id  = "CI_CD_PLATFORM"
  }
}

provider "github" {
  owner = "sudoblark"
}
