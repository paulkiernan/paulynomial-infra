resource "digitalocean_domain" "paulynomial" {
  name = "paulynomial.com"
}

resource "digitalocean_record" "paulynomial_NS1" {
  domain = digitalocean_domain.paulynomial.name
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
}

resource "digitalocean_record" "paulynomial_NS2" {
  domain = digitalocean_domain.paulynomial.name
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
}

resource "digitalocean_record" "paulynomial_NS3" {
  domain = digitalocean_domain.paulynomial.name
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
}

# Mailgun
resource "digitalocean_record" "email_paulynomial_CNAME" {
  domain = digitalocean_domain.paulynomial.name
  type   = "CNAME"
  name   = "email"
  value  = "mailgun.org."
}

resource "digitalocean_record" "root_paulynomial_MXA" {
  domain   = digitalocean_domain.paulynomial.name
  type     = "MX"
  name     = "@"
  value    = "mxa.mailgun.org."
  priority = 10
}

resource "digitalocean_record" "root_paulynomial_MXB" {
  domain   = digitalocean_domain.paulynomial.name
  type     = "MX"
  name     = "@"
  value    = "mxb.mailgun.org."
  priority = 10
}

resource "digitalocean_record" "mailgun_verification_paulynomial_TXT" {
  domain = digitalocean_domain.paulynomial.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:mailgun.org ~all"
}

resource "digitalocean_record" "k1_domainkey_paulynomial_MXB" {
  domain = digitalocean_domain.paulynomial.name
  type   = "TXT"
  name   = "k1._domainkey"
  value  = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDSdTiengHWy2SpniS4ZLGAgkXS9pvVu+ha6oqPkQuSb1U1gHQdHGjSsFAp3i737J/eHPgUAn761cu2uzo3m6PsREK4EScK/ORjtnPTxwXPy7+Zi+KomSJ9aOdQaggvI/Sb1iINe32j1yWSJjHwWsQkKPVM8Ihp2lk6dPyJ6+srLwIDAQAB"
}

# Google Site Verification
resource "digitalocean_record" "google_verification_paulynomial_TXT" {
  domain = digitalocean_domain.paulynomial.name
  type   = "TXT"
  name   = "@"
  value  = "google-site-verification=kp4L1kRAl-SVwApMou_MTXIe4DXW5C3cGQXDBSaM6Gk"
}

# Keybase Site Verification
resource "digitalocean_record" "keybase_verification_paulynomial_TXT" {
  domain = digitalocean_domain.paulynomial.name
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=fpvHlqZcsUawgG7w7hWyMSqk--ywEzv8rtNr79xnU6w"
}

# Apps
resource "digitalocean_record" "root_paulynomial_A" {
  domain = digitalocean_domain.paulynomial.name
  type   = "A"
  name   = "@"
  value  = "159.203.136.105"
}

resource "digitalocean_record" "rancher_paulynomial_A" {
  domain = digitalocean_domain.paulynomial.name
  type   = "A"
  name   = "rancher"
  value  = digitalocean_droplet.rancher_server.ipv4_address
  ttl    = 300
}
