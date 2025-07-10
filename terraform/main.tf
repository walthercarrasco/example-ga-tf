provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "example" {
  key_name   = "example_key"
  public_key = var.sshkey
}

resource "aws_security_group" "example" {
  name        = "example_security_group"
  description = "Example security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ExampleSecurityGroup"
  }
}

resource "aws_instance" "exampleinstance" {
  ami             = "ami-0d1b5a8c13042c939"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.example.name]
  key_name        = aws_key_pair.example.key_name
  tags = {
    Name = "ExampleInstance"
  }
}

