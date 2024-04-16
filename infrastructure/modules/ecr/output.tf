output "urls" {
  value = toset([
    for repository_url in aws_ecr_repository.repository : format("https://%s",repository_url.repository_url)
  ])
}