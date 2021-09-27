resource "aws_vpc" "vpc-terraform" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags       = {
        Name = "Terraform VPC"
    }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "pub_subnet" {
    vpc_id                  = aws_vpc.vpc-terraform.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "TerraformSubnet"
    }

    depends_on = [
        aws_vpc.vpc-terraform
    ]
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc-terraform.id
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc-terraform.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
    
}
resource "aws_route_table_association" "route_table_association" {
    subnet_id      = aws_subnet.pub_subnet.id
    route_table_id = aws_route_table.public.id

    depends_on = [
        aws_subnet.pub_subnet
    ]
}
