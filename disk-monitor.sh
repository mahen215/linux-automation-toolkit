#!/bin/bash

echo "========================================="
echo "        Linux Disk Monitor"
echo "========================================="

# Show Disk Usage
echo "Disk Usage Details:"
df -h

echo

# Get Root Partition Usage
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Root Partition Usage : ${disk_usage}%"

echo

# Check Disk Usage
if [ "$disk_usage" -ge 80 ]
then
    echo "WARNING: Disk usage is above 80%!"
else
    echo "Disk usage is under control."
fi

echo
echo "========================================="
echo "Disk Monitoring Completed"
echo "========================================="
