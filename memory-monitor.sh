#!/bin/bash

echo "========================================="
echo "        Linux Memory Monitor"
echo "========================================="

# Display Memory Information
echo "Memory Usage Details:"
free -h

echo

# Get Memory Usage Percentage
memory_usage=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

echo "Memory Usage : ${memory_usage}%"

echo

# Check Memory Usage
if [ "$memory_usage" -ge 75 ]
then
    echo "️ WARNING: Memory usage is above 75%!"
else
    echo "Memory usage is normal."
fi

echo
echo "========================================="
echo "Memory Monitoring Completed"
echo "========================================="
