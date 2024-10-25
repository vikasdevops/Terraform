resource "aws_db_instance" "example_rds" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "devops"
  username             = "root"
  password             = "password123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.rds_security_group_id]

#  backup_retention_period = 7
}

output "rds_endpoint" {
  value = aws_db_instance.example_rds.endpoint
}

output "rds_snapshot" {
  value = aws_db_instance.example_rds.latest_restorable_time
}

