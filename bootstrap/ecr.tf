module "private_repositories" {
  source = "../infrastructure/modules/ecr"

  ecr_repositories     = var.ecr_repositories
  image_tag_mutability = "MUTABLE"
  statement = [
    {
      Sid    = "Access full access to Shared account",
      Effect = "Allow",
      Principal = {
        AWS = [
          "arn:aws:iam::678233123083:root"
        ]
      },
      Action = "ecr:*"
    }
  ]
}