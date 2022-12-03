#--ec2-module/variables.tf

variable "ami_id" {
  type    = string
  default = "ami-0b0dcb5067f052a63"
}

variable "instance" {
  type    = string
  default = "t2.micro"
}