module "vpc" {
  source = "./modules/app"
  ami = var.ami
  instancetype = var.instancetype
  instancename = var.instancename
  cidr_block  = var.vpc_cidr_block
  vpcname = var.vpc_name
  subnet_name = var.subnet_name
  requester_vpc_id = var.default_vpc_id
  peer_conn = var.peer_conn
}

