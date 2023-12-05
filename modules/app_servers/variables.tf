variable "instance_names" {
  type = list(string)
}

variable "type" {
  type = string
}

variable "amis" {
  type = list(string)
}

variable "sg_ids" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}