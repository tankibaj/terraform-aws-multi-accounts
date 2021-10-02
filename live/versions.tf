terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.15"
}


provider "aws" {
  alias  = "foo"
  region = "eu-central-1"
  assume_role {
    role_arn = "arn:aws:iam::846721060099:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias  = "bar"
  region = "eu-central-1"
  assume_role {
    role_arn = "arn:aws:iam::164314368744:role/OrganizationAccountAccessRole"
  }
}
