terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "/home/irfan/.aws/credentials"
  profile                 = "la"

}

#
#provider "aws" {
#  alias  = "default"
#  region = "us-east-1"
#}
