variable "allow_bucket_policy" {
  type        = bool
  description = "Flag to allow additional bucket policies"
  default     = false
}
variable "allow_root" {
  type        = bool
  description = "Flag to allow root access"
  default     = true
}
variable "allow_secure_only" {
  type        = bool
  description = "Flag to allow access only over secure transport"
  default     = true
}
variable "block_public_acls" {
  type        = bool
  description = "Block S3 public ACLS, recommended true"
  default     = true
}
variable "block_public_policy" {
  type        = bool
  description = "Block S3 public policies, recommended true"
  default     = true
}
variable "bucket_name" {
  type        = string
  description = "The name of the bucket to be created"
}
variable "bucket_versioning" {
  description = "Enable or Suspend bucket versioning"
  type        = string
  default     = "Enabled"
}
variable "enable_eventbridge" {
  type        = bool
  description = "Enable bucket notifications to eventbridge"
  default     = false
}
variable "ignore_public_acls" {
  type        = bool
  description = "Ignore S3 public ACLS, recommended true"
  default     = true
}
variable "bucket_policy" {
  type        = string
  description = "The IAM policy to be used for the buckets policy"
  default     = ""
}
variable "region" {
  type        = string
  description = "The AWS region to deploy into"
  default     = ""
}
variable "restrict_public_buckets" {
  type        = bool
  description = "Block S3 public buckets, recommended true"
  default     = true
}
variable "vpc_endpoint_s3_id" {
  type        = string
  description = "The S3 VPCE ID to use when accessing the bucket"
  default     = ""
}
variable "enable_acls" {
  type        = bool
  description = "Flag to enable the use of ACLs on the bucket"
  default     = false
}
variable "tags" {
  type        = map(string)
  description = "Common tags to add to all resources"
  default     = {}
}
variable "enable_policies" {
  type        = bool
  description = "Flag to enable the use of standard bucket policies for the bucket"
  default     = true
}
variable "enable_logging" {
  type        = bool
  description = "Flag to enable s3 server access logging on the bucket"
  default     = true
}
variable "environment" {
  type        = string
  description = "The environment the bucket will be created for"
}
