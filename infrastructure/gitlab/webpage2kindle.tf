resource "gitlab_project_variable" "webpage2kindle_api_url" {
  project   = "morawskim/webpage2kindle"
  key       = "API_URL_FOR_WEB_EXTENSION"
  value     = "https://kindle.morawskim.pl:32443/web-extension"
  protected = false
  variable_type = "env_var"
}
