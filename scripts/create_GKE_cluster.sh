#!/bin/bash

echo "Cluster name is: ${CLUSTER_NAME}"
echo "Region is: ${REGION}"

# Parameters for cluster creation
NUM_NODES=1 # Default number of nodes PER ZONE!!
MACHINE_TYPE=e2-medium # Default machine type

# Create GKE cluster
if gcloud container clusters describe $CLUSTER_NAME --region $REGION --project $PROJECT_ID > /dev/null 2>&1; then
    echo "Cluster $CLUSTER_NAME already exists in region $REGION."
else
    # Create the cluster if it doesn't exist
    # gcloud container clusters create-auto $CLUSTER_NAME \
    #     --region $REGION \
    #     --project $PROJECT_ID

    # Create the cluster if it doesn't exist
    gcloud container clusters create $CLUSTER_NAME \
        --region $REGION \
        --num-nodes $NUM_NODES \
        --machine-type $MACHINE_TYPE \
        --gateway-api standard \
        --project $PROJECT_ID
fi