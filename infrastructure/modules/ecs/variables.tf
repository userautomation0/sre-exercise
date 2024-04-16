variable "desired_count" {
  description = "The number of task containers running"
  type        = number
  default     = 2
}

variable "name" {
  description = "The name of the ecs cluster"
  type        = string
}

variable "environment" {
  description = "The name of your environment"
  type        = string
}

variable "subnets" {
  description = "The subnets in your environment"
  #type        = list(string)
}

variable "vpc_id" {
  description = "The vpc_id"
  type        = string
}

variable "zone_id" {
  description = "The zone_id"
  type        = string
}

variable "container_name" {
  description = "The container name"
  type        = string
}
variable "image_name" {
  description = "The image name"
  type        = string
}
variable "container_port" {
  description = "The container port"
  type        = string
}

variable "certificate_arn" {
  description = "The certificate arn"
  type        = string
}
