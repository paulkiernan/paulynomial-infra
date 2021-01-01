### Personal Website Terraform Config

terraform {
  required_version = "~> 0.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.22"
    }
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

  backend "local" {
    path = "../../../secrets/paulynomial.tfstate"
  }
}

# Secrets management
provider sops {
}

data sops_file aws_secrets {
  source_file = "../../../secrets/aws.yaml"
  input_type  = "yaml"
}

data sops_file digitalocean_secrets {
  source_file = "../../../secrets/digitalocean.yaml"
  input_type  = "yaml"
}

data sops_file ssh_secrets {
  source_file = "../../../secrets/ssh.yaml"
  input_type  = "yaml"
}

# AWS
provider aws {
  region = "us-east-1"
  access_key = data.sops_file.aws_secrets.data.access_key_id
  secret_key = data.sops_file.aws_secrets.data.secret_access_key
}

# DigitalOcean
provider digitalocean {
  token = data.sops_file.digitalocean_secrets.data.api_token
}

# Encryption
provider tls {
}
