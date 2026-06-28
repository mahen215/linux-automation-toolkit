#!/bin/bash

echo "========================================="
echo "       Docker Image Builder"
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

# Check Dockerfile
if [ ! -f Dockerfile ]
then
    echo " Dockerfile not found in current directory."
    exit 1
fi

# User Input
read -p "Enter Image Name: " IMAGE_NAME
read -p "Enter Image Tag (default: latest): " IMAGE_TAG

# Default Tag
if [ -z "$IMAGE_TAG" ]
then
    IMAGE_TAG="latest"
fi

echo
echo "Building Docker Image..."
echo

docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

# Check Build Status
if [ $? -eq 0 ]
then
    echo
    echo "Image Built Successfully!"
    echo "Image Name : ${IMAGE_NAME}:${IMAGE_TAG}"

    echo
    echo "Available Images:"
    docker images
else
    echo
    echo "Docker Image Build Failed!"
fi

echo
echo "========================================="
echo "Docker Image Builder Completed"
echo "========================================="





project/
│── Dockerfile
│── app.py
│── requirements.txt
│── docker_image_builder.sh
