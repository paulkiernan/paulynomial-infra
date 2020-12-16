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

resource "digitalocean_record" "root_paulynomial_A" {
  domain = digitalocean_domain.paulynomial.name
  type   = "A"
  name   = "@"
  value  = "104.236.6.204"
}
