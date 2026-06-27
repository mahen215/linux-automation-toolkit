#!/bin/bash

echo "========================================="
echo "        Linux Service Checker"
echo "========================================="

# Ask user for service name
read -p "Enter Service Name: " service

# Check service status
status=$(systemctl is-active $service 2>/dev/null)

if [ "$status" = "active" ]
then
    echo " $service service is Running."
else
    echo "$service service is NOT Running."
fi

echo
echo "========================================="
echo "Service Check Completed"
echo "========================================="
