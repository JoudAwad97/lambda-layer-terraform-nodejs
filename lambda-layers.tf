
# Zip and archive the lambda layers
data "archive_file" "lambda_layers" {
  for_each    = local.lambda_layers_values
  type        = "zip"
  source_dir  = "${path.module}/lambda-functions/layers/${each.value.name}"
  output_path = "${path.module}/dist/layers/${each.value.name}/layer.zip"
}

module "lambda-layers" {
  for_each = local.lambda_layers_values

  source = "./modules/lambda-layers"

  layer_name               = each.value.name
  filename                 = each.value.filename
  description              = each.value.description
  compatible_runtimes      = each.value.compatible_runtimes
  compatible_architectures = each.value.compatible_architectures
}

locals {
  lambda_layers_values = {
    "pg" = {
      name                     = "pg"
      filename                 = "${path.module}/dist/layers/pg/layer.zip"
      description              = "Postgres PG dependency layer"
      compatible_runtimes      = ["nodejs20.x"]
      compatible_architectures = ["x86_64", "arm64"]
    }
    "axios" = {
      name                     = "axios"
      filename                 = "${path.module}/dist/layers/axios/layer.zip"
      description              = "Axios dependency layer"
      compatible_runtimes      = ["nodejs20.x"]
      compatible_architectures = ["x86_64", "arm64"]
    }
  }
}