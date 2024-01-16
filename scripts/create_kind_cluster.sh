#!/bin/bash

# Replace the cluster name field in the YAML file
yq eval ".name = \"$CLUSTER_NAME\"" -i ${SCRIPT_DIR}/cluster/cluster.yaml

# Create cluster
if kind get clusters | grep -q "^$CLUSTER_NAME$"; then
    echo "The '$CLUSTER_NAME' cluster exists, deleting..."
    kind delete cluster --name $CLUSTER_NAME
else
    echo "The '$CLUSTER_NAME' cluster does not exist"
fi
kind create cluster --config ${SCRIPT_DIR}/cluster/cluster.yaml
