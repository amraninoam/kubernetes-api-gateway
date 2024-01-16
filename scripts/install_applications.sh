#!/bin/bash

# Install the nginx application
kubectl apply -f ${SCRIPT_DIR}/manifests/applications/nginx -n applications