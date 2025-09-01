data "aws_ami" "nagios" {
  owners      = ["self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.ami_name_prefix}*"]
  }
}