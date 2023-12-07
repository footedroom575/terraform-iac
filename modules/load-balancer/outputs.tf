output "target_group_arns" {
  value       = aws_lb_target_group.target_groups[*].arn
  description = "ARNs of target groups linked to Application Load Balancer (ALB)"
}

output "dns_name" {
  value       = aws_lb.app_lb.dns_name
  description = "DNS Name of ALB (Application Load Balancer) (accessible after successful creation)"
}
