resource "aws_security_group" "sg-soat3" {
  name        = "SG-SOAT3"
  description = "SOAT3"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Sonar"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

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