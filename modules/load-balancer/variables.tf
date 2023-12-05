variable "tg_names" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "sg_ids" {
  type = list(string)
}

variable "lb_rule_paths" {
  type = list(string)
}

variable "tg_hc_paths" {
  type = list(string)
}

variable "instance_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "lb_name" {
  type = string
}