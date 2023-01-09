data "local_file" "skopeo_auth" {
    filename = "${path.module}/skopeo_auth.json"
}

resource "gitlab_project_variable" "skopeo_auth" {
  project   = "morawskim/sync-docker-images"
  key       = "SKOPEO_AUTH_FILE"
  value     = data.local_file.skopeo_auth.content
  protected = false
  variable_type = "file"
}

resource "gitlab_pipeline_schedule" "sync" {
  project       = "morawskim/sync-docker-images"
  description   = "Sync container images between different repositories"
  ref           = "main"
  cron          = "22 8 * * *"
  cron_timezone = "Europe/Warsaw"
  active        = true
}
