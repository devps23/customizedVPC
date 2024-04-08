module "vpc_test" {
  source = "./modules/app"
  ami = var.ami
  instancetype = var.instancetype
  instancename = var.instancename




}