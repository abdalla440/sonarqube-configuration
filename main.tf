
terraform {
  cloud {
    organization = "A-Hannora-Systems"
    workspaces {
      name = "sonarqube-configuration440"
    }
  }

  required_providers {
    
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.56.1"
    }
    
  }

  required_version = ">= 1.2.0"
}



resource "aws_security_group" "instance" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound traffic on port 22"
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Custom port 9000"
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Custom port 5000"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance-sg"
  }
}

resource "aws_instance" "serverI" {
  ami                    = var.ami  # Ubuntu 22.04 LTS AMI
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = var.ssh_key_name
  associate_public_ip_address = true
  tags = {
    Name = "serverI"
  }
}