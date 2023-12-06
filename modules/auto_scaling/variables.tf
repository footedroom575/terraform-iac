

variable "ami_ids" {
  type        = list(string)
  description = "Amazon Machine Image (AMI) ids to for creating launch template"
}

variable "target_group_arns" {
  type        = list(string)
  description = "Target groups ARNs linked with Application Load Balancer for auto-scaling integeration"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name (as stored in AWS)"
}

variable "az" {
  type        = string
  description = "Availability Zone to deploy the Auto-Scaling group in"
}

variable "subnet_id" {
  type        = string
  description = "ID of aws_subnet for configuring the Network Interface of each launch template"
}

variable "sg_ids" {
  type        = list(string)
  description = "Security Group IDs to be linked with each launch template"
}

variable "lt_data" {
  description = "Details for auto scaling by each service"
  type = list(object({
    name             = string
    desired_capacity = number
    max_size         = number
    min_size         = number
  }))
  default = []
}
