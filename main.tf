terraform {
  required_providers {
<<<<<<< HEAD
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
=======
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.23.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count   = 2
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = 2
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    # external = 1880
  }
}




output "container-name" {
  value = docker_container.nodered_container[*].name
  description = "The name of the container"
}

output "IP-Address" {
  value = [for i in docker_container.nodered_container[*]: join(":",[i.ip_address],i.ports[*]["external"])]
  description = "The IP address and external port of the container"
}

>>>>>>> 6f476520c594032853895dd9fb99b490abc6c29c
