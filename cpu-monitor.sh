#!/bin/bash

echo "========================================="
echo "          Linux CPU Monitor"
echo "========================================="

# Display CPU Information
echo "CPU Information:"
lscpu | grep "Model name"

echo

# Display Load Average
load=$(uptime | awk -F'load average:' '{print $2}')

echo "Current CPU Load : $load"

echo

# Get First Load Average Value
cpu_load=$(uptime | awk -F'load average:' '{print $2}' | cut -d',' -f1 | xargs)

echo "1 Minute Load Average : $cpu_load"

echo

# Check CPU Load
if awk "BEGIN {exit !($cpu_load > 2.00)}"
then
    echo " WARNING: High CPU Load Detected!"
else
    echo "CPU Load is Normal."
fi

echo
echo "========================================="
echo "CPU Monitoring Completed"
echo "========================================="
