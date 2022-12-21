terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.18.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "gitlab" {
  # set GITLAB_TOKEN
}
