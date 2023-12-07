variable "instance_names" {
  type        = list(string)
  description = "List of names of EC2 instances"
}

variable "type" {
  type        = string
  description = "Instance type like t2.micro, t3.micro etc"
}

variable "amis" {
  type        = list(string)
  description = "Amazon Machine Images (AMIs) to create the instances from."
}

variable "sg_ids" {
  type        = list(string)
  description = "Security groups to link with each instance"
}

variable "key_name" {
  type        = string
  description = "SSH key name (as stored in AWS)"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs to provision the ec2 instances in"
}
