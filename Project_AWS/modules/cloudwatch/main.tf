resource "aws_cloudwatch_metric_alarm" "cpu_alarm_high" {
  alarm_name          = "high_cpu_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Triggered when CPU utilization exceeds 80%"
  actions_enabled     = false
  alarm_actions       = []
  dimensions = {
    InstanceId = var.autoscaling_group_id
  }
}

