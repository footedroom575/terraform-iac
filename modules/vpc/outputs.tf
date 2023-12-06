output "vpc_id" {
  value = aws_vpc.main.id
  description = "ID of the Virtual Private Cloud (VPC)"
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
  description = "IDs of all public subnets created inside the VPC."
}