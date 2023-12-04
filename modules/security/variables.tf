variable "vpc_id" {
  type        = string
  description = "ID of the VPC to create security groups in."
}

variable "allowed_ips_for_ssh" {
  type = list(string)
}