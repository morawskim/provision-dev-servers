terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.21.1"
    }
  }
}

provider "github" {
  # export GITHUB_TOKEN env variable
}
