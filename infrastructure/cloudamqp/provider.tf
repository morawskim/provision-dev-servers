variable "passphrase" {
   type = string
   sensitive = true
}

terraform {
  required_providers {
    cloudamqp = {
      source = "cloudamqp/cloudamqp"
      version = "1.27.0"
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

provider "cloudamqp" {
  # use env variable CLOUDAMQP_APIKEY
  #apikey          = var.cloudamqp_api_key
}
