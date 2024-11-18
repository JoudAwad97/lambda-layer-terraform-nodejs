resource "aws_lambda_function" "function" {
  filename         = var.filename
  description      = var.description
  architectures    = var.architectures
  function_name    = var.function_name
  role             = var.role_arn
  handler          = var.handler
  memory_size      = var.memory_size

  runtime = var.runtime

  tags = var.tags

  layers  = var.layers
  timeout = var.timeout
}