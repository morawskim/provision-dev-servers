variable "passphrase" {
   type = string
   sensitive = true
}

terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.18.0"
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
      # fallback {
      #   method = method.unencrypted.migrate
      # }
    }
  }
}

provider "gitlab" {
  # set GITLAB_TOKEN
}
