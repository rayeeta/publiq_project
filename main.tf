module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  environment        = var.environment
  availability_zone  = var.availability_zone
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
  environment   = var.environment
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  my_ip         = var.my_ip
  publiq_ip     = var.publiq_ip
}