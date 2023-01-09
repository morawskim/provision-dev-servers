terraform {
  required_providers {
    dockerhub = {
      source = "magenta-aps/dockerhub"
      version = "0.0.14"
    }
  }
}

provider "dockerhub" {
  username = "morawskim"
  # use DOCKER_PASSWORD environment variable
}
