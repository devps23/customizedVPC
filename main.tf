module "vpc_test" {
  source = "./modules"
//  vpc_cidr_block = var.cidr_block
//  name_vpc = var.vpc_name
//  subnetname = var.vpc_Subnetname
  ami = var.ami
 instance_type = var.instancetype

}