resource "auth0_client" "memos" {
  name            = "memos"
  description     = "memos"
  app_type        = "regular_web"
  callbacks       = ["https://memos.morawskim.pl/auth/callback"]
  oidc_conformant = true
  cross_origin_auth = true

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_connection_client" "memos" {
  connection_id = auth0_connection.webpage2kindle.id
  client_id     = auth0_client.memos.id
}
