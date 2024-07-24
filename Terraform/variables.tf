variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "db_identifier" {
  description = "The database identifier"
  default     = "mydb"
}

variable "db_name" {
  description = "The database name"
  default     = "mydb"
}

variable "db_user" {
  description = "The database username"
  default     = "admin"
}

variable "db_password" {
  description = "The database password"
  type        = string
  default     = "admin123"
}
