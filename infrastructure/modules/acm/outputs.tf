output "arn" {
  description = "ARN of the created certificate"
  value       = aws_acm_certificate_validation.this.certificate_arn
}
