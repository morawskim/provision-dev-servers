resource "auth0_client" "webpage2kindle" {
  name            = "webpage2kindle"
  description     = "webpage2kindle"
  app_type        = "regular_web"
  callbacks       = ["http://localhost:4200/login/check-auth0", "https://kindle.morawskim.pl/login/check-auth0"]
  oidc_conformant = true
  cross_origin_auth = true

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_connection" "webpage2kindle" {
  name                 = "webpage2kindle"
  is_domain_connection = true
  strategy             = "auth0"

  options {
    password_policy                = "good"
    brute_force_protection         = true
    enabled_database_customization = false
    import_mode                    = false
    requires_username              = false
    disable_signup                 = true
    password_history {
      enable = true
      size   = 3
    }

    password_no_personal_info {
      enable = true
    }

    password_dictionary {
      enable     = true
      dictionary = ["password", "admin", "1234"]
    }

    password_complexity_options {
      min_length = 10
    }

    mfa {
      active                 = true
      return_enroll_settings = false
    }
  }
}

resource "auth0_connection_client" "webpage2kindle" {
  connection_id = auth0_connection.webpage2kindle.id
  client_id     = auth0_client.webpage2kindle.id
}
