  locals {
  egress_rules_sg = {
    "dns" = {
      from_port = 53
      to_port   = 53
      protocol  = "udp"
    }
    "http" = {
      from_port = 8080
      to_port   = 8080
      protocol  = "tcp"
    }
    "https" = {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
    }
  }

  ingress_rules_sg = {
    "http" = {
      from_port = 8080
      to_port   = 8080
      protocol  = "tcp"
    }
    "https" = {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
    }
  }

  alb_ingress_rules_sg = {
    "http" = {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
    }
    "https" = {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
    }
  }
  }