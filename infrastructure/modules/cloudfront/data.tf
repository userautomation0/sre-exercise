data "aws_route53_zone" "hosted_zone" {
  name = var.zone_name

  }

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}