resource "aws_db_subnet_group" "default" {
  name       = "mydb-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "MyDBSubnetGroup"
  }
}

resource "aws_db_instance" "default" {
  identifier              = var.db_identifier
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  name                    = var.db_name
  username                = var.db_user
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.default.name
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
  backup_retention_period = 7

  tags = {
    Name = "MyDBInstance"
  }
}

output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.default.endpoint
}
