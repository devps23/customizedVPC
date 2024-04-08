resource "aws_instance" "test" {
  ami           = var.ami_id
  instance_type = var.instance_name
  vpc_security_group_ids = [data.aws_security_group.security.id]
  tags = {
    Name = var.instance_name
  }
}
data "aws_security_group" "security"{
  name = "allow-all"
}
//resource "aws_vpc" "main" {
//  cidr_block       = var.vpc_cidr_block
//  tags = {
//    Name = var.name_vpc
//  }
//}
//resource "aws_subnet" "subnet" {
//  vpc_id     = aws_vpc.main.id
//  cidr_block = var.vpc_cidr_block
//
//  tags = {
//    Name = var.subnetname
//  }
//}
