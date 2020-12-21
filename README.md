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

Secrets are generally managed by SOPS. Encrypted kube configs can be applied
via:

```bash
sops -d kube/taqueria-bonjour/secrets.enc.yaml | \
kubectl --kubeconfig secrets/kube_config_workload.yaml \
    apply -f -
```
