bucket         = "publiq-prod-s3-bucket"
key            = "prod/terraform.tfstate"
region         = "us-west-1"
encrypt        = true
dynamodb_table = "terraform-lock-prod"