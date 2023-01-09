resource "dockerhub_repository" "webpage2kindle_node_microservice" {
  name        = "webpage2kindle-node-microservice"
  namespace   = "morawskim"
  description = "Part of webpage2kindle project."
  full_description = ""
}

resource "dockerhub_repository" "webpage2kindle_caddy" {
  name        = "webpage2kindle-caddy"
  namespace   = "morawskim"
  description = "Part of webpage2kindle project."
  full_description = ""
}

resource "dockerhub_repository" "webpage2kindle_symfony_app" {
  name        = "webpage2kindle-symfony-app"
  namespace   = "morawskim"
  description = "Part of webpage2kindle project."
  full_description = ""
}
