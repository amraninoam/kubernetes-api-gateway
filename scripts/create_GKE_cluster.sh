#!/bin/bash

echo "Cluster name is: ${CLUSTER_NAME}"
echo "Region is: ${REGION}"

# Create GKE cluster
if gcloud container clusters describe $CLUSTER_NAME --region $REGION --project $PROJECT_ID > /dev/null 2>&1; then
    echo "Cluster $CLUSTER_NAME already exists in region $REGION."
else
    # Create the cluster if it doesn't exist
    gcloud container clusters create-auto $CLUSTER_NAME \
        --region $REGION \
        --project $PROJECT_ID
fi