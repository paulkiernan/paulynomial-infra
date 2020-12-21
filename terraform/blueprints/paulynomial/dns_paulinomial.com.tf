resource "digitalocean_domain" "paulinomial" {
  name = "paulinomial.com"
}

resource "digitalocean_record" "paulinomial_NS1" {
  domain = digitalocean_domain.paulinomial.name
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
}

resource "digitalocean_record" "paulinomial_NS2" {
  domain = digitalocean_domain.paulinomial.name
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
}

resource "digitalocean_record" "paulinomial_NS3" {
  domain = digitalocean_domain.paulinomial.name
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
}

resource "digitalocean_record" "root_paulinomial_A" {
  domain = digitalocean_domain.paulinomial.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.workload_node.ipv4_address
}

resource "digitalocean_record" "wildcard_paulinomial_A" {
  domain = digitalocean_domain.paulinomial.name
  type   = "A"
  name   = "*"
  value  = digitalocean_droplet.workload_node.ipv4_address
  ttl    = 300
}
