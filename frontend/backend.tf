terraform {
  backend "s3" {
    bucket         = "exercise-state-bucket-tmc"
    key            = "frontend/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "exercise-state-dynamodb-tmc"
  }
}