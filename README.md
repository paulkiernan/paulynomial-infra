Paul Kiernan's Personal Compute Infrastructure
==============================================

It's the internet.

Requirements
------------

* [ASDF](https://asdf-vm.com/#/)
* [DigitalOcean](https://www.digitalocean.com/)
* [GPG private key](https://keybase.io/paulkiernan)
* [SOPS](https://github.com/mozilla/sops)
* [Terraform](https://www.terraform.io/)

```console
$ yay -S sops git-secret
```

Secrets are generally managed by SOPS.
