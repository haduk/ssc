provider "aws" {
  region = var.region
}

module "network" {
  source = "./network"
}

module "ec2" {
  source       = "./ec2"
  vpc_id       = module.network.vpc_id
  subnet_ids   = module.network.public_subnet_ids
  instance_type = var.instance_type
}

module "alb" {
  source       = "./alb"
  vpc_id       = module.network.vpc_id
  subnet_ids   = module.network.public_subnet_ids
  target_ids   = module.ec2.instance_ids
}

module "rds" {
  source        = "./rds"
  vpc_id        = module.network.vpc_id
  subnet_ids    = module.network.private_subnet_ids
  db_identifier = var.db_identifier
  db_name       = var.db_name
  db_user       = var.db_user
  db_password   = var.db_password
}
