resource "aws_ecs_cluster" "fargate" {
  name = "fargate"
  capacity_providers = ["FARGATE"]
}
