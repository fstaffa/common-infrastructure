locals {
  repository_url = "https://github.com/fstaffa/common-infrastructure"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-fstaffa"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = {
    Repository = local.repository_url
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "serverless_deploy" {
  bucket = "serverless-deploy-fstaffa"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Repository = local.repository_url
  }
}

resource "aws_s3_bucket_public_access_block" "serverless_deploy" {
  bucket = aws_s3_bucket.serverless_deploy.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
