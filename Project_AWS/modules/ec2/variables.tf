variable "public_subnet_id" {
  description = "The subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "ec2_security_group_id" {
  description = "The security group ID to associate with the EC2 instance"
  type        = string
}

