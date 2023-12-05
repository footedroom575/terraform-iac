variable "vpc_name" {
  type        = string
  description = "Name for VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR range for VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnets CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets CIDRs"
}

variable "azs" {
  type        = list(string)
  description = "Availabilty Zones"
}

variable "allowed_ips_for_ssh" {
  type        = list(string)
  description = "Allowed IPs for SSHing"
}

variable "instance_names" {
  type = list(string)
}

variable "type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "amis" {
  type = list(string)
}

variable "tg_names" {
  type = list(string)
}

variable "tg_hc_paths" {
  type = list(string)
}

variable "lb_rule_paths" {
  type = list(string)
}

variable "lb_name" {
  type = string
}
