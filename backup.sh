#!/bin/bash

echo "========================================="
echo "         Backup Automation"
echo "========================================="

# Source Directory
read -p "Enter Source Directory: " source

# Backup Directory
read -p "Enter Backup Directory: " backup

# Current Date
today=$(date +%Y-%m-%d_%H-%M-%S)

# Backup File Name
filename="backup_$today.tar.gz"

# Create Backup
tar -czf "$backup/$filename" "$source"

echo

# Check Backup Status
if [ $? -eq 0 ]
then
    echo " Backup Created Successfully"
    echo "Backup File : $backup/$filename"
else
    echo "Backup Failed"
fi

echo
echo "========================================="
echo "Backup Process Completed"
echo "========================================="
