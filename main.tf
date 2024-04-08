module "vpc_test" {
  source = "./modules"
//  vpc_cidr_block = var.cidr_block
//  name_vpc = var.vpc_name
//  subnetname = var.vpc_Subnetname
 instance_name = var.instance_name
  ami_id = var.ami_id
}