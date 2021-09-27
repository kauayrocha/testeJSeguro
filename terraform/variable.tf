
#------ EC2 ---------

variable "ami" {
    type = map

    default = {
        "us-east-1" = "ami-0706a79e169de19a2"
    }
  
}

variable "key_name" {
    type = map
    default = {
        "key1" = "testejseguros"
        "key2" = "teste2"
    }
  
}


# ----- ECS-------------
variable "RepositoryECR" {
    type    = string
    default = "juntoseguros"
    
}

variable "ECSClusterName" {
    type = map
    default = {
        "ClusterECSJunto-01" = "ECSJSeguros"
        "ClusterECSJunto-02" = "ECSJSeguros02"
    }

  
}
