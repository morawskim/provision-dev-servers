resource "grafana_dashboard" "web2kindle" {
  config_json = replace(file("dashboard/web2kindle.json"), "$${DS_GRAFANACLOUD-MORAWSKIM-PROM}", local.prometheus_uid)
  folder = grafana_folder.projects.id
  overwrite = true
}
