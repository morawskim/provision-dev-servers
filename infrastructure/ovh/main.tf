terraform {
  required_providers {
    ovh = {
      source = "ovh/ovh"
      version = "0.22.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  # set env variable CLOUDFLARE_API_TOKEN
}

provider "ovh" {
  endpoint = "ovh-eu"

  # set env variables: OVH_APPLICATION_KEY OVH_APPLICATION_SECRET OVH_CONSUMER_KEY
}
