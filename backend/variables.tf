variable "zone_name" {
  type        = string
  description = "The route53 zone to create"
}

variable "az_limit" {
  type        = number
  description = "The number of AZs to deploy subnets into"
  default     = 0
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}
variable "vpc_name" {
  type        = string
  description = "The name of the VPC."
}
variable "enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true"
  default     = true
}
variable "domain_name" {
  type        = string
  description = "The domain name of the Distribution"
}
