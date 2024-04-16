resource "aws_security_group" "security_group_common_protocols" {
  name   = "sgr-${var.name}-common-protocols"
  vpc_id = var.vpc_id
  tags = {
    Name = "sgr-${var.name}-common-protocols"
  }
}

resource "aws_security_group_rule" "egress_ecs" {
  for_each          = local.egress_rules_sg
  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.security_group_common_protocols.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_ecs" {
  for_each                 = local.ingress_rules_sg
  type                     = "ingress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  security_group_id        = aws_security_group.security_group_common_protocols.id
  source_security_group_id = aws_security_group.security_group_alb.id
}
resource "aws_security_group" "security_group_alb" {
  name   = "sgr-${var.name}-alb"
  vpc_id = var.vpc_id

  tags = {
    Name = "sgr-${var.name}-alb"
  }
}

resource "aws_security_group_rule" "alb_ingress" {
  for_each          = local.alb_ingress_rules_sg
  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.security_group_alb.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_egress" {
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.security_group_alb.id
  source_security_group_id = aws_security_group.security_group_common_protocols.id
}
