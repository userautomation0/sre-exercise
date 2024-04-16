# The VPC ID
output "id" {
  value = aws_vpc.this.id
}

# A comma-separated list of public subnet IDs.
output "public_subnets" {
  value = [for pub_subnet in aws_subnet.public : pub_subnet.id]
}

# A comma-separated list of private subnet IDs.
output "private_subnets" {
  value = [for pri_subnet in aws_subnet.private : pri_subnet.id]
}

output "certificate_arn" {
  value = module.acm.arn
}
