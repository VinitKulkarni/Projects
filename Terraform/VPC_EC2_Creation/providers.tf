terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  #access_key = "key"
  #secret_key = "key"
}
