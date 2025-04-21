
module "eks"{
  source                    =  "./modules/eks"
  env                       =  var.env
  subnet_id                 =  module.vpc.backend_subnets
  component                 = "eks-cluster"
  kms_key_id                = var.kms_key_id
  vpc_id                    = module.vpc.vpc_id
  bastion_nodes             = var.bastion_nodes
}

