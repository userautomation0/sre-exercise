resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    {
      Name = var.bucket_name
    },
    var.tags
  )
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status     = var.bucket_versioning
    mfa_delete = "Disabled"
  }
}

resource "aws_s3_bucket_acl" "this" {
  count = var.enable_acls ? 1 : 0

  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_bucket_notification" "this" {
  count       = var.enable_eventbridge ? 1 : 0
  bucket      = aws_s3_bucket.this.id
  eventbridge = true
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.enable_policies ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.combined.json
}

resource "aws_s3_bucket_public_access_block" "this" {
  depends_on              = [aws_s3_bucket.this]
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_metric" "this" {
  bucket = aws_s3_bucket.this.bucket
  name   = "EntireBucket"
}

