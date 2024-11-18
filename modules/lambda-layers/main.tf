resource "aws_lambda_layer_version" "lambda_layers" {
  layer_name          = var.layer_name
  description         = var.description
  compatible_runtimes = var.compatible_runtimes
  filename            = var.filename

  compatible_architectures = var.compatible_architectures
}