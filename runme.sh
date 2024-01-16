#!/bin/bash

# Set environment variables from .env
set -o allexport
export SCRIPT_DIR=$(dirname "$0")
source ${SCRIPT_DIR}/.env
set +o allexport

# Create cluster
# ${SCRIPT_DIR}/scripts/create_kind_cluster.sh #uncomment to create kind cluster
${SCRIPT_DIR}/scripts/create_GKE_cluster.sh #uncomment to create GKE cluster

# Config cluster
${SCRIPT_DIR}/scripts/config_cluster.sh

# Install applications cluster
${SCRIPT_DIR}/scripts/install_applications.sh
