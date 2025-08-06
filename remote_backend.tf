resource "aws_s3_bucket" "terraform_state_dev" {
  bucket = "publiq-dev-s3-bucket"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = "Terraform State Dev"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "terraform_state_prod" {
  bucket = "publiq-prod-s3-bucket"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = "Terraform State Prod"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_versioning" "versioning_dev" {
  bucket = aws_s3_bucket.terraform_state_dev.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "versioning_prod" {
  bucket = aws_s3_bucket.terraform_state_prod.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_dev" {
  bucket = aws_s3_bucket.terraform_state_dev.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_prod" {
  bucket = aws_s3_bucket.terraform_state_prod.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks_dev" {
  name         = "terraform-lock-dev"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table Dev"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "terraform_locks_prod" {
  name         = "terraform-lock-prod"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table Prod"
    Environment = "Prod"
  }
}

output "s3_bucket_dev_arn" {
  value = aws_s3_bucket.terraform_state_dev.arn
}

output "s3_bucket_prod_arn" {
  value = aws_s3_bucket.terraform_state_prod.arn
}

output "dynamodb_table_dev_name" {
  value = aws_dynamodb_table.terraform_locks_dev.name
}

output "dynamodb_table_prod_name" {
  value = aws_dynamodb_table.terraform_locks_prod.name
}