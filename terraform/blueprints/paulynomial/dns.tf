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
  value  = "159.203.136.105"
}

resource "digitalocean_record" "rancher_paulynomial_A" {
  domain = digitalocean_domain.paulynomial.name
  type   = "A"
  name   = "rancher"
  value  = digitalocean_droplet.rancher_server.ipv4_address
}
