variable "name" {
  type        = string
  description = "Name of the DynamoDB table"
  default     = null
}
variable "attributes" {
  type        = list(map(string))
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties: name - (Required) The name of the attribute, type - (Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  default     = []
}
variable "hash_key" {
  type        = string
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  default     = null
}
variable "range_key" {
  type        = string
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute"
  default     = null
}
variable "billing_mode" {
  type        = string
  description = "Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY_PER_REQUEST"
  default     = "PAY_PER_REQUEST"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}
variable "write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  type        = number
  default     = null
}

variable "read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  type        = number
  default     = null
}
variable "environment" {
  type        = string
  description = "The environment the table will be created for"
}
