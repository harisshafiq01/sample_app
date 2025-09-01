terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Configure the backend to use a local S3 bucket from LocalStack
  backend "s3" {
    bucket         = "tf-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    endpoint       = "http://localhost:4566"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    force_path_style = true
    access_key     = "test"
    secret_key     = "test"
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-test-bucket-for-iac"
}