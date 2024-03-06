provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "bd-soat3" {
  allocated_storage   = 10
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t2.micro"
  db_name             = "soat3"
  username            = "root"
  password            = "Agos1918"
  skip_final_snapshot = true
  #db_subnet_group_name = aws_db_subnet_group.db_subnet.id
}

# resource "aws_db_subnet_group" "db_subnet" {
#     name = "dbsubnet"
#     subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
# }