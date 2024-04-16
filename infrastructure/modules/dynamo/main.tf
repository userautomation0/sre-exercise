resource "aws_dynamodb_table" "this" {
  name           = "${var.environment}-${var.name}"
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  dynamic "attribute" {
    for_each = var.attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
