resource "aws_instance" "app" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  user_data     = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo amazon-linux-extras install nginx1.12 -y
                sudo service nginx start
                EOF

  tags = {
    Name = "AppServer-${count.index}"
  }
}

output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.app[*].id
}
