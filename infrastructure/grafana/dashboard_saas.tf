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
