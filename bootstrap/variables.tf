variable "ecr_repositories" {}

variable "statement" {
  default = [{
    Action    = "ecr:*",
    Principal = [],
  }]
}
