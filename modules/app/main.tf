resource "aws_instance" "test" {
  ami           = var.ami
  instance_type = var.instancetype
  vpc_security_group_ids = [data.aws_security_group.security.id]
  tags = {
    Name = var.instancename
  }
}
data "aws_security_group" "security"{
  name = "allow-all"
}
resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr_block
  tags = {
    Name = var.vpcname
  }
}
