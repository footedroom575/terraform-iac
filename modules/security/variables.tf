variable "vpc_id" {
  type        = string
  description = "ID of the VPC to create security groups in."
}

variable "allowed_ips_for_ssh" {
  type        = list(string)
  description = "IPs to whitelist for SSH access. Using 32 bit CIDR is recommended."
}
