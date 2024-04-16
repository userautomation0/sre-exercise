variable "domain_name" {
  type        = string
  description = "The full domain name to create the certificate for."
}

variable "zone_id" {
  type        = string
  description = "ID of the Public Zone to create the CNAME Records under."
}
