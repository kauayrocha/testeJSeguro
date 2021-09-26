resource "aws_ecs_cluster" "ecs-juntoseguros" {
  name = "ECSJSeguros"

  setting {
    name  = "containerInsights"
    value = "disabled"
    
  }
}

resource "aws_ecs_task_definition" "task_definition" {
  container_definitions    = data.template_file.task_definition_json.rendered                                                                                                          
  family                   = "junto-task-defination"
  network_mode             = "bridge"
  memory                   = "2048"
  cpu                      = "1024"
  requires_compatibilities = ["EC2"]                                                                                                                                                                                                                                                                                                
} 

data "template_file" "task_definition_json" {
  template = "${file("${path.module}/ecs/task-definition-ecs-jseguro-node.json")}"
}