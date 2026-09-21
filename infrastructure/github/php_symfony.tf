resource "github_repository" "php_sf_messenger_metrics_middleware" {
  name        = "sf-messenger-metrics-middleware"
  description = "Provides a middleware for Symfony Messenger to collect metrics."
  visibility = "public"

  has_issues = false
  has_discussions = false
  has_projects = false
  has_wiki = false
  # waiting for https://github.com/integrations/terraform-provider-github/pull/3479
  #has_pull_requests = false
  topics = ["symfony", "messenger", "prometheus-metrics", "middleware"]
}
