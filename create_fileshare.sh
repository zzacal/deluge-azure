#! /bin/bash

# Create the storage account with the parameters
az storage account create \
    --resource-group $RESOURCE_GROUP \
    --name $STORAGE_ACCOUNT \
    --location $REGION \
    --sku Standard_LRS

# Create the file share
az storage share create \
  --name $SHARE_NAME \
  --account-name $STORAGE_ACCOUNT

