variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of 3 public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "azs" {
  description = "List of 3 AZ names"
  type        = list(string)
  default     = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "instance_type" {
  description = "EC2 type for app"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Existing EC2 key pair name (для SSH, если нужно)"
  type        = string
  default     = null
}

variable "bastion_sg_id" {
  description = "Security Group ID for SSH (source SG)."
  type        = string
  default     = ""
}

variable "ami_name_prefix" {
  description = "Prefix of the AMI name created in Step 3 (Packer)."
  type        = string
  default     = "nagios-ami"
}

variable "team_number" {
  description = "Team/Group number"
  type        = string
  default     = "5"
}

variable "project_name" {
  description = "Project/Application name"
  type        = string
  default     = "nagios"
}
