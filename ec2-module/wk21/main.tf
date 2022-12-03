#---ec2-module/main.tf

resource "aws_instance" "app_server" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-07f6d680860393307"]
  subnet_id              = "subnet-072c908573b68f831"


  tags = {
    Name = "Week 21 Ec2 Instance"
  }
}