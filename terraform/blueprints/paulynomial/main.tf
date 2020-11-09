### Personal Website Terraform Config

terraform {
  required_version = "~> 0.13.5"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.1.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.5.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.0.0"
    }
  }
}

# Secrets management
provider sops {
}

data sops_file digitalocean_secrets {
  source_file = "../../../secrets/digitalocean.yaml"
  input_type  = "yaml"
}

data sops_file ssh_secrets {
  source_file = "../../../secrets/ssh.yaml"
  input_type  = "yaml"
}

# DigitalOcean
provider digitalocean {
  token = data.sops_file.digitalocean_secrets.data.api_token
}

# Encryption
provider tls {
}
