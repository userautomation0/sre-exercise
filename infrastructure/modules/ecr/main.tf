resource "aws_ecr_repository" "repository" {
  for_each = toset(var.ecr_repositories)

  name                 = each.key
  image_tag_mutability = var.image_tag_mutability
  encryption_configuration {
    encryption_type = "KMS"
  }
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "this" {
  for_each = toset(var.ecr_repositories)

  policy = jsonencode({
    Statement = var.statement,
    Version   = "2012-10-17"
  })
  repository = aws_ecr_repository.repository[each.key].name
}

