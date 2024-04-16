resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = "${var.name}.${data.aws_route53_zone.this.name}"
  type    = "A"

  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = false
  }
}
