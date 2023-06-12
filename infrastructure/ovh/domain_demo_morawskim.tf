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

resource "ovh_domain_zone_record" "demo_mail_spf" {
  zone      = "mdemo.ovh"
  subdomain = "mail"
  fieldtype = "TXT"
  target    = "v=spf1 mx ~all"
}

resource "ovh_domain_zone_record" "demo_mx_spf" {
  zone      = "mdemo.ovh"
  subdomain = "mx1.mail"
  fieldtype = "TXT"
  target    = "v=spf1 mx ~all"
}

resource "ovh_domain_zone_record" "demo_mail_dmarc" {
  zone      = "mdemo.ovh"
  subdomain = "_dmarc.mail"
  fieldtype = "TXT"
  target    = "v=DMARC1; p=quarantine; ruf=mailto:postmaster@mail.mdemo.ovh"
}

resource "ovh_domain_zone_record" "demo_mail_dkim" {
  zone      = "mdemo.ovh"
  subdomain = "default._domainkey.mail"
  fieldtype = "TXT"
  target    = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA72ZYzgpYL9Dr7EjY6zRpZOY5ecsxYNPJcMJpsck5GD6h/rn+ug5bMH56qWrxIsabWoOp7i4PRSc7dGz/v/mDTQ0vcmlsUznULmdjtBAMVvSO1qwRpeASyeIEfj5aFbT3YPnNvU/oFzPV/MUf2l83sGFVDtfe0V85b7m+sYatvNFCATM+KeV29iYUB0GUmKHUis0dtfV4YDzU5yeEcc2EESpTlXZ4+3QXSrc12ojggBMvL96L+tQAaxwtoWf2uQZ+/XvN7SyuTHDg+wUfy7Smbi0l1Xcw1VVbe9/01PH7EWFYpkqohqRgmyjH+28tlxu915UrnMMnpBwjU3X8+/kOXQIDAQAB/"
}
