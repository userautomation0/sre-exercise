data "aws_caller_identity" "this" {}

data "aws_region" "this" {}

data "aws_availability_zones" "this" {
  state = "available"
}

data "aws_route53_zone" "hosted_zone" {
  name = var.zone_name
}