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
