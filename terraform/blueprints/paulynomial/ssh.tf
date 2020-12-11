# Key pair used for SSH accesss
resource "digitalocean_ssh_key" "ssh_key" {
  name       = "${var.prefix}-droplet-ssh-key"
  public_key = data.sops_file.ssh_secrets.data.public_key
}
