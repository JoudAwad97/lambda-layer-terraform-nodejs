provider "aws" {
  region = local.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-nodejs-infra-tfstate"
    key            = "state/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-nodejs-infra-tf-lockid"
  }
}

data "aws_caller_identity" "current" {}