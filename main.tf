

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
}

variable "region" {
  type = string
}

provider "aws" {
  region     = var.region
  shared_credentials_file = "./secrets"
}

