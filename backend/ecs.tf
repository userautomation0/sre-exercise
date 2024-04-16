module "ecs" {
  source = "../infrastructure/modules/ecs"

  name            = "exercise"
  certificate_arn = module.acm.arn
  subnets         = [for pri_subnet in aws_subnet.private : pri_subnet.id]
  environment     = "exerise"
  container_name  = "exercise-ctrl"
  container_port  = "8080"
  vpc_id          = aws_vpc.this.id
  zone_id         = data.aws_route53_zone.hosted_zone.id
  image_name      = "exercise-tmc.co.uk/excercise"
}


