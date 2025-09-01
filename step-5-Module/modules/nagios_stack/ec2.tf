resource "aws_instance" "app" {
  ami                         = data.aws_ami.nagios.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public["a"].id   # allowed to change b/c
  vpc_security_group_ids      = [aws_security_group.app.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(local.common_tags, { Name = "my-app-ec2" })
}
