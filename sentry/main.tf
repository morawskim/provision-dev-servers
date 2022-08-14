terraform {
  required_providers {
    sentry = {
      source = "jianyuan/sentry"
      version = "0.9.3"
    }
  }
}

provider "sentry" {
  # token is stored in env variable SENTRY_AUTH_TOKEN
  #token = "a...b"

  # for self-hosting Sentry. The URL format must be in the format https://[hostname]/api/.
  # base_url = "https://sentry.example.com/api/"
}

data "sentry_organization" "mmorawski" {
  # Taken from URL: https://sentry.io/organizations/[slug]/issues/
  slug = "marcin-morawski"
}

resource "sentry_team" "main" {
  organization = data.sentry_organization.mmorawski.id
  name         = "private"
}
