resource "aws_instance" "web" {
  ami             = "ami-0e53db6fd757e38c7" # Replace with valid AMI ID
  instance_type   = "t2.micro"
  subnet_id       = var.public_subnet_id
  security_groups = [var.ec2_security_group_id]
  tags = {
    Name = "devops_prd"
  }
  associate_public_ip_address = true
}

output "ec2_instance_id" {
  value = aws_instance.web.id
}

