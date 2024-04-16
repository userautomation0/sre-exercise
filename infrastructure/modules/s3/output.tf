output "bucket" {
  value       = aws_s3_bucket.this
  description = "The bucket that has been created"
}
output "name" {
  value       = aws_s3_bucket.this.bucket
  description = "The name of the bucket that has been created"
}
