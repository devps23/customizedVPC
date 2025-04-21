# module "vpc" {
#   source = "./modules/app"
#   ami = var.ami
#   instancetype = var.instancetype
#   instancename = var.instancename
#   cidr_block  = var.vpc_cidr_block
#   vpcname = var.vpc_name
#   subnet_name = var.subnet_name
#   default_vpc_id = var.default_vpc_id
#   peer_conn = var.peer_conn
#   routename = var.routename
#   default_vpc_cidr_block=var.default_vpc_cidr_block
#   default_route_table_id=var.default_route_table_id
#   default_peerConn = var.default_peerConn
# }
module "eks"{
  source                    =  "./modules/eks"
  env                       =  var.env
  subnet_id                 =  module.vpc.backend_subnets
  component                 = "eks-cluster"
  kms_key_id                = var.kms_key_id
  vpc_id                    = module.vpc.vpc_id
  bastion_nodes             = var.bastion_nodes
}

