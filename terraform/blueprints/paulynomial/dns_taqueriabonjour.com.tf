resource "digitalocean_domain" "taqueriabonjour_com" {
  name = "taqueriabonjour.com"
}

resource "digitalocean_record" "taqueriabonjour_com_NS1" {
  domain = digitalocean_domain.taqueriabonjour_com.name
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
}

resource "digitalocean_record" "taqueriabonjour_com_NS2" {
  domain = digitalocean_domain.taqueriabonjour_com.name
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
}

resource "digitalocean_record" "taqueriabonjour_com_NS3" {
  domain = digitalocean_domain.taqueriabonjour_com.name
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
}

resource "digitalocean_record" "root_taqueriabonjour_com_A" {
  domain = digitalocean_domain.taqueriabonjour_com.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.workload_node.ipv4_address
}

resource "digitalocean_record" "wildcard_taqueriabonjour_com_A" {
  domain = digitalocean_domain.taqueriabonjour_com.name
  type   = "A"
  name   = "*"
  value  = digitalocean_droplet.workload_node.ipv4_address
}
