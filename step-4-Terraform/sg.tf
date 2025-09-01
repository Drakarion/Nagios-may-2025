resource "aws_security_group" "app" {
  name        = "my-app-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id
  tags        = merge(local.common_tags, { Name = "my-app-sg" })

  # input
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # If bastion_sg_id is specified, we use it, otherwise we allow everyone
    security_groups = length(var.bastion_sg_id) > 0 ? [var.bastion_sg_id] : null
    cidr_blocks     = length(var.bastion_sg_id) == 0 ? ["0.0.0.0/0"] : []
  }

  # output
  egress {
    description = "All egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
