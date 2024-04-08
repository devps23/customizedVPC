module "vpc" {
  source = "./modules/app"
  ami = var.ami
  instancetype = var.instancetype
  instancename = var.instancename




}