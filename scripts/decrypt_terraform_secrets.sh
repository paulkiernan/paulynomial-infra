#!/bin/bash
set -eux

REPO_ROOT_DIR=$(git rev-parse --show-toplevel)

TERRAFORM_SECRETS=(
    "${REPO_ROOT_DIR}/secrets/paulynomial.tfstate"
    "${REPO_ROOT_DIR}/secrets/kube_config_server.yaml"
    "${REPO_ROOT_DIR}/secrets/kube_config_workload.yaml"
)

for _secret_path in "${TERRAFORM_SECRETS[@]}"; do
    sops \
        --decrypt \
        --in-place \
        "$_secret_path"
done
