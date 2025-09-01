resource "aws_security_group" "app" {
  name        = "my-app-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id
  tags        = merge(local.common_tags, { Name = "my-app-sg" })

  # --- INGRESS ---

  # HTTP (80) — Nagios UI через Apache
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH (22) — только с bastion SG, если задан; иначе open (как в твоих ДЗ)
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # Если var.bastion_sg_id указан — ограничиваем по SG
    security_groups = length(var.bastion_sg_id) > 0 ? [var.bastion_sg_id] : null

    # Если не указан — открываем всем (чтобы не блокировать доступ на этапе обучения)
    cidr_blocks     = length(var.bastion_sg_id) == 0 ? ["0.0.0.0/0"] : []
  }

  # --- EGRESS ---

  # Разрешить весь исходящий трафик (по умолчанию)
  egress {
    description = "All egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
