terraform {
  required_providers {
    ovh = {
      source = "ovh/ovh"
      version = "0.22.0"
    }
  }
}

provider "ovh" {
  endpoint = "ovh-eu"

  # set env variables: OVH_APPLICATION_KEY OVH_APPLICATION_SECRET OVH_CONSUMER_KEY
}
