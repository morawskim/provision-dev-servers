variable "passphrase" {
   type = string
   sensitive = true
}

terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "2.37.0"
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

provider "newrelic" {
  # account_id and api_key are configured via env variables. See README.md
  region = "EU"
}
