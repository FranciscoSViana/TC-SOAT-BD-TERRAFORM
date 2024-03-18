module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name                 = "db-soat3-vpc"
  cidr                 = "10.1.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  #enable_dns_hostnames = true
  #enable_dns_support   = true
}

data "aws_availability_zones" "available" {}

resource "aws_db_subnet_group" "db-subnet" {
  name       = "dbsubnet"
  subnet_ids = module.vpc.public_subnets
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "bd-soat3" {
  identifier             = "bd-soat3"
  instance_class         = "db.t2.micro"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  db_name                = "soat3"
  username               = "admin"
  password               = "Agos1918"
  db_subnet_group_name   = aws_db_subnet_group.db-subnet.id
  vpc_security_group_ids = [aws_security_group.sg-rds.id]
  #parameter_group_name = aws_db_parameter_group.bd-soat3.name
  publicly_accessible = true
  skip_final_snapshot = true
}

# resource "aws_db_parameter_group" "bd-soat3" {
#   name   = "my-pg"
#   family = "mysql5.6"

#   parameter {
#     name  = "log_connections"
#     value = "1"
#   }
#}

# resource "aws_db_subnet_group" "db_subnet" {
#     name = "dbsubnet"
#     subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
# }