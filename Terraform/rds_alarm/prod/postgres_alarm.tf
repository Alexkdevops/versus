module "rds_alarm_module" {
  source                    = "../modules/rds_alarm"
  alarm_name                = "Mysql_prod_cpu-over_80"
  namespace                 = "AWS/RDS"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  metric_name               = "CPUUtilization"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Alarm if CPU > 80% for 5 minutes"
  actions_enabled           = true
  alarm_actions             = ["arn:aws:sns:us-east-1:036692858685:HighPriority-CPUUtilizationExceeded"]
  
  dimensions = {
    DBInstanceIdentifier    = "mysql-prod"
  }
}
