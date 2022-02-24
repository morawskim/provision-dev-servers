resource "newrelic_alert_policy" "default" {
  name = "Default alert policy"
}

resource "newrelic_alert_channel" "email" {
  name = "Default email channel"
  type = "email"

  config {
    recipients              = "marcin@morawskim.pl"
    include_json_attachment = "1"
  }
}

resource "newrelic_alert_policy_channel" "golden_signals" {
  policy_id   = newrelic_alert_policy.default.id
  channel_ids = [newrelic_alert_channel.email.id]
}

resource "newrelic_infra_alert_condition" "cpu_alert" {
  policy_id  = newrelic_alert_policy.default.id
  name       = "High CPU usage"
  type       = "infra_metric"
  event      = "SystemSample"
  select     = "cpuPercent"
  comparison = "above"

  critical {
    duration      = "10"
    value         = 90
    time_function = "all"
  }

  warning {
    duration      = "5"
    value         = 80
    time_function = "all"
  }
}

resource "newrelic_infra_alert_condition" "memory_alert" {
  policy_id  = newrelic_alert_policy.default.id
  name       = "High Memory Utilisation"
  type       = "infra_metric"
  event      = "SystemSample"
  select     = "memoryFreePercent"
  comparison = "below"

  critical {
    duration      = "5"
    value         = 10
    time_function = "all"
  }

  warning {
    duration      = "5"
    value         = 15
    time_function = "all"
  }
}

resource "newrelic_infra_alert_condition" "disk_alert" {
  policy_id  = newrelic_alert_policy.default.id
  name       = "High Disk Utilisation"
  type       = "infra_metric"
  event      = "SystemSample"
  select     = "diskFreePercent"
  comparison = "below"

  critical {
    duration      = 5
    value         = 5
    time_function = "all"
  }

  warning {
    duration      = 5
    value         = "15"
    time_function = "all"
  }
}

resource "newrelic_infra_alert_condition" "host_not_reporting" {
  policy_id  = newrelic_alert_policy.default.id
  name      = "Host Not Reporting"
  type      = "infra_host_not_reporting"

  critical {
    duration = 15
  }
}
