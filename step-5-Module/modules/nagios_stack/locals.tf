locals {
  common_tags = {
    Name        = "my-app"
    Environment = var.region
    Team        = var.team_number
    Project     = var.project_name
  }
}
