resource "aws_security_group" "sg-rds" {
  name        = "SG-soat3-rds"
  description = "SOAT3"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}