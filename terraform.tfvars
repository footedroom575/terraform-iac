# modify below to suit as per requirements
vpc_name            = "Energy Microservices Project"
vpc_cidr            = "10.0.0.0/20"
public_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets     = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
azs                 = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
allowed_ips_for_ssh = ["88.88.88.88/32"] # dummy ip -- add your own ip with /32 cidr

instance_names = ["heating-microservice", "lights-microservice", "status-microservice"]
type           = "t2.micro"
key_name       = "mykeyname"
amis           = ["ami-02ffXXXXXXXXX", "ami-0bf1XXXXXXXXX", "ami-0ddfXXXXXXXXX"]
tg_names       = ["app1-tg", "app2-tg", "app3-tg"] # random values
tg_hc_paths    = ["/api/app1/hc", "/api/app2/hc", "/api/app3/hc"]
lb_rule_paths  = ["/api/app1", "/api/app2", "/api/app3"]
lb_name        = "test-lb"
lt_data = [
  {
    name             = "app1-lt"
    min_size         = 1
    max_size         = 3
    desired_capacity = 1
    }, {
    name             = "app2-lt"
    min_size         = 1
    max_size         = 3
    desired_capacity = 1
    }, {
    name             = "app3-lt"
    min_size         = 1
    max_size         = 3
    desired_capacity = 1
}]
