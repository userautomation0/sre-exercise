output "state_bucket_name" {
  value       = module.state_bucket.name
  description = "The name of the bucket that has been created"
}

output "state_dynamodb_name" {
  value       = module.state_table.id
  description = "The name of the table that has been created"
}

output "ecr" {
  value       = module.private_repositories.urls
  description = "The urls of the repositories that have been created"
}