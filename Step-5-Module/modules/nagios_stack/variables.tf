variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type    = string
  default = null
}

variable "bastion_sg_id" {
  type    = string
  default = ""
}

variable "ami_name_prefix" {
  type = string
}

variable "team_number" {
  type = string
}

variable "project_name" {
  type = string
}
