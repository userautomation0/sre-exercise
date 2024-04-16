module "state_bucket" {
  source = "../infrastructure/modules/s3/"

  environment = "exercise"
  bucket_name = "exercise-state-bucket-tmc"
}

module "state_table" {
  source = "../infrastructure/modules/dynamo/"

  environment = "exercise"
  name        = "state-dynamodb-tmc"
  hash_key    = "LockID"
  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}
