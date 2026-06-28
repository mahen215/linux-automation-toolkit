#!/bin/bash

echo "========================================="
echo "      Docker System Information"
echo "========================================="

# Check Docker Installation
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed."
    exit 1
fi

# Check Docker Service
if ! docker info &> /dev/null
then
    echo "Docker daemon is not running."
    exit 1
fi

echo "Docker is installed and running."
echo

echo "Docker Version:"
docker --version

echo
echo "Running Containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"

echo
echo "All Containers:"
docker ps -a --format "table {{.Names}}\t{{.Status}}"

echo
echo "Available Images:"
docker images

echo
echo "Docker Volumes:"
docker volume ls

echo
echo "Docker Networks:"
docker network ls

echo
echo "Docker Disk Usage:"
docker system df

echo
echo "========================================="
echo "Docker System Information Completed"
echo "========================================="
