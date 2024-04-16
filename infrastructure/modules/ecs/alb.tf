resource "aws_lb" "this" {
  name               = "alb-${var.name}"
  internal           = true
  load_balancer_type = "application"

  security_groups = [aws_security_group.security_group_alb.id]
  subnets         = var.subnets

  enable_deletion_protection = true

  tags = {
      Name = "alb-${var.name}"
    }
}

resource "aws_alb_listener" "private_alb_listener_http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group" "this" {
  name        = "tg-${var.name}"
  port        = 8080
  protocol    = "HTTP"
  slow_start  = 120
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    enabled  = true
    interval = 60
    matcher  = "200"
    path     = "/"

  }

  stickiness {
    type = "lb_cookie"
  }
}
