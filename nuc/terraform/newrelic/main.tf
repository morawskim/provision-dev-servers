terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "2.37.0"
    }
  }
}

provider "newrelic" {
  # account_id and api_key are configured via env variables. See README.md
  region = "EU"
}
