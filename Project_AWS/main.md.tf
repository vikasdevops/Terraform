provider "aws" {
  region = "us-east-1" # Specify your region
}

# VPC Module
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

# Security Groups Module
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

# EC2 Module
module "ec2" {
  source                = "./modules/ec2"
  public_subnet_id      = module.vpc.public_subnet_id
  ec2_security_group_id = module.security_groups.ec2_sg_id
}

# EC2 AutoScaling Module
module "autoscaling" {
  source                = "./modules/autoscaling"
  public_subnet_ids     = [module.vpc.public_subnet_id]
  ec2_security_group_id = module.security_groups.ec2_sg_id
}

# CloudWatch Module
module "cloudwatch" {
  source               = "./modules/cloudwatch"
  autoscaling_group_id = module.autoscaling.autoscaling_group_id
}

# RDS Module
module "rds" {
  source                = "./modules/rds"
  rds_security_group_id = module.security_groups.rds_sg_id
}

# Outputs for AutoScaling, RDS, and CloudWatch
output "autoscaling_instance_ids" {
  description = "IDs of the instances created by the AutoScaling Group"
  value       = module.autoscaling.autoscaling_group_id
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = module.rds.rds_endpoint
}

output "rds_snapshot" {
  description = "RDS Snapshot ID"
  value       = module.rds.rds_snapshot
}

