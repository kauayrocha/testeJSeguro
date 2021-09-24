resource "aws_instance" "ec2_instance" {
  ami                    = "ami-0706a79e169de19a2"
  subnet_id              =  "subnet-056a98508f48cded1" 
  instance_type          = "t2.micro"
  iam_instance_profile   = "ecs-agent" 
  vpc_security_group_ids = ["sg-045fc6bc088bbc437"] 
  key_name               = "testejseguros" 
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = "#!/bin/bash\necho ECS_CLUSTER=ECSJSeguros >> /etc/ecs/ecs.config"
  root_block_device      {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }

  tags = {
    Name                   = "ecs-ec2_instance"
}
}