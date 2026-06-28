#!/bin/bash

echo "========================================="
echo "      Docker Volume Backup"
echo "========================================="

# Check Docker Installation
if ! command -v docker &> /dev/null
then
    echo " Docker is not installed."
    exit 1
fi

# Check Docker Daemon
if ! docker info &> /dev/null
then
    echo " Docker daemon is not running."
    exit 1
fi

# User Input
read -p "Enter Volume Name: " VOLUME_NAME
read -p "Enter Backup File Name (without extension): " BACKUP_NAME

# Check Volume Exists
if ! docker volume inspect "$VOLUME_NAME" &> /dev/null
then
    echo " Volume '$VOLUME_NAME' not found."
    exit 1
fi

echo
echo "Creating Backup..."

docker run --rm \
-v ${VOLUME_NAME}:/volume \
-v $(pwd):/backup \
alpine \
tar -czf /backup/${BACKUP_NAME}.tar.gz -C /volume .

# Check Status
if [ $? -eq 0 ]
then
    echo
    echo "Backup Created Successfully!"
    echo "Backup File : $(pwd)/${BACKUP_NAME}.tar.gz"
else
    echo
    echo " Backup Failed!"
fi

echo
echo "========================================="
echo "Backup Process Completed"
echo "========================================="
