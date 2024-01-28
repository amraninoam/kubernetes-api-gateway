#!/bin/bash
[ -d "$SCRIPT_DIR" ] || SCRIPT_DIR="."

# Create relevant namespaces
kubectl apply -f ${SCRIPT_DIR}/manifests/namespaces

# Install the API Gateway CRDs
# from: https://gateway-api.sigs.k8s.io/guides/#installing-gateway-api
# kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml

# Install the Gateway
kubectl apply -f ${SCRIPT_DIR}/manifests/administration