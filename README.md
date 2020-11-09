# Personal Compute Infrastructure

![Super-Linter](https://github.com/paulkiernan/paulynomial-infra/workflows/Super-Linter/badge.svg)

It's in the cloud.

## Requirements

* [ASDF](https://asdf-vm.com/)
* [DigitalOcean](https://www.digitalocean.com/)
* [GPG private key](https://keybase.io/paulkiernan)
* [SOPS](https://github.com/mozilla/sops)
* [Terraform](https://www.terraform.io/)

```bash
yay -S sops
```

Secrets are generally managed by SOPS.
