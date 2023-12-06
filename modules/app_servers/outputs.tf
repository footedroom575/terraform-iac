output "ec2_ids" {
  value = module.ec2_instance[*].id
  description = "List of IDs of the EC2 instances"
}