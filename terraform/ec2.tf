resource "aws_instance" "ec2_instance" {
  ami                    = "ami-0706a79e169de19a2"
  subnet_id              =  aws_subnet.pub_subnet.id
  instance_type          = "t2.micro"
  iam_instance_profile   = "ecs-agent" 
  vpc_security_group_ids = [aws_security_group.ecs_sg.id] 
  key_name               = "testejseguros" 
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = "#!/bin/bash\necho ECS_CLUSTER=ECSJSeguros >> /etc/ecs/ecs.config && sudo yum update -y && sudo start docker.service"
  monitoring             = false
  root_block_device      {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }
  capacity_reservation_specification    {
    capacity_reservation_preference = "none"
  }

  tags = {
    Name                   = "ecs-ec2_instance"
}
}