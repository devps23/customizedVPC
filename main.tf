module "vpc" {
  source = "./modules/app"
  ami = var.ami
  instancetype = var.instancetype
  instancename = var.instancename
  cidr_block  = var.vpc_cidr_block
  vpcname = var.vpc_name
  name = var.subnet_name
}

