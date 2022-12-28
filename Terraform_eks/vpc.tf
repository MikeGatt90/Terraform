#-------Create VPC for ECS

resource "aws_vpc" "project_ecs" {
  cidr_block = var.cidr

  tags = {
    Name = "Project ECS"
  }
}

#--------Create Private subnets for ECS

resource "aws_subnet" "private_east_1a" {
  vpc_id            = aws_vpc.project_ecs.id
  cidr_block        = var.private_cidr_a
  availability_zone = var.region_a

  tags = {
    Name = "Private East 1a"
  }
}

resource "aws_subnet" "private_east_1b" {
  vpc_id            = aws_vpc.project_ecs.id
  cidr_block        = var.private_cidr_b
  availability_zone = var.region_a

  tags = {
    Name = "Private East 1b"
  }
}