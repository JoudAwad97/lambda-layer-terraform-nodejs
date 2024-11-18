module "lambda-functions" {
  source = "./modules/lambda"

  for_each = local.lambda_functions

  function_name = each.value.function_name
  filename      = "${path.module}/dist/${each.value.path}/function.zip"
  handler       = each.value.handler
  runtime       = each.value.runtime
  timeout       = each.value.timeout

  layers = each.value.layers

  environment_variables = each.value.environment_variables
  tags                  = each.value.tags

  architectures = each.value.architectures
}

# Zip up the lambda functions
data "archive_file" "lambda_functions" {
  for_each    = local.lambda_functions
  type        = "zip"
  source_dir  = "${path.module}/lambda-functions/${each.value.path}"
  output_path = "${path.module}/dist/${each.value.path}/function.zip"
}

locals {
  lambda_functions = {
    "function-1" = merge(local.default_lambda_values, {
      function_name = "function-1",
      path          = "function-1",
      handler       = "function-1.handler",
      layers        = [module.lambda-layers["pg"].arn, module.lambda-layers["axios"].arn],
      environment_variables = {
        "ENV_VAR_1" = "value-1",
      },
      tags = {
        "tag-1" = "value-1",
      }
    }),
    "function-2" = merge(local.default_lambda_values, {
      function_name = "function-2",
      path          = "function-2",
      handler       = "function-2.handler",
      layers        = [module.lambda-layers["pg"].arn, module.lambda-layers["axios"].arn],
      environment_variables = {
        "ENV_VAR_2" = "value-2",
      },
      tags = {
        "tag-2" = "value-2",
      }
    })
  }

  default_lambda_values = {
    layers                = []
    architectures         = ["x86_64"]
    environment_variables = {}
    timeout               = 20
    runtime               = "nodejs20.x",
    tags                  = {}
  }
}