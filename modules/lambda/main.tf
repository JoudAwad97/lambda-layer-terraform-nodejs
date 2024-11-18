resource "aws_lambda_function" "function" {
  filename      = var.filename
  description   = var.description
  architectures = var.architectures
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler
  memory_size   = var.memory_size

  runtime = var.runtime

  tags = var.tags

  layers  = var.layers
  timeout = var.timeout
}

# Default IAM role to get the lambda provisioning to work
resource "aws_iam_role" "lambda_role" {
  name = "${var.function_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "${var.function_name}-policy"
  description = "IAM policy for Lambda execution"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}