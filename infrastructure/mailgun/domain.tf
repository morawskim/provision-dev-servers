data "mailgun_domain" "mmorawski" {
  name = "mailgun.morawskim.pl"
}

resource "mailgun_domain_credential" "notifications" {
    domain = data.mailgun_domain.mmorawski.name
    login = "notifications"
    password = "initialpassword!df#D585"
    region = "us1"

    lifecycle {
        ignore_changes = [ password ]
    }
}
