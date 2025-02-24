#!/bin/bash 

size=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')

if [[ $size -le 1,5 ]]; then
    echo "Disk usage is less than 1GB" >&2
    if [ -f 02.log ]; then
		dateend=$(date +%s)
		datetotal=$((dateend-datestart))
		echo "Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." >> 02.log
        fi
    exit 1
else
    echo "Disk usage is greater than 1GB"
fi