terraform {
  required_providers {
    auth0 = {
      source = "auth0/auth0"
      version = "0.45.0"
    }
  }
}

provider "auth0" {
  # Configuration options
}
