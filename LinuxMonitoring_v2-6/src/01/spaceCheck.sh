#!/bin/bash 

size=$(df -m / | awk 'NR==2 {print $4}')

if [[ $size -le 1576 ]]; then
    echo "Disk usage is less than 1GB"
    exit 1
else
    echo "Disk usage is greater than 1GB"
fi