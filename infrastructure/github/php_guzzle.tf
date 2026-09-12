resource "github_repository" "php_guzzle_metrics_middleware" {
  name        = "guzzle-metrics-middleware"
  description = "A Guzzle HTTP client middleware that measures the duration of requests."
  visibility = "public"

  has_issues = false
  has_discussions = false
  has_projects = false
  has_wiki = false
  # waiting for https://github.com/integrations/terraform-provider-github/pull/3479
  #has_pull_requests = false
  topics = ["guzzle", "guzzlehttp", "prometheus-metrics", "guzzle-middleware"]
}

resource "github_repository" "php_guzzle_trace_middleware" {
  name        = "guzzle-trace-request-middleware"
  description = "A Guzzle HTTP client middleware that save request and response."
  visibility = "public"

  has_issues = false
  has_discussions = false
  has_projects = false
  has_wiki = false
  # waiting for https://github.com/integrations/terraform-provider-github/pull/3479
  #has_pull_requests = false
  topics = ["guzzle", "guzzlehttp", "guzzle-middleware"]
}

resource "github_repository" "php_guzzle_middlewares" {
  name        = "guzzle-middlewares"
  description = ""
  visibility = "public"

  has_issues = true
  has_discussions = false
  has_projects = false
  has_wiki = false
  topics = ["guzzle", "guzzlehttp", "guzzle-middleware"]
}
