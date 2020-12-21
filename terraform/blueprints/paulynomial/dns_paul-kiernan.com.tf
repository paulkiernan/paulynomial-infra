resource "digitalocean_domain" "paul_kiernan" {
  name = "paul-kiernan.com"
}

resource "digitalocean_record" "paul_kiernan_NS1" {
  domain = digitalocean_domain.paul_kiernan.name
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
}

resource "digitalocean_record" "paul_kiernan_NS2" {
  domain = digitalocean_domain.paul_kiernan.name
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
}

resource "digitalocean_record" "paul_kiernan_NS3" {
  domain = digitalocean_domain.paul_kiernan.name
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
}

resource "digitalocean_record" "root_paul_kiernan_A" {
  domain = digitalocean_domain.paul_kiernan.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.workload_node.ipv4_address
}

resource "digitalocean_record" "wildcard_paul_kiernan_A" {
  domain = digitalocean_domain.paul_kiernan.name
  type   = "A"
  name   = "*"
  value  = digitalocean_droplet.workload_node.ipv4_address
  ttl    = 300
}

