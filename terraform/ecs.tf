resource "aws_ecs_cluster" "ecs-juntoseguros" {
  name = "ECSJSeguros"

  setting {
    name  = "containerInsights"
    value = "disabled"
    
  }
}