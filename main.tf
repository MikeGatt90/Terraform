terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-07f6d680860393307"]
  subnet_id              = "subnet-072c908573b68f831"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
