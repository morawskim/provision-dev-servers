resource "github_repository" "php_profiler" {
  name        = "php-profiler"
  description = "[READ-ONLY] PHP Profiler"

  visibility = "public"
  has_issues = false
  has_discussions = false
  has_projects = false
  has_wiki = false
}

resource "github_repository" "php_profiler_cli" {
  name        = "php-profiler-cli"
  description = "[READ-ONLY] PHP Profiler CLI"

  visibility = "public"
  has_issues = false
  has_discussions = false
  has_projects = false
  has_wiki = false
}
