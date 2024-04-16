resource "aws_cloudwatch_log_group" "this" {
  name              = "cwlg-${var.name}-ecs"
  retention_in_days = 30

  tags ={
      Name = "cwlg-${var.name}-ecs"
    }
}

resource "aws_ecs_cluster" "this" {
  name = "ecs-${var.name}"

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"
      log_configuration {
        cloud_watch_log_group_name = "cwlg-${var.name}-ecs"
      }
    }
  }
}

resource "aws_ecs_service" "this" {
  name                              = "ecss-${var.name}"
  cluster                           = aws_ecs_cluster.this.id
  task_definition                   = aws_ecs_task_definition.this.arn
  desired_count                     = var.desired_count
  health_check_grace_period_seconds = 120
  launch_type                       = "FARGATE"
  enable_execute_command            = true

  lifecycle {
    ignore_changes = [desired_count]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.security_group_common_protocols.id]
    subnets          = var.subnets

  }
  tags = {
      Name = "ecss-${var.name}"
    }
}


resource "aws_ecs_task_definition" "this" {
  family                   = "ecst-${var.name}"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 1024
  execution_role_arn       = aws_iam_role.execution_role.arn
  task_role_arn            = aws_iam_role.task_role.arn
  container_definitions = jsonencode([
    {
      name      = "exercise-ctrl",
      image     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${var.image_name}:latest",
      essential = true,
      portMappings = [
        {
          containerPort = 8080
        }
      ],
      linuxParameters = {
        initProcessEnabled = true
      },
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-group"         = "cwlg-${var.name}-ecs",
          "awslogs-region"        = data.aws_region.current.name,
          "awslogs-stream-prefix" = "ecst-${var.name}"
        }
      }
    }
  ])
  network_mode = "awsvpc"
  tags = {
      Name = "ecst-${var.name}"
    }
}
