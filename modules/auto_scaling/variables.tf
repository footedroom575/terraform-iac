variable "lt_names" {
  type = list(string)
}

variable "ami_ids" {
  type = list(string)
}

variable "target_group_arns" {
  type = list(string)
}

variable "ssh_key_name" {
  type = string
}

variable "az" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "sg_ids" {
  type = list(string)
}

variable "desired_capacity" {
    type = string
}

variable "max_size" {
    type = string
}

variable "min_size" {
    type = string
}
