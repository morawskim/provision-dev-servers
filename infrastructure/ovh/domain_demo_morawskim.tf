resource "ovh_domain_zone_record" "mx_for_subdomain" {
  zone      = "mdemo.ovh"
  subdomain = "mail"
  fieldtype = "MX"
  ttl       = "60"
  target    = "10 mx1.mail.mdemo.ovh."
}

resource "ovh_domain_zone_record" "demo_mail" {
  zone      = "mdemo.ovh"
  subdomain = "mail"
  fieldtype = "CNAME"
  ttl       = "60"
  target    = "noip.morawskim.pl."
}

resource "ovh_domain_zone_record" "demo_mx" {
  zone      = "mdemo.ovh"
  subdomain = "mx1.mail"
  fieldtype = "A"
  ttl       = "60"
  target    = "78.154.68.48"
}
