locals {
  aliases = {
    hosting: "u100.hostinghouse.pl.",
    noip: "morawskim.ddns.net.",
    print: "intel.morawskim.pl.",
    kindle: "noip.morawskim.pl.",
    nextcloud: "noip.morawskim.pl.",
    ots: "noip.morawskim.pl.",
    ttrss: "noip.morawskim.pl.",
    webmail: "noip.morawskim.pl.",
    jsonplaceholder: "noip.morawskim.pl.",
    matomo: "noip.morawskim.pl.",
    demo: "noip.morawskim.pl.",
    knative-serving: "noip.morawskim.pl.",
    "index": "noip.morawskim.pl.",
    memos: "noip.morawskim.pl.",
    rss-bridge: "noip.morawskim.pl.",
    ha: "noip.morawskim.pl.",
    chat: "noip.morawskim.pl.",
  }
  ovh_ipv4 = "94.23.89.116"
  ovh_ipv6 = "2001:41d0:301:5::100"
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
  target    = "192.168.33.13"
}

resource "ovh_domain_zone_record" "external" {
  zone      = "morawskim.pl"
  subdomain = "external"
  fieldtype = "A"
  ttl       = "60"
  target    = "100.112.232.1"
}

resource "ovh_domain_zone_record" "intel_sshfp_rsa_sha" {
  zone      = "morawskim.pl"
  subdomain = "intel"
  fieldtype = "SSHFP"
  ttl       = "3600"
  target    = "1 1 a70a727f382864473c9a99b33b298e15ecd86e50"
}
resource "ovh_domain_zone_record" "intel_sshfp_rsa_sha256" {
  zone      = "morawskim.pl"
  subdomain = "intel"
  fieldtype = "SSHFP"
  ttl       = "3600"
  target    = "1 2 992caff4bd348ebad5ed45cd874e9b1a508af09ad74039743cb24d8fca83c22f"
}
resource "ovh_domain_zone_record" "intel_sshfp_ecdsa_sha" {
  zone      = "morawskim.pl"
  subdomain = "intel"
  fieldtype = "SSHFP"
  ttl       = "3600"
  target    = "3 1 cb9acc50aa3d239c59d03b771bd1c4e2c26e8f03"
}
resource "ovh_domain_zone_record" "intel_sshfp_ecdsa_sha256" {
  zone      = "morawskim.pl"
  subdomain = "intel"
  fieldtype = "SSHFP"
  ttl       = "3600"
  target    = "3 2 9421ef96d379328a553844c3f21415396010e7f06f77b22d43c07ec9d919c5c0"
}
resource "ovh_domain_zone_record" "intel_sshfp_ed25519_sha" {
  zone      = "morawskim.pl"
  subdomain = "intel"
  fieldtype = "SSHFP"
  ttl       = "3600"
  target    = "4 1 c945deae7d0307c662b6e3c2657aaff54c587a5c"
}
resource "ovh_domain_zone_record" "intel_sshfp_ed25519_sha256" {
  zone      = "morawskim.pl"
  subdomain = "intel"
  fieldtype = "SSHFP"
  ttl       = "3600"
  target    = "4 2 877a0e0eeae584672b6029cd3f40af877a4fd718da1447583ffba5594a8ed309"
}
resource "ovh_domain_zone_record" "moje_cert_pl" {
  zone      = "morawskim.pl"
  #subdomain = "intel"
  fieldtype = "TXT"
  ttl       = "3600"
  target    = "mojecertpl-site-verification-6XFhvOBN6ECE3ex5MHepkimFev0IYnpJ"
}

resource "ovh_domain_zone_record" "morawskim" {
  zone      = "morawskim.pl"
  subdomain = ""
  fieldtype = "A"
  ttl       = "600"
  target    = local.ovh_ipv4
}
resource "ovh_domain_zone_record" "morawskimAAAA" {
  zone      = "morawskim.pl"
  subdomain = ""
  fieldtype = "AAAA"
  ttl       = "600"
  target    = local.ovh_ipv6
}
resource "ovh_domain_zone_record" "rpm" {
  zone      = "morawskim.pl"
  subdomain = "rpm"
  fieldtype = "A"
  ttl       = "600"
  target    = local.ovh_ipv4
}
resource "ovh_domain_zone_record" "rpmAAAA" {
  zone      = "morawskim.pl"
  subdomain = "rpm"
  fieldtype = "AAAA"
  ttl       = "600"
  target    = local.ovh_ipv6
}

resource "ovh_domain_zone_record" "preview" {
  zone      = "morawskim.pl"
  subdomain = "*.preview"
  fieldtype = "CNAME"
  ttl       = "60"
  target    = "noip.morawskim.pl."
}

resource "ovh_domain_zone_record" "internal" {
  zone      = "morawskim.pl"
  subdomain = "*.i"
  fieldtype = "CNAME"
  ttl       = "60"
  target    = "intel.morawskim.pl."
}

resource "ovh_domain_zone_record" "demo" {
  zone      = "morawskim.pl"
  subdomain = "*.demo"
  fieldtype = "CNAME"
  ttl       = "60"
  target    = "noip.morawskim.pl."
}

resource "ovh_domain_zone_record" "knative_serving" {
  zone      = "morawskim.pl"
  subdomain = "*.knative-serving"
  fieldtype = "CNAME"
  ttl       = "60"
  target    = "noip.morawskim.pl."
}

resource "ovh_domain_zone_record" "ovhcontrol" {
  zone      = "morawskim.pl"
  subdomain = "ovhcontrol"
  fieldtype = "TXT"
  ttl       = "3600"
  target    = "6HofDwn8QItpcZByFAXeBQ"
}

resource "ovh_domain_zone_record" "alias" {
  for_each  = local.aliases
  zone      = "morawskim.pl"
  subdomain = each.key
  fieldtype = "CNAME"
  ttl       = "60"
  target    = each.value
}
