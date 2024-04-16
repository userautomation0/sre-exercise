variable "ecr_repositories" {}
variable "image_tag_mutability" {}

variable "statement" {
  default = [{
    Action    = "ecr:*",
    Principal = [],
  }]
}
