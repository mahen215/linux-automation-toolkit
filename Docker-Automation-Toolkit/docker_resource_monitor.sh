#!/bin/bash

echo "========================================="
echo "     Docker Resource Monitor"
echo "========================================="

# Check Docker Installation
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed."
    exit 1
fi

# Check Docker Daemon
if ! docker info &> /dev/null
then
    echo "Docker daemon is not running."
    exit 1
fi

# Check Running Containers
if [ -z "$(docker ps -q)" ]
then
    echo "No running containers found."
    exit 1
fi

echo "Container Resource Usage"
echo

docker stats --no-stream

echo
echo "========================================="
echo "Resource Monitoring Completed"
echo "========================================="
