terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  # export GITHUB_TOKEN env variable
}
