module "vpc" {
  source = "./modules/app"
  ami = var.ami
  instancetype = var.instancetype
  instancename = var.instancename
  cidr_block  = var.vpc_cidr_block
  vpcname = var.vpc_name
  subnet_name = var.subnet_name
  default_vpc_id = var.default_vpc_id
  peer_conn = var.peer_conn
  routename = var.routename
  default_vpc_cidr_block=var.default_vpc_cidr_block
  default_route_table_id=var.default_route_table_id
  default_peerConn = var.default_peerConn
}

