#!/bin/bash

set -eux

REPO_ROOT_DIR=$(git rev-parse --show-toplevel)

sops \
    --decrypt \
    --in-place \
    "${REPO_ROOT_DIR}/terraform/blueprints/paulynomial/terraform.tfstate"
