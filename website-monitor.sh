#!/bin/bash

echo "========================================="
echo "       Website Status Checker"
echo "========================================="

# Take website URL from user
read -p "Enter Website URL: " website

# Get HTTP Status Code
status=$(curl -o /dev/null -s -w "%{http_code}" $website)

echo
echo "Website : $website"
echo "Status  : $status"

echo

if [ "$status" -eq 200 ]
then
    echo " Website is UP"
else
    echo "Website is DOWN or Not Reachable"
fi

echo
echo "========================================="
echo "Website Monitoring Completed"
echo "========================================="
