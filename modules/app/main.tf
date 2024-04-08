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
