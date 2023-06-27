resource "dockerhub_repository" "opensuse_leap_kde5_devel" {
  name        = "opensuse-leap-kde5-devel"
  namespace   = "morawskim"
  description = "KDE development environment in docker for opensuse leap"
  full_description = ""
}

resource "dockerhub_repository" "opensuse_leap_kde5" {
  name        = "opensuse-leap-kde5"
  namespace   = "morawskim"
  description = "KDE environment in docker for opensuse leap"
  full_description = ""
}

resource "dockerhub_repository" "jsonplaceholder" {
  name        = "jsonplaceholder"
  namespace   = "morawskim"
  description = "JSONPlaceholder is a simple fake REST API for testing and prototyping"
  full_description = <<-EOT
  # JSONPlaceholder

  [JSONPlaceholder](https://jsonplaceholder.typicode.com) is a simple fake REST API for testing and prototyping.

  It's like an [image placeholder](http://placehold.it/) but for web developers.

  JSONPlaceholder is powered by [JSON Server](https://github.com/typicode/json-server).
  EOT
}
