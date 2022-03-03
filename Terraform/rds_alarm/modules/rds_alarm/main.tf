resource "aws_cloudwatch_metric_alarm" "cpu-utilization-alarm" {
  alarm_name                = var.alarm_name
  namespace                 = var.namespace
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  alarm_description         = var.alarm_description
  actions_enabled           = true
  alarm_actions             = var.alarm_actions

  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }
}
