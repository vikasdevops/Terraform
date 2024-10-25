resource "aws_launch_configuration" "example_lc" {
  name          = "example_lc"
  image_id      = "ami-0c55b159cbfafe1f0" # Replace with valid AMI ID
  instance_type = "t2.micro"
  security_groups = [var.ec2_security_group_id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example_asg" {
  launch_configuration = aws_launch_configuration.example_lc.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  vpc_zone_identifier  = var.public_subnet_ids

  tag {
    key                 = "Name"
    value               = "autoscaling-instance"
    propagate_at_launch = true
  }
}

output "autoscaling_group_id" {
  value = aws_autoscaling_group.example_asg.id
}

