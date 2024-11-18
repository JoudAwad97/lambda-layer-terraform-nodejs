locals {
  aws_region    = "us-east-2"
  aws_account_id = data.aws_caller_identity.current.account_id
}