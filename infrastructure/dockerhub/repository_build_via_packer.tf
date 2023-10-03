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

resource "dockerhub_repository" "lorem_space_backend" {
  name        = "lorem-space-backend"
  namespace   = "morawskim"
  description = "lorem.space - placeholder images but useful!"
  full_description = <<-EOT
  # Backend service for https://lorem.space/

  [Lorem.space](https://lorem.space/) is API for placeholder images.

  The difference between this image and [official image](https://github.com/manasky/lorem-server) is very little.
  This image contains one photo, which the backend api can returns.
  This allows to test integration with self-hosted lorem.space for example in package [faker-images](https://github.com/morawskim/faker-images).
  In lorem.space project exists open task [to share image collection](https://github.com/manasky/lorem.space/issues/9).
  When that task will be resolve the shared photos will be added to this container image.
  EOT
}
