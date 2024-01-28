#!/bin/bash
[ -d "$SCRIPT_DIR" ] || SCRIPT_DIR="."

# Install the nginx application
kubectl apply -f ${SCRIPT_DIR}/manifests/applications/nginx -n applications

# Install ArgoCD
helm upgrade -i argocd argo/argo-cd -n argo -f ${SCRIPT_DIR}/argocd/values.yaml
kubectl apply -f ${SCRIPT_DIR}/manifests/applications/argocd -n argo
