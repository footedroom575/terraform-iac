variable "vpc_name" {
  type = string
  description = "Name to be assigned to VPC"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR range of VPC. The subnet CIDRs are dependant on this value."
}

variable "public_subnets" {
  type = list(string)
  description = "CIDR ranges of public subnets created inside VPC."
}

variable "private_subnets" {
  type = list(string)
  description = "CIDR ranges of private subnets created inside VPC."
}

variable "azs" {
  type = list(string)
  description = "List of Availability Zones for public & private subnets"
}