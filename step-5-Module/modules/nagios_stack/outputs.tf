output "app_public_ip" {
  description = "Public IP of the Nagios instance"
  value       = aws_instance.app.public_ip
}

output "app_public_dns" {
  description = "Public DNS"
  value       = aws_instance.app.public_dns
}
