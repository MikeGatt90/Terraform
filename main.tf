terraform {
  required_providers {
<<<<<<< HEAD
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
=======
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
>>>>>>> f912fe203f79b0b896e0195ac2db326c5a6c5913
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure the AWS VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}

# Configure 2 public subnets
resource "aws_subnet" "public_1" {
    vpc_id = "aws_vpc.vpc.id"
    cidr_block = "10.0.1/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    
    tag = {
        Name = "Public_Subnet_1"
    }   
}

resource "aws_subnet" "public_2" {
    vpc_id = "aws_vpc.vpc.id"
    cidr_block = "10.0.2/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
    
    tag = {
        Name = "Public_Subnet_2"
    }   
}

# Configure 2 private subnets
resource "aws_subnet" "private_1" {
    vpc_id = "aws_vpc.vpc.id"
    cidr_block = "10.0.3/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    
    tag = {
        Name = "Private_Subnet_1"
    }   
}

resource "aws_subnet" "private_1" {
    vpc_id = "aws_vpc.vpc.id"
    cidr_block = "10.0.3/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    
    tag = {
        Name = "Private_Subnet_1"
    }   
}

<<<<<<< HEAD
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
=======
>>>>>>> 6f476520c594032853895dd9fb99b490abc6c29c
>>>>>>> f912fe203f79b0b896e0195ac2db326c5a6c5913
