#!/bin/bash

echo "========================================="
echo "     Docker Container Report"
echo "========================================="

REPORT="container-report.txt"

echo "Docker Container Report" > "$REPORT"
echo "Generated on: $(date)" >> "$REPORT"
echo "=========================================" >> "$REPORT"

docker ps -a --format "Name: {{.Names}}
Image: {{.Image}}
Status: {{.Status}}
Ports: {{.Ports}}
----------------------------------------" >> "$REPORT"

echo
echo "Report Generated Successfully!"
echo "Report File: $REPORT"

echo
echo "========================================="
echo "Report Generation Completed"
echo "========================================="
