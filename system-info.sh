#!/bin/bash

echo "========================================="
echo "      Linux System Health Check"
echo "========================================="

# Hostname
echo "Hostname      : $(hostname)"

# Current User
echo "Current User  : $(whoami)"

# Current Date
echo "Date          : $(date)"

# Kernel Version
echo "Kernel Version: $(uname -r)"

# CPU Load
echo "CPU Load      : $(uptime | awk -F'load average:' '{print $2}')"

echo
echo "========== Memory Usage =========="
free -h

echo
echo "========== Disk Usage =========="
df -h /

# Root Disk Usage Percentage
usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo
if [ "$usage" -ge 80 ]; then
    echo "️ Warning: Disk Usage is ${usage}%"
else
    echo "Disk Usage is Normal (${usage}%)"
fi

echo
echo "========== System Uptime =========="
uptime -p

echo
echo "========================================="
echo "System Health Check Completed Successfully"
echo "========================================="
