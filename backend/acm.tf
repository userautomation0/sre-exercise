module "acm" {
  source = "../infrastructure/modules/acm"

  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.hosted_zone.id
}
 