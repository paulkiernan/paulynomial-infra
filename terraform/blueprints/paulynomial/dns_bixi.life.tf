resource "digitalocean_domain" "bixi" {
  name = "bixi.life"
}

resource "digitalocean_record" "bixi_NS1" {
  domain = digitalocean_domain.bixi.name
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
}

resource "digitalocean_record" "bixi_NS2" {
  domain = digitalocean_domain.bixi.name
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
}

resource "digitalocean_record" "bixi_NS3" {
  domain = digitalocean_domain.bixi.name
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
}

resource "digitalocean_record" "root_bixi_A" {
  domain = digitalocean_domain.bixi.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.workload_node.ipv4_address
}

resource "digitalocean_record" "wildcard_bixi_A" {
  domain = digitalocean_domain.bixi.name
  type   = "A"
  name   = "*"
  value  = digitalocean_droplet.workload_node.ipv4_address
}
