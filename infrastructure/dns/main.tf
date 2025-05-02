variable "passphrase" {
   type = string
   sensitive = true
}

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
  encryption {
    method "unencrypted" "migrate" {}
    key_provider "pbkdf2" "mykey" {
      passphrase = var.passphrase
    }

    method "aes_gcm" "new_method" {
      keys = key_provider.pbkdf2.mykey
    }

    state {
      method = method.aes_gcm.new_method
      enforced = true
#       fallback {
#         method = method.unencrypted.migrate
#       }
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
