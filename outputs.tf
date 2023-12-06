output "Load_Balancer_DNS" {
  value = module.load-balancer.dns_name
  description = "DNS Name of ALB (Application Load Balancer) (accessible after successful creation)"
}