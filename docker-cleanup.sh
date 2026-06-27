#!/bin/bash

echo "========================================="
echo "        Docker Cleanup Script"
echo "========================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed."
    exit 1
fi

echo "Removing stopped containers..."
docker container prune -f

echo
echo "Removing unused images..."
docker image prune -a -f

echo
echo "Removing unused volumes..."
docker volume prune -f

echo
echo "Removing unused networks..."
docker network prune -f

echo
echo "========================================="
echo "Docker Cleanup Completed Successfully"
echo "========================================="
