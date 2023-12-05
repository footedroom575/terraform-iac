output "ec2_ids" {
  value = module.ec2_instance[*].id
}