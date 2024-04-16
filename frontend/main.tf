module "cloudfront" {
  source      = "../infrastructure/modules/cloudfront"
  providers   = { aws.us_east_1 = aws.us_east_1 }
  name        = var.name
  domain_name = var.domain_name
  zone_name   = var.zone_name
}