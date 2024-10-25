variable "public_subnet_ids" {
  description = "The subnet IDs for the AutoScaling Group"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "The Security Group ID for EC2 instances"
  type        = string
}

