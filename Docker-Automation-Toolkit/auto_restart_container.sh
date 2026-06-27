#!/bin/bash

CONTAINER_NAME=$1

if [ -z "$CONTAINER_NAME" ]; then
  echo "Usage: ./auto_restart_container.sh container_name"
  exit 1
fi

echo "Restarting container: $CONTAINER_NAME"

docker restart $CONTAINER_NAME

echo "Done."
