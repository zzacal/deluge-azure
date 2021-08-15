#! /bin/bash

STORAGE_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT --query "[0].value" --output tsv)

az container create \
    --resource-group $RESOURCE_GROUP \
    --name $CONTAINER_NAME \
    --image $IMAGE \
    --os-type Linux \
    --dns-name-label $DNS_LABEL \
    --ip-address public \
    --ports 80 8112 6881 \
    --azure-file-volume-account-name $STORAGE_ACCOUNT \
    --azure-file-volume-account-key $STORAGE_KEY \
    --azure-file-volume-share-name $SHARE_NAME \
    --azure-file-volume-mount-path /config/ \
    --environment-variables 'PUID'='1000' 'PGID'='1000' 'TZ'='America/Los Angeles' 'DELUGE_LOGLEVEL'='error'

