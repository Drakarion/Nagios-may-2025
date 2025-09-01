module "nagios_stack" {
  source = "./modules/nagios_stack"

  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  azs                 = var.azs

  instance_type   = var.instance_type
  key_name        = var.key_name
  bastion_sg_id   = var.bastion_sg_id
  ami_name_prefix = var.ami_name_prefix

  team_number  = var.team_number
  project_name = var.project_name
}

output "app_public_ip" {
  value = module.nagios_stack.app_public_ip
}

output "app_public_dns" {
  value = module.nagios_stack.app_public_dns
}
