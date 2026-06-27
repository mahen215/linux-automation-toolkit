#!/bin/bash

IMAGE=$1
BACKUP_NAME="${IMAGE//:/_}_backup.tar"

echo " Saving Docker image: $IMAGE"

docker save -o $BACKUP_NAME $IMAGE

echo "Saved as $BACKUP_NAME"
