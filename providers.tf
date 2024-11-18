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
}

data "aws_caller_identity" "current" {}