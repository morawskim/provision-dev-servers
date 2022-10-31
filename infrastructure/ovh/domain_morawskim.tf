locals {
  aliases = {
    hosting: "gienek.hostinghouse.pl.",
    noip: "morawskim.ddns.net.",
    print: "intel.morawskim.pl.",
    kindle: "noip.morawskim.pl.",
    nextcloud: "noip.morawskim.pl.",
    ots: "noip.morawskim.pl.",
    ttrss: "noip.morawskim.pl.",
  }
}

resource "ovh_domain_zone_record" "test" {
  zone      = "morawskim.pl"
  subdomain = "test-tf"
  fieldtype = "A"
  ttl       = "60"
  target    = "192.168.50.50"
}

resource "ovh_domain_zone_record" "intel" {
  zone      = "morawskim.pl"
  subdomain = "intel"
  fieldtype = "A"
  ttl       = "60"
  target    = "192.168.50.50"
}

resource "ovh_domain_zone_record" "rpm" {
  zone      = "morawskim.pl"
  subdomain = "rpm"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = "gienek.hostinghouse.pl."
}

resource "ovh_domain_zone_record" "preview" {
  zone      = "morawskim.pl"
  subdomain = "*.preview"
  fieldtype = "CNAME"
  ttl       = "0"
  target    = "noip.morawskim.pl."
}

resource "ovh_domain_zone_record" "alias" {
  for_each  = local.aliases
  zone      = "morawskim.pl"
  subdomain = each.key
  fieldtype = "CNAME"
  ttl       = "0"
  target    = each.value
}
