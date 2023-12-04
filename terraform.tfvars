vpc_name            = "Energy Microservices Project"
vpc_cidr            = "10.0.0.0/20"
public_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets     = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
azs                 = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
allowed_ips_for_ssh = ["88.88.88.88/32"] # dummy ip -- add your own ip with /32 cidr