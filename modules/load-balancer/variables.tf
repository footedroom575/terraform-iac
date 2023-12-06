variable "tg_names" {
  type        = list(string)
  description = "Names of target groups to be linked with Application Load Balancer (ALB)"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC to create the Application Load Balancer (ALB) in."
}

variable "sg_ids" {
  type        = list(string)
  description = "IDs of security groups to link with Application Load Balancer (ALB)"
}

variable "lb_rule_paths" {
  type        = list(string)
  description = "List of paths used for ALB listener to forward the requests"
}

variable "tg_hc_paths" {
  type        = list(string)
  description = "List of paths used for ALB target group health check i.e. url path of health check endpoint that can be used to identify health/state of application"
}

# variable "instance_ids" {
#   type = list(string)
#   description = "Ids of ec2 to be attached with ALB"
# }

variable "subnet_ids" {
  type        = list(string)
  description = "IDs of subnets to create the ALB in."
}

variable "lb_name" {
  type        = string
  description = "Name of the Application Load Balancer (ALB)"
}
