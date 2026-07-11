resource "github_repository" "php_guzzle_metrics_middleware" {
  name        = "guzzle-metrics-middleware"
  description = "A Guzzle HTTP client middleware that measures the duration of requests."
  visibility = "public"

  has_issues = false
  has_discussions = false
  has_projects = false
  has_wiki = false
  topics = ["guzzle", "guzzlehttp", "prometheus-metrics", "guzzle-middleware"]
}
