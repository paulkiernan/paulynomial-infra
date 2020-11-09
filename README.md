# Personal Compute Infrastructure

[![GitHub Super-Linter](https://github.com/paulkiernan/paulynomial-infra/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)

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
