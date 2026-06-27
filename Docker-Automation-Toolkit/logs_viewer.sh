#!/bin/bash

read -p "Enter container name: " cname

if [ -z "$cname" ]; then
  echo "Container name required"
  exit 1
fi

echo "🧾 Showing live logs for $cname..."
docker logs -f $cname
