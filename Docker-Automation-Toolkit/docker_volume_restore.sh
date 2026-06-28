#!/bin/bash

echo "========================================="
echo "      Docker Volume Restore"
echo "========================================="

read -p "Enter Volume Name: " VOLUME_NAME
read -p "Enter Backup File Name (.tar.gz): " BACKUP_FILE

if [ ! -f "$BACKUP_FILE" ]
then
    echo "Backup file not found."
    exit 1
fi

if ! docker volume inspect "$VOLUME_NAME" &> /dev/null
then
    echo "Creating Volume..."
    docker volume create "$VOLUME_NAME"
fi

echo
echo "Restoring Backup..."

docker run --rm \
-v ${VOLUME_NAME}:/volume \
-v $(pwd):/backup \
alpine \
tar -xzf /backup/${BACKUP_FILE} -C /volume

if [ $? -eq 0 ]
then
    echo "Volume Restored Successfully!"
else
    echo " Restore Failed!"
fi
