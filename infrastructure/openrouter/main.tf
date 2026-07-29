terraform {
  required_providers {
    openrouter = {
      source  = "cloudopsworks/openrouter"
      version = "~> 0.2"
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
       #fallback {
       #  method = method.unencrypted.migrate
       #}
    }
  }
}

provider "openrouter" {
  # set ENV variable OPENROUTER_API_KEY
  # api_key = var.openrouter_management_key
}

variable "passphrase" {
   type = string
   sensitive = true
}
