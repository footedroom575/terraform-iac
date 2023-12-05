
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

// databases setup
module "database" {
  source = "./modules/databases"

  db_names = ["lighting-microservice", "heating"]
}

// microservices setup
module "app_servers" {
  source = "./modules/app_servers"

  instance_names = var.instance_names
  type           = var.type
  key_name       = var.key_name
  amis           = var.amis
  sg_ids         = module.security.sg_ids
  subnet_ids     = module.vpc.public_subnet_ids
}

// Load Balancer setup
module "load-balancer" {
  source = "./modules/load-balancer"

  vpc_id        = module.vpc.vpc_id
  instance_ids  = module.app_servers.ec2_ids
  sg_ids        = module.security.sg_ids
  subnet_ids    = module.vpc.public_subnet_ids
  tg_names      = var.tg_names
  tg_hc_paths   = var.tg_hc_paths
  lb_name       = var.lb_name
  lb_rule_paths = var.lb_rule_paths
}
