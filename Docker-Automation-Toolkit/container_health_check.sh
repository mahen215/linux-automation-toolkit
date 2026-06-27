#!/bin/bash

echo " Checking Docker Containers Health..."

docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo "Done." 