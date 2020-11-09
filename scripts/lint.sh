#!/bin/bash

set -eu

REPO_ROOT_DIR=$(git rev-parse --show-toplevel)

docker run \
    --rm \
    -e FILTER_REGEX_EXCLUDE=userdata_quickstart_node.template \
    -e FILTER_REGEX_EXCLUDE=userdata_rancher_server.template \
    -e OUTPUT_DETAILS=detailed \
    -e RUN_LOCAL=true \
    -e VALIDATE_ALL_CODEBASE=true \
    -e VALIDATE_JSON=true \
    -e VALIDATE_MARKDOWN=true \
    -e VALIDATE_TERRAFORM=true \
    -e VALIDATE_TERRAFORM_TERRASCAN=true \
    -e VALIDATE_YAML=true \
    -v "$REPO_ROOT_DIR":/tmp/lint \
    github/super-linter
