output "target_group_arns" {
  value = aws_lb_target_group.target_groups[*].arn
}

output "dns_name" {
  value = aws_lb.app_lb.dns_name
}