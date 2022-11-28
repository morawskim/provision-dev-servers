resource "grafana_dashboard" "web2kindle" {
  config_json = file("dashboard/web2kindle.json")
  folder = grafana_folder.projects.id
  overwrite = true
}
