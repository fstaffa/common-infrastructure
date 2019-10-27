terraform {
  required_version = ">= 0.12.6"
}

provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-fstaffa"
    region         = "eu-west-1"
    key            = "common/aws"
  }
}
