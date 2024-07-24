output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.db_endpoint
}

output "ec2_instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = module.ec2.instance_ids
}
