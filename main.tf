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

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

