
// vpc creation
module "vpc" {
  source = "./modules/vpc"

  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

// security setup
module "security" {
  source = "./modules/security"

  vpc_id              = module.vpc.vpc_id
  allowed_ips_for_ssh = var.allowed_ips_for_ssh
}