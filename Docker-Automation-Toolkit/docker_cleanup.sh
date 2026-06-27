#!/bin/bash

echo "🧹 Cleaning unused Docker resources..."

docker system prune -af

docker volume prune -f

echo "Cleanup completed."
