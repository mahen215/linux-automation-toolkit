#!/bin/bash

echo "========================================="
echo "         Log Cleanup Script"
echo "========================================="

# Log Directory
read -p "Enter Log Directory: " log_dir

# Delete logs older than 7 days
find "$log_dir" -type f -name "*.log" -mtime +7 -delete

echo

if [ $? -eq 0 ]
then
    echo " Old log files deleted successfully."
else
    echo "Failed to clean log files."
fi

echo
echo "========================================="
echo "Log Cleanup Completed"
echo "========================================="
