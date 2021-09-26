resource "aws_ecs_cluster" "ecs-juntoseguros" {
  name = "ECSJSeguros"

  setting {
    name  = "containerInsights"
    value = "disabled"
    
  }
}

resource "aws_ecs_task_definition" "tsk-node-juntoseguros" {
  container_definitions    = data.template_file.task_definition_json.rendered                                                                                                          
  family                   = "junto-task-defination"
  network_mode             = "bridge"
  memory                   = "500"
  requires_compatibilities = ["EC2"]                                                                                                                                                                                                                                                                                                
} 

data "template_file" "task_definition_json" {
  template = "${file("${path.module}/ecs/task-definition-ecs-jseguro-node.json")}"
}

resource "aws_ecs_service" "node-juntoseguro" {
  cluster                 = aws_ecs_cluster.ecs-juntoseguros.id
  desired_count           = 1     
  launch_type             = "EC2"
  name                    = "service-juntoseguros"
  task_definition         = aws_ecs_task_definition.tsk-node-juntoseguros.arn
  force_new_deployment    = true
  depends_on = [
    aws_ecs_task_definition.tsk-node-juntoseguros
  ]
}