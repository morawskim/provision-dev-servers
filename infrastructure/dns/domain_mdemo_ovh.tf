data "cloudflare_zone" "mdemo" {
  name = "mdemo.ovh"
}

resource "cloudflare_record" "mx_for_subdomain" {
  zone_id  = data.cloudflare_zone.mdemo.id
  name     = "mail"
  type     = "MX"
  ttl      = 60
  value    = "mx1.mail.mdemo.ovh."
  priority = "10"
}

resource "cloudflare_record" "demo_mail" {
  zone_id  = data.cloudflare_zone.mdemo.id
  name     = "mail"
  type     = "CNAME"
  ttl      = 60
  value    = "noip.morawskim.pl."
}

resource "cloudflare_record" "demo_mx" {
  zone_id  = data.cloudflare_zone.mdemo.id
  name     = "mx1.mail"
  type     = "A"
  ttl      = 60
  value    = "46.182.97.244"
}

resource "cloudflare_record" "demo_mail_spf" {
  zone_id  = data.cloudflare_zone.mdemo.id
  name     = "mail"
  type     = "TXT"
  value    = "v=spf1 mx ~all"
}

resource "cloudflare_record" "demo_mail_dmarc" {
  zone_id  = data.cloudflare_zone.mdemo.id
  name     = "_dmarc.mail"
  type     = "TXT"
  value    = "v=DMARC1; p=quarantine; ruf=mailto:postmaster@mail.mdemo.ovh"
}

resource "cloudflare_record" "demo_mail_dkim" {
  zone_id  = data.cloudflare_zone.mdemo.id
  name     = "default._domainkey.mail"
  type     = "TXT"
  value    = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA72ZYzgpYL9Dr7EjY6zRpZOY5ecsxYNPJcMJpsck5GD6h/rn+ug5bMH56qWrxIsabWoOp7i4PRSc7dGz/v/mDTQ0vcmlsUznULmdjtBAMVvSO1qwRpeASyeIEfj5aFbT3YPnNvU/oFzPV/MUf2l83sGFVDtfe0V85b7m+sYatvNFCATM+KeV29iYUB0GUmKHUis0dtfV4YDzU5yeEcc2EESpTlXZ4+3QXSrc12ojggBMvL96L+tQAaxwtoWf2uQZ+/XvN7SyuTHDg+wUfy7Smbi0l1Xcw1VVbe9/01PH7EWFYpkqohqRgmyjH+28tlxu915UrnMMnpBwjU3X8+/kOXQIDAQAB/"
}
