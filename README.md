# Terraform Lambda Layer Concept (NodeJS)

This project demonstrates how to provision an AWS Lambda function with Lambda layers and attach these layers to the Lambda function.

The provided code is free to use and is not subject to any licenses.

## Setup

Follow these steps to set up the project:

1. Run the following command to install Lambda layers dependencies:

   ```sh
   sudo bash ./scripts/lambda-layer-dependencies-installer/run.sh
   ```

   Note: You can also use this command in a CI/CD pipeline to install the required dependencies.

2. Ensure that you have authenticated with your AWS provider. This can be done by setting your credentials manually or by assuming a role locally.

3. Install the Terraform CLI. Please refer to [this documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for more information.

4. Run the following commands to start provisioning your infrastructure:

   ```sh
   terraform init
   terraform plan
   terraform apply
   ```

Once these steps are completed, you should be able to access the AWS console. Make sure to complete reading the blog post and follow along.
