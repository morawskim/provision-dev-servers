resource "auth0_client" "traefik" {
  name            = "traefik"
  description     = "traefik auth forward"
  app_type        = "regular_web"
  callbacks       = ["https://*.i.morawskim.pl:32081/_oauth"]
  oidc_conformant = true
  cross_origin_auth = true

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_connection_client" "traefik" {
  connection_id = auth0_connection.webpage2kindle.id
  client_id     = auth0_client.traefik.id
}
