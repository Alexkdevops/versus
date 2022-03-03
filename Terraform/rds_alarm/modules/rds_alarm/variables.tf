variable "alarm_name" {
  description = "The descriptive name for the alarm"
  type        = string
}

variable "alarm_description" {
  description = "The description for the alarm"
  type        = string
}

variable "namespace" {
  description = "AWS resource namespace"
  type        = string
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold"
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
}

variable "metric_name" {
  description = "The name for the alarm's associated metric"
  type        = string
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric"
  type        = string
}

variable "threshold" {
  description = "The maximum percentage of CPU utilization"
  type        = number
}

variable "actions_enabled" {
  description = "Instructions whether any action to be triggered"
  type        = bool
}

variable "alarm_actions" {
  description = "List of SNS Topic ARNs to use for notifications."
  type        = list(string)
}

variable "db_instance_identifier" {
  description = "The ID of the source DB instance."
  type        = string
}
