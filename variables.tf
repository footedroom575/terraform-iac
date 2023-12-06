variable "vpc_name" {
  type        = string
  description = "Name to be assigned to VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR range of VPC. The subnet CIDRs are dependant on this value."
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR ranges of public subnets created inside VPC."
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR ranges of private subnets created inside VPC."
}

variable "azs" {
  type        = list(string)
  description = "List of Availability Zones for public & private subnets"
}

variable "allowed_ips_for_ssh" {
  type        = list(string)
  description = "IPs to whitelist for SSH access. Using 32 bit CIDR is recommended."
}

variable "instance_names" {
  type        = list(string)
  description = "List of names of EC2 instances"
}

variable "type" {
  type        = string
  description = "Instance type like t2.micro, t3.micro etc"
}

variable "key_name" {
  type        = string
  description = "SSH key name (as stored in AWS)"
}

variable "amis" {
  type        = list(string)
  description = "Amazon Machine Images (AMIs) to create the instances from."
}

variable "db_names" {
  type        = list(string)
  description = "List of names of databases to create for microservices"
}

variable "tg_names" {
  type        = list(string)
  description = "Names of target groups to be linked with Application Load Balancer (ALB)"
}

variable "tg_hc_paths" {
  type        = list(string)
  description = "List of paths used for ALB target group health check i.e. url path of health check endpoint that can be used to identify health/state of application"
}

variable "lb_rule_paths" {
  type        = list(string)
  description = "List of paths used for ALB listener to forward the requests"
}

variable "lb_name" {
  type        = string
  description = "Name of the Application Load Balancer (ALB)"
}

variable "lt_data" {
  description = "Details for auto scaling by each service"
  type = list(object({
    name = string
    desired_capacity = number
    max_size = number
    min_size = number
  }))
  default = []
}