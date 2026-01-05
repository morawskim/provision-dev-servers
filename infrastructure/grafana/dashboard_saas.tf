resource "grafana_dashboard" "gitlab_pipelines" {
  config_json = replace(file("dashboard/gitlab-ci-pipelines.json"), "$${DS_PROMETHEUS}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "gitlab_jobs" {
  config_json = replace(file("dashboard/gitlab-ci-jobs.json"), "$${DS_PROMETHEUS}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "node_exporter" {
  config_json = replace(file("dashboard/node-exporter-full.json"), "$${DS_PROMETHEUS}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "nextcloud" {
  config_json = replace(file("dashboard/nextcloud.json"), "$${DS_LOCAL}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "node_exporter_temperatures" {
  config_json = replace(file("dashboard/node-exporter-temperatures.json"), "$${DS_PROMETHEUS}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "mysqld_exporter" {
  config_json = replace(file("dashboard/mysql-overview.json"), "$$datasource", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "smartctl_exporter" {
  config_json = replace(
    replace(file("dashboard/smartctl_exporter.json"), "$${datasource}", local.prometheus_uid),
    "$${DS_VICTORIAMETRICS}",
    local.prometheus_uid
  )
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "smartctl_exporter20204" {
  config_json = replace(file("dashboard/smartctl_exporter-20204.json"), "$${DS_PROMETHEUS}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}


resource "grafana_dashboard" "alertmanager" {
  config_json = replace(file("dashboard/alertmanager.json"), "$${datasource}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "knative_serving_efficiency" {
  config_json = replace(file("dashboard/knative-serving-efficiency.json"), "$${datasource}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}

resource "grafana_dashboard" "knative_serving_reconciler" {
  config_json = replace(file("dashboard/knative-serving-reconciler.json"), "$${datasource}", local.prometheus_uid)
  folder = grafana_folder.saas.id
  overwrite = true
}
