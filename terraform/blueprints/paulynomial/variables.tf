# Variables for DO infrastructure module

variable "do_region" {
  type        = string
  description = "DigitalOcean region used for all resources"
  default     = "nyc1"
}

variable "prefix" {
  type        = string
  description = "Prefix added to names of all resources"
  default     = "paulynomial"
}

variable "droplet_size" {
  type        = string
  description = "Droplet size used for all droplets"
  default     = "s-1vcpu-2gb"
}

variable "docker_version" {
  type        = string
  description = "Docker version to install on nodes"
  default     = "19.03"
}

variable "rke_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for Rancher server RKE cluster"
  default     = "v1.18.8-rancher1-1"
}

variable "workload_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for managed workload cluster"
  default     = "v1.17.11-rancher1-1"
}

variable "cert_manager_version" {
  type        = string
  description = "Version of cert-manager to install alongside Rancher (format: 0.0.0)"
  default     = "0.15.1"
}

variable "rancher_version" {
  type        = string
  description = "Rancher server version (format: v0.0.0)"
  default     = "v2.4.8"
}

# Local variables used to reduce repetition
locals {
  node_username = "root"
}
